# Import Library
import pandas as pd
import numpy as np
import os 
import glob
from timeit import default_timer as timer
from pathlib import Path


# Resample Frequency Function
def resample_df(df, freq):
    'Resample df by specifying freq (int)'
    new_df = pd.DataFrame(columns = df.columns)
    for index in (df['index']):
        if index==1:
            new_df.loc[0,:] = df.iloc[0,:]
        elif index%freq == 0:
            new_df.loc[int(index/freq),:] = df.iloc[index-1,:]
    return new_df

# Remove Outliers Function
def remove_outliers(df):
    '''function to delete row of the dataframe
    when the value of JSRoll_Sim is to high (0.6 or -0.6)'''

    js_roll = df['JSRoll_Sim'].tolist()

    idx_list = []
    for index, value in enumerate(js_roll):
        if value >= 0.6 or value <=-0.6:
            idx_list.append(index)
    
    # Drop index with outliers
    if len(idx_list)!=0:
        for i in idx_list:
            df.drop(i, axis=0, inplace=True)
    else:
        pass
    return df

# Data Smoothing Function
def data_smoothing(df):
    '''Smoothing joystick roll input when roll limiter
    is activated because it makes the graph oscillating'''

    # Convert roll limiter status and js roll to array
    roll_lim_stat = df['Roll_lim_stat'].values
    js_roll_sim = df['JSRoll_Sim'].values
    
    # Find index when roll limiter status is 1 
    index_list = [] 
    for index, value in enumerate(roll_lim_stat):
        if value == 1:
            index_list.append(index)
    
    # Replace value of js roll when the index met roll lim = 1
    # Starting from index > 1 to support data interpolation
    for index in index_list:
        if index > 1:
            js_roll_sim[index] = np.nan
        
    # Convert to pandas series to be interpolated using pad method
    converted = pd.Series(js_roll_sim)
    converted = converted.interpolate(method = 'linear')
    
    # Assign back to dataframe
    df.loc[1:,['JSRoll_Sim']] = converted
    return df

# Data Slicing Function
def data_slicing(df):
    '''Slice data before AC turn back to the last WP'''

    # Find number of waypoints that create the mission
    num_of_wp = np.unique(df['num_wp'])
    
    last_wp_list = []
    # Find index where AC is heading to last waypoint
    for index,value in enumerate(df['num_wp']):
        if value == num_of_wp[-1] and \
        (df['wp_dist'][index]<=500 and df['wp_dist'][index]>=400):
            last_wp_list.append(index)
    
    # Cut the dataframe until the last index of final_index
    df = df[:last_wp_list[-1]]
    return df  

# Preprocessing All CSV Files Function
def preprocess_csv_files(source_path, destination_path):
    '''Iterate over all csv files in a folder,
    give column name, apply resample, remove outliers,
    data smoothing & slicing function and
    save as new csv files on destination path folder'''

    # Initiate Timer 
    top_timer = timer()
    start_time = timer()
    
    # Creating empty list to store how many data is used
    values = []
    
    # Define csv path
    csv_path = glob.glob(source_path)
    
    for csv_file in csv_path:
        df = pd.read_csv(csv_file)
        
        column_list = ['index','lat', 'lon', 'alt', 'X', 'Y', 'Z',
                       'psi', 'theta', 'phi','TAS', 'JSHead', 'JSPitch', 'JSRoll',
                      'throttle', 'thrust', 'fuel_flow', 'rudder', 'elevator',
                      'left_ail', 'right_ail', 'ground_speed', 'wind_speed', 'roll_rate',
                      'num_wp', 'x_wp', 'y_wp', 'z_wp', 'wp_dist', 'yaw_reff',
                      'wp_stat', 'ph_stat', 'wl_stat', 'yaw_error', 'JSRoll_Sim', 'Roll_lim_stat', 'KP', 'KD', 'error_rate', 'distance']

        df.columns = column_list

        # Using pre-built function to preprocess dataframe
        df = data_smoothing(df)
        df = data_slicing(df)
        df = resample_df(df, freq = 4) # Resample with frequency = 4s
        df = remove_outliers(df)
        
        # Save as new CSV files
        _, file_name = csv_file.split('\\')
        if os.path.exists(Path(destination_path)):
            df.to_csv(os.path.join(destination_path,file_name), index=False)
        else:
            print('Please Create the Folder First!')
            
        print('Done:', file_name)   
        print('-------------------------------------------------------------------------------------------------------------------------------')
        values.append('1')
        
    print("Time used: {:.2f} minutes".format((timer() - start_time)/60))
    start_time   = timer()
    print("Number of used data:", len(values)) 

# Concatenate CSV Function
def concat_csv(csv_path, file_name):
    '''Concat csv in folder become one set of csv with assigned file name'''
    os.chdir(csv_path)
    extension = 'csv'
    all_filenames = [i for i in glob.glob('*.{}'.format(extension))]
    
    # Combine all files in the list
    combined_csv = pd.concat([pd.read_csv(f) for f in all_filenames ])
    # Export to csv with assigned name
    combined_csv.to_csv(file_name, index=False, encoding='utf-8-sig')

