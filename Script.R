#Upload
library(dplyr)
#Downloading all data that the program will useDownloading all data that the program will use.
train_x<-read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE) # czyta plik
train_sub <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE) # czyta plik
train_y <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE) # czyta plik
test_x <- test_x<- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)# czyta plik
test_y <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE) # czyta plik
test_sub <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE) # czyta plik
features <- read.table("UCI HAR Dataset/features.txt", header = FALSE) 
labels<- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

#Merge
All_x <- rbind(test_x, train_x)
All_y <- rbind(test_y, train_y)
All_sub <- rbind(test_sub, train_sub)
#Gathering all data into one table
All_data <-mutate(All_x, activity = All_y, subject = All_sub)


#Extracts only the measurements on the mean and standard deviation for each measurement.
mean_select<-grep("(.*)mean(.*)", features[,2])
sdt_select <-grep("(.*)std(.*)", features[,2])
#Selection of columns for analysis
columns <- c(length(All_data), length(All_data)-1, mean_select, sdt_select)
Ex_data <- select(All_data,all_of(columns)) #Extracted Data

#Uses descriptive activity names to name the activities in the data set
Ex_data<-mutate(Ex_data, activity = sapply(activity,assign_l))

#Appropriately labels the data set with descriptive variable names.
mean_names<- grep("(.*)mean(.*)", features[,2], value = TRUE)
sdt_names<- grep("(.*)std(.*)", features[,2], value = TRUE)
#Vector composed of the names of the columns
names_data<- c("subject", "activity", mean_names, sdt_names) 
names(Ex_data) <-names_data

#Creates a second, independent tidy data set with
#the average of each variable for each activity and each subject.

Ex_data2<- Ex_data # independent data set
Ex_data2 <- group_by(Ex_data, activity, subject) #grouping data by activity and subject
sum_data<- summarise_all(Ex_data2, mean) #data set with the average of each variable



#Function that assigns the corresponding activity to numbers
assign_l<-function(value, lab=labels){ 
        x<- lab[value,2]
        x
} 
