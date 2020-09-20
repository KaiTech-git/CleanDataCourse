# Getting and Cleaning Data Course Project
The goal  of this script *run_analysis.R* is to prepare tidy data set out of measurements from [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Data were gathered from experiment conducted with use of smartphones title of the experiment: *Human Activity Recognition Using Smartphones Data Set*. 
The data was processed as follows:
## 1. Reading data 
All data used in the *run_analysis.R* were read from working directory with use of __read.table()__.
Data were stored in 8 variables: </br>
- *train_x* and *test_x* contain all accelerometer and gyroscope measurements from two parts of experiment.
- *train_sub* and *test_sub* correspond to all 30 people who took part in the experiment.
- *train_y* and *test_y* contain numbers corresponding to one of the 6 activities that the subjects performed. 
- *features* contains names of all columns contained in variables *train_x* and *test_x*.
- *labels* table with activity names and corresponding numbers.
Code example for reading:
<code>
train_x<-read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)</code> 
  
## 2. Merging data 
The experiment was conducted in two groups *test* (30% of participants) and *train* (70% of participants). For this reason, before the merge into one complete data series, the corresponding columns of the variables from the different trials had to be combined with each other. Columnes were merged with function __rbind()__.
This is how variables *All_x*, *All_y* and *All_sub* were created.
Code example for merging by rows:
<code>
All_x <- rbind(test_x, train_x))</code> </br>

Vectors *All_y* and *All_sub* were to be added as the last two columns of *All_x* table, that is why they have been assigned the names V562 and V563.</br>
Finaly *All_x*, *All_y* and *All_sub* were merged together by cloumns with function __cbind()__ and assigned to *All_data*. 

## 3. Extracting measurements
Extracting mean and standard deviation for each measurement from all data was performed in three steps.</br>
  1. Numbers of all columns in which mean() or std() characters appeared were found. It was done with by applying __grep()__ function to *features*.</br>
  <code>mean_select<-grep("(.*)mean(.*)", features[,2])</br>
  sdt_select <-grep("(.*)std(.*)", features[,2])</code> 
  2. 
