# Getting and Cleaning Data Course Project
The goal  of this script *run_analysis.R* is to prepare tidy data set out of measurements from [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Data were gathered from experiment conducted with use of smartphones title of the experiment: *Human Activity Recognition Using Smartphones Data Set*. 
The data was processed as follows:
## 1. Reading data 
All data used in the *run_analysis.R* were read from working directory with use of *read.table()*.
Data were stored in 8 variables: </br>
- *train_x* and *test_x* contain all accelerometer and gyroscope measurements from two parts of experiment.
- *train_sub* and *test_sub* correspond to all 30 people who took part in the experiment.
- *train_y* and *test_y* contain numbers corresponding to one of the 6 activities that the subjects performed. 
- *features* contains names of all columns contained in variables *train_x* and *test_x*.
- *labels* table with activity names and corresponding numbers.
Code example for reading:
<code>
train_x<-read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)</code> 
