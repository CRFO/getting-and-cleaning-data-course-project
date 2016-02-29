# Coursera - Getting and Cleaning Data Course Project
# Script: run_analysis.R
# This script does the following:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of 
#    each variable for each activity and each subject.

# Load library
library(dplyr)

# Load datasets to variables
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", quote="\"")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", quote="\"")
features <- read.table("./UCI HAR Dataset/features.txt", quote="\"")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", quote="\"")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", quote="\"")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", quote="\"")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", quote="\"")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", quote="\"")

# The obtained dataset has been randomly partitioned into two sets, 
# where 70% of the volunteers was selected for generating the training data 
# and 30% the test data. 

# Assign column names to activity labels
colnames(activity_labels) <- c("V1","Activity")

## Train Data
# Merge y_train with the activity label 
final_y_train <- merge(cbind(y_train,rename(subject_train, subject=V1)),activity_labels, by=("V1"))

# Give colunm names from features to X_train data
colnames(x_train) <- features[,2]

# Combine y and x train data with activity labels removing first column
x_y_train <- cbind(final_y_train,x_train)[,-1]

# Select only the columns related to means and std for train
selected_train <- select(x_y_train,contains("subject"), contains("Activity"), contains("mean"), contains("std"))

## Test Data
# Merge y_test with the activity label 
final_y_test <- merge(cbind(y_test,rename(subject_test, subject=V1)),activity_labels, by=("V1"))

# Give colunm names from features to X_test data
colnames(x_test) <- features[,2]

# Combine y and x test data with activity labels removing first column
x_y_test <- cbind(final_y_test,x_test)[,-1]

# Select only the columns related to means and std for test
selected_test <- select(x_y_test,contains("subject"), contains("Activity"), contains("mean"), contains("std"))

# Bind the analysis data for train and test as requested
run_analysis<- (rbind(selected_train,selected_test)%>%
                group_by(subject,Activity) %>%
                summarise_each(funs( mean)) %>% print %>%
                write.table('tidy_data.txt', sep=" ", row.names = FALSE))