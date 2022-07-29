# Import Library
import pandas as pd
import numpy as np

# Unique coordinate function
def unique_coor:
    """Calculate unique coordinate of waypoint defined"""

    # Creating waypoint x,y, and waypoint -n list from dataframe
    wp_x_list = df['x_wp'].tolist()
    wp_y_list = df['y_wp'].tolist()
    num_wp_list = df['num_wp'].tolist()

    # Create list of x waypoint in sequence refer to waypoint -n index
    indexes_x = np.unique(num_wp_list,return_index=True)[1]  #Showing first occurance index 
    xx = [wp_x_list[index] for index in sorted(indexes_x)]
  
    # Create list of y waypoint in sequence refer to waypoint -n index
    indexes_y = np.unique(num_wp_list,return_index=True)[1]
    yy = [wp_y_list[index] for index in sorted(indexes_y)]
 
    return xx,  yy   

# index_wp function
def index_wp(df):
    '''Find index where waypoint start to change'''
    wp_x_list = df['x_wp'].tolist()
    wp_y_list = df['y_wp'].tolist()
    num_wp_list = df['num_wp'].tolist()

    # Create list of x waypoint in sequence refer to waypoint -n index
    indexes_x = np.unique(num_wp_list,return_index=True)[1]  #Showing first occurance index 
    xx = [wp_x_list[index] for index in sorted(indexes_x)]
    indexes_x.sort()   # Sort the index ascending

   # Create new index and xx variable for the last point of waypoint
    indexes_x = indexes_x.tolist()
    indexes_x.insert(len(indexes_x)+1,len(df))

    # Create list of y waypoint in sequence refer to waypoint -n index
    indexes_y = np.unique(num_wp_list,return_index=True)[1]
    yy = [wp_y_list[index] for index in sorted(indexes_y)]
    indexes_y.sort() # Sort the index ascending


    # Create new index and yy variable for the last point of waypoint
    indexes_y = indexes_y.tolist()
    indexes_y.insert(len(indexes_y)+1,len(df))
    
    return indexes_x, indexes_y

# Calculate Gradient and Intercept of Two Waypoints
def grad_int(df):
    """Find gradient and intercept from two points in waypoint coordinates"""
    
    # Creating waypoint x,y, and waypoint -n list from dataframe
    wp_x_list = df['x_wp'].tolist()
    wp_y_list = df['y_wp'].tolist()
    num_wp_list = df['num_wp'].tolist()

    # Creating variable for processing
    # ---------------------------------------------------------------------------------------

    # Create list of x waypoint in sequence refer to waypoint -n index
    indexes_x = np.unique(num_wp_list,return_index=True)[1]  #Showing first occurance index 
    xx = [wp_x_list[index] for index in sorted(indexes_x)]
    xx.insert(0,0) # Insert first wp x-coordinate
    
    # Create list of y waypoint in sequence refer to waypoint -n index
    indexes_y = np.unique(num_wp_list,return_index=True)[1]
    yy = [wp_y_list[index] for index in sorted(indexes_y)]
    yy.insert(0,0) # Insert first wp y-coordinate

    # Create empty list for slope, intercept, x, and y coordinates 
    m_list = []
    b_list = []
    
    # -----------------------------------------------------------------------------------

    # Looping over the list to get intercept and slope, append it to empty list
    for i in range (len(xx)-1):
        m = (yy[i+1]-yy[i])/(xx[i+1]-xx[i])# Finding slope
        b = yy[i+1] - m*xx[i+1]# Finding intercept

        m_list.append(m)
        b_list.append(b)
    
    return m_list, b_list

def track_error_dist(df):

    # Define variables using pre-built function
    grad, intr = grad_int(df)
    ind_x, ind_y = index_wp(df)
    
    # Create empty list inside a list with amount of number of gradients
    distance = [[] for i in range(len(grad))]

    # Calculating distance from each point to line and append the result to distance list
    for line in range(len(grad)):
        x0 = df['X'][ind_x[line]:ind_x[line+1]].tolist()
        y0 = df['Y'][ind_x[line]:ind_x[line+1]].tolist()
        
        for x,y in zip(x0,y0):
            ats = np.abs(-1*grad[line]*x + -1*intr[line] + y)
            bwh = np.sqrt((-grad[line])**2 + 1**2)
            dist = ats/bwh
            distance[line].append(dist)
            
    for i in range(len(distance)-1):
        distance[0].extend(distance[i+1])  
    
    # Assign distance as a part of dataframe
    df['distance'] = distance[0]
    
    return df

# Minimum Distance Function
def minimum_distance(df):
    '''Calculate minimum distance to the waypoint coordinate'''

    X = df['X'].tolist()
    Y = df['Y'].tolist()
    x_wp_list, y_wp_list = unique_coor(df)
    
    storage = [[] for i in range(len(x_wp_list))]
    for i in range(len(x_wp_list)):
        for j in range(len(df)):
            x_wp = x_wp_list[i]
            y_wp = y_wp_list[i]
            radius = 450
            X_list = df['X'].tolist()
            Y_list = df['Y'].tolist()
            X = X_list[j]
            Y = Y_list[j]
            dist = np.sqrt((x_wp - X)**2 + (y_wp - Y)**2)

            if dist <= radius:
                storage[i].append(dist)

    min_dist = []
    for distance in range(len(storage)):
        minimum = np.min(storage[distance])
        min_dist.append(minimum)
    
    return min_dist