# Import Library
import pandas as pd
import numpy as np


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