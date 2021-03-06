# Getting and Cleaning Data Course Project
The goal  of script *run_analysis.R* is to prepare tidy data set out of measurements from [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Data were gathered from experiment conducted with use of smartphones, title of the experiment: *Human Activity Recognition Using Smartphones Data Set*. 
The data were processed as follows:
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
The experiment was conducted in two groups *test* (30% of participants) and *train* (70% of participants). For this reason, before merging into one complete data series, the corresponding columns of the variables from the different trials had to be combined with each other. Columns were merged with function __rbind()__.
This is how variables *All_x*, *All_y* and *All_sub* were created.
Code example for merging by rows:
<code>
All_x <- rbind(test_x, train_x))</code> </br>

Vectors *All_y* and *All_sub* were to be added as the last two columns of *All_x* table, that is why they have been assigned the names V562 and V563.</br>
Finally *All_x*, *All_y* and *All_sub* were merged together by columns with function __cbind()__ and assigned to *All_data*. 

## 3. Extracting measurements
Extracting mean and standard deviation for each measurement from all data was performed in three steps.</br>
  
  1. Numbers of all columns in which mean or std appeared were found. It was done by applying __grep()__ function to *features*.</br>
  ``` 
  mean_select<-grep("(.*)mean(.*)", features[,2]),
  sdt_select <-grep("(.*)std(.*)", features[,2])
  ```
  2. Vector composed of selected column numbers were created. 
  ```
  columns <- c(length(All_data), length(All_data)-1, mean_select, sdt_select)
  ```
  *length(All_data)* and *length(All_data)-1* represented the numbers of the last two columns: activities and subjects (participants).
  
  3. Assignment of selected columns with use of function __select()__ to variable *Ex_data*.
  ```
  Ex_data <- select(All_data,all_of(columns))
  ```
## 4. Adding descriptive activity names
Names of activities were assigned to column V562 by applying previously created function __assign_l()__ to column V562.
```
Ex_data<-mutate(Ex_data, V562 = sapply(V562,assign_l))
assign_l<-function(value, lab=labels){ 
        x<- lab[value,2]
        x
} 
```
## 5. Labeling data set with descriptive variable names
All measurement columns names were gather with simple change in previously used function __grep()__. Vector *names_data* with all columns names were assigned to *names(Ex_data)*.
```
mean_names<- grep("(.*)mean(.*)", features[,2], value = TRUE)
sdt_names<- grep("(.*)std(.*)", features[,2], value = TRUE)
names_data<- c("subject", "activity", mean_names, sdt_names) 
names(Ex_data) <-names_data
```
## 6. Independent tidy data set with the average of each variable for each activity and each subject.
This task were performed in 4 steps:
1. New data set were created and named *Ex_data2* </br>
2. *Ex_data2* were grouped by activity and subject in such order <code> Ex_data2 <- group_by(Ex_data, activity, subject) </code>
3. Tidy data set with the average of each variable for each activity and each subject were created and named *sum_data*.
  ```
  sum_data<- summarise_each(Ex_data2, mean) 
  ```
4. *sum_data* were written at working directory in txt format.
```
   write.table(sum_data, "summarised_data.txt", row.name = FALSE)          
```
## Reading file 
the file can be correctly read with the command 
```
read.table("summarised_data.txt", header = TRUE)             
```


  
