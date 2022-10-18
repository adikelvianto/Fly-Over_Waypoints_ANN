# Deep Learning Based Fly-Over Waypoints Control System for Business Jet Aircraft

This is my undergradute thesis project, with the goals are to **develop waypoint following controller deep learning model** espescially for **Cirrus Vision SF50** aircraft and **study the relationship between training data** that categorized by aircraft roll angle during the mission. This study give results that deep learning model generally increase closeness of the aircraft to the waypoint compared to the PID method, eventhough the dataset used is a piece of sliced data. It also shown that wider datasets didn’t guarantee superior results due to generalizations that model try to made.

Steps of this project is as follow: 

# Prepare Dataset
This process showed on [Prepare Dataset.ipynb file](https://github.com/adikelvianto/Fly-Over_Waypoints_ANN/blob/main/Prepare%20Dataset.ipynb), where in this step, mission data that collected from PID based will be resampled, smoothed and cleaned. 

# Split Dataset
This process showed on [Split Dataset.ipynb](https://github.com/adikelvianto/Fly-Over_Waypoints_ANN/blob/main/Split%20Dataset.ipynb). In this step, all dattasets collected will be split based on roll angle criteria

# Training ANN Model
This process showed on [Training ANN Model.ipynb](https://github.com/adikelvianto/Fly-Over_Waypoints_ANN/blob/main/Split%20Dataset.ipynb). This file containing scaling, bayesian optimization, save model, and evalute result to validation dataset. 

# Evaluate ANN Result
This process can be found on [Evaluate Result.ipynb](https://github.com/adikelvianto/Fly-Over_Waypoints_ANN/blob/main/Evalute%20ANN%20Result.ipynb), where all of the data get from ANN model simulation will be plotted.

# X-Plane Simulation Result
* Testing simulation on X-Plane will be conducted in 2 kind of flight mission. 
* Mission A which consist of 4 waypoints, and Mission B which consist of 10 waypoints. 
* Video below show how aircraft can accomplish the flight mission defined, using one of deep learning model created. 



https://user-images.githubusercontent.com/92104520/196452910-a55d6e2d-e9d6-458e-8716-68de4f9876bb.mp4


https://user-images.githubusercontent.com/92104520/196451155-ef593c36-dd39-4b2f-8a33-b30ed1b142b7.mp4


# Analysis
Analysis done on this project shown in [Analysis_10Aug.xlsx](https://github.com/adikelvianto/Fly-Over_Waypoints_ANN/blob/main/Analysis_10Aug.xlsx) file. 

# Undegraduate Thesis Report
All of this project process can be read in my undergraduate thesis report [here]().
