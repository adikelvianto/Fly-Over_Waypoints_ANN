# Fly-over Waypoint Following Control System of Cirrus Vision SF-50 Aircraft using Artificial Neural Network

This is my undergradute thesis project, with the goals are to develop waypoint following controller ANN model for Cirrus Vision SF50 aircraft and study the relationship between training data that categorized by aircraft roll angle during the mission. This study give results that ANN model generally increase closeness of the aircraft to the waypoint compared to the PID method. It also shown that wider datasets didn’t guarantee superior results due to generalizations that model try to made.

Steps of this project is as follow: 

# Prepare Dataset
This process showed on Prepare Dataset.ipynb file, where in this step, mission data that collected from PID based will be resampled, smoothed and cleaned. 

# Split Dataset
This process showed on Split Dataset.ipynb file. In this step, all dattasets collected will be split based on roll angle criteria

# Training ANN Model
This process showed on Training ANN Model.ipynb file. This file containing scaling, bayesian optimization, save model, and evalute result to validation dataset. 

# Evaluate ANN Result
This process can be found on Prepare Dataset.ipynb, where all of the data get from ANN model simulation will be plotted.

# Analysis
Analysis done on this project shown in Analysis_10Aug.xlsx file. 
