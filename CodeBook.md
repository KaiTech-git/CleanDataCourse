# Code book - Getting and Cleaning Data Course Project

## 1. Introduction 
The data analyzed comes from [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

 __For each record it is provided:__

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## 2. General description 
File *summarised_data.txt*  is a tidy data set, contains average values of mean and standard deviation form measurements gathered in the experiment. All the measurements are grouped by activities and subjects. 

## 3.Columns values 
        
**3.1. activity** </br>
This value describes which out of 6 activities subject were performing.
Values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
        
**3.2. subject**</br>
30 participants took part in the experiment and were numbered from 1 to 30
        
**3.3 Measurment values** </br>
All the following values came from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

**These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.**

*tBodyAcc-XYZ</br>
tGravityAcc-XYZ</br>
tBodyAccJerk-XYZ</br>
tBodyGyro-XYZ</br>
tBodyGyroJerk-XYZ</br>
tBodyAccMag</br>
tGravityAccMag</br>
tBodyAccJerkMag</br>
tBodyGyroMag</br>
tBodyGyroJerkMag</br>
fBodyAcc-XYZ</br>
fBodyAccJerk-XYZ</br>
fBodyGyro-XYZ</br>
fBodyAccMag</br>
fBodyAccJerkMag</br>
fBodyGyroMag</br>
fBodyGyroJerkMag*</br>

In the file *summarised_data.txt*  data described above were presented on which one of the two operations was performed.</br>
1. mean(): Mean value operation </br>
2. std(): Standard deviation operation</br>

Five more variables are present in data set those are  vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
*gravityMean</br>
tBodyAccMean</br>
tBodyAccJerkMean</br>
tBodyGyroMean</br>
tBodyGyroJerkMean*

