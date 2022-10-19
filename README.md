# Deep Learning Based Fly-Over Waypoints Control System for Business Jet Aircraft

This is my undergradute thesis project, with the goals are to **develop waypoint following controller deep learning model** espescially for **Cirrus Vision SF50** aircraft and **study the relationship between training data** that categorized by aircraft roll angle during the mission. This study give results that deep learning model generally increase closeness of the aircraft to the waypoint compared to the PID method, eventhough the dataset used is a piece of sliced data. It also shown that wider datasets didn’t guarantee superior results due to generalizations that model try to made.

# Steps of this project is as follow: 

## Prepare Dataset
This process showed on [Prepare Dataset.ipynb file](https://github.com/adikelvianto/Fly-Over_Waypoints_ANN/blob/main/Prepare%20Dataset.ipynb), where in this step, mission data that collected from PID based will be **resampled**, **smoothed** and **cleaned**. 

## Split Dataset
This process showed on [Split Dataset.ipynb](https://github.com/adikelvianto/Fly-Over_Waypoints_ANN/blob/main/Split%20Dataset.ipynb). In this step, all dattasets collected will be **split** based on **roll angle criteria**.

## Train Deep Learning Model
This process showed on [Training ANN Model.ipynb](https://github.com/adikelvianto/Fly-Over_Waypoints_ANN/blob/main/Split%20Dataset.ipynb). This file containing **scaling**, **bayesian optimization**, **save model**, and **evalute result** to validation dataset. 

## Evaluate Model Result
* This process can be found on [Evaluate Result.ipynb](https://github.com/adikelvianto/Fly-Over_Waypoints_ANN/blob/main/Evalute%20ANN%20Result.ipynb), where all of the data get from deep learning model simulation will be plotted. 
* Simulation done using MATLAB, Simulink and X-Plane. Monitoring system GUI, control system Simulink files can be found in [MATLAB - Simulink Files](https://github.com/adikelvianto/Fly-Over_Waypoints_ANN/tree/main/MATLAB%20-%20Simulink%20Files)
* Plugins used in order to build communication between X-Plane and Simulink can be found in [X-Plane Plugins](https://github.com/adikelvianto/Fly-Over_Waypoints_ANN/tree/main/X-Plane%20Plugins)

## X-Plane Simulation Result
* Testing simulation on X-Plane will be conducted in 2 kind of flight mission. 
* Mission A which consist of 4 waypoints, and Mission B which consist of 10 waypoints. 
* Video below show how Cirrus Vision SF50 aircraft can accomplish the flight mission defined when being simulated using one of deep learning model created.


https://user-images.githubusercontent.com/92104520/196455030-7f6f501a-0fa0-4f09-a6af-14ac8921d28c.mp4


https://user-images.githubusercontent.com/92104520/196455059-49da6a68-7dc4-442a-bf2d-cf279a6bc297.mp4


# Analysis
Analysis done on this project shown in [Analysis_10Aug.xlsx](https://github.com/adikelvianto/Fly-Over_Waypoints_ANN/blob/main/Analysis_10Aug.xlsx) file. 

# Report
All of this project process written in Bahasa can be read in my undergraduate thesis report [here](https://github.com/adikelvianto/Fly-Over_Waypoints_ANN/blob/main/Undergraduate%20Thesis%20Report.pdf).