# Create correlation table Function
def correlation(df,var):
    """clean up NaN values after using correlation function, convert it into percentage,
    convert it as dataframe both for positive and negative value,
    and sort descending for the absolute value.
    (df is dataframe that want to be analyzed, and var is name of parameter which we want to correlate)"""
    
    # Positive values section
    # Calculating pos_correlation of all dataframe in percent
    corr = np.round(df.corr()*100,2)
    
    # Sort pos_correlation value descending
    corr = corr.sort_values(by=[var], ascending=False)[var]
    corr = corr.to_frame() # Convert series to DataFrame
    corr = corr.dropna() # Drop NaN values of the DataFrame

    # Create new column for positive pos_correlation value
    pos_corr = corr[[var]].copy() # Create a copy of correlation dataframe
    pos_corr['pos_corr_'+ var] = pos_corr[var].where(pos_corr[var]>0)

    # Drop original column
    pos_corr.drop(var,axis=1,inplace=True)

    # Drop NaN value as a result of filtering positive value only
    pos_corr = pos_corr.dropna(subset=['pos_corr_'+ var])
    
# -----------------------------------------------------------------------
    # Negative values section
    # Create new column for negative correlation value
    neg_corr = corr[[var]].copy() # Create a copy of correlation dataframe
    neg_corr['neg_corr_'+ var] = neg_corr[var].where(neg_corr[var]<0)

    # Drop original column
    neg_corr.drop(var,axis=1,inplace=True)

    # Drop NaN value as a result of filtering positive value only
    neg_corr = neg_corr.dropna(subset=['neg_corr_'+ var])
    neg_corr = neg_corr.sort_values(by=['neg_corr_'+ var],axis=0, ascending=True)

    return pos_corr, neg_corr

# Function to create roll criteria each section
def roll_section(df):
    indexes, _ = index_wp(df)
    str_roll_min = []
    str_roll_max = []
    avg_roll_list = []
    std_roll_list = []

    for i in range(len(indexes)-1):
        min_roll = np.round(np.min(df['phi'][indexes[i]:indexes[i+1]]),2)
        max_roll = np.round(np.max(df['phi'][indexes[i]:indexes[i+1]]),2)
        avg_roll = np.round(np.mean(df['phi'][indexes[i]:indexes[i+1]]),2)
        std_roll = np.round(np.std(df['phi'][indexes[i]:indexes[i+1]]),2)

        str_roll_min.append(min_roll)
        str_roll_max.append(max_roll)
        avg_roll_list.append(avg_roll)
        std_roll_list.append(std_roll)
        
    return str_roll_min, str_roll_max, avg_roll_list, std_roll_list

# Function to calculate average cross track distance each section
def track_error_section(df):
    indexes, _ = index_wp(df)
    track_error = track_error_dist(df)
    avg_te_list = []
    std_te_list = []
    
    for i in range(len(indexes)-1):
        avg_te = np.round(np.mean(track_error[indexes[i]:indexes[i+1]]),2)
        std_te = np.round(np.std(track_error[indexes[i]:indexes[i+1]]),2)

        avg_te_list.append(avg_te)
        std_te_list.append(std_te)
        
    return avg_te_list, std_te_list

# Function that return 4 dataframes from roll criteria each section
def roll_criteria(df):
        # Create new csv
        df_character = pd.DataFrame(columns=['current_wp', 'next_wp','section_min_roll', 'section_max_roll'])

        # Define variable needed
        roll_min, roll_max, roll_avg, roll_std = roll_section(df)
        current_wp = np.arange(len(np.unique(df['num_wp'])))
        next_wp = current_wp + 1 

        # Assign variable to new dataframe
        df_character['current_wp'] = current_wp
        df_character['next_wp'] = next_wp
        df_character['section_min_roll'] = roll_min
        df_character['section_max_roll'] = roll_max

        # Split dataframe based on training roll angle character
        df_char1 = df_character[(df_character.section_min_roll>=-10) & (df_character.section_max_roll<=10)]
        df_char2 = df_character[(df_character.section_min_roll>=-10) & (df_character.section_max_roll<=40)]
        df_char3 = df_character[(df_character.section_min_roll>=-40) & (df_character.section_max_roll<=10)]
        df_char4 = df_character[(df_character.section_min_roll>=-40) & (df_character.section_max_roll<=40)]
        
        return df_char1, df_char2, df_char3, df_char4

# Function to calculate angle difference from one line to another line
def angle_diff(df):
    x , y = unique_coor(df)
    x.insert(0,0)
    y.insert(0,0)
    
    # Define distance from each wp coordinates
    new_x = []
    for i in range(len(x)-1):
        dist = x[i+1] - x[i]
        new_x.append(dist)
    new_y = []
    for i in range(len(y)-1):
        dist = y[i+1] - y[i]
        new_y.append(dist)
    
    # Store each inner angle
    store_angle = [] 
    for i in range(len(new_x)):
        angle = np.round(math.degrees(math.atan(new_y[i]/new_x[i])),2)
        store_angle.append(angle)

    diff_store = []
    for i in range(len(store_angle)-1):
        if store_angle[i+1]>0 and store_angle[i]>0:
            diff = np.round((store_angle[i] - store_angle[i+1]),2)
            diff_store.append(diff)
        elif store_angle[i+1]<=0 and store_angle[i]>=0:
            diff = -1*(180 - abs(store_angle[i]) - abs(store_angle[i+1]))
            diff_store.append(diff)
        elif store_angle[i+1]>=0 and store_angle[i]<=0:
            diff = 180 - abs(store_angle[i]) - abs(store_angle[i+1])
            diff_store.append(diff)
        elif store_angle[i+1]<0 and store_angle[i]<0:
            diff = np.round((store_angle[i] - store_angle[i+1]),2)
            diff_store.append(diff)
        
    return diff_store   

