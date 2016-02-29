# Getting and Cleaning Data Course Project
# README File

## Overview

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. I have create one R script called ```run_analysis.R``` that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How to execute ```"run_analysis.R"``` script
------

1. Download the data source: 
        https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
   "UCI HAR Dataset" folder will be created when data source above is unzipped. 
3. Place ```"run_analysis.R"``` script in the parent folder of "UCI HAR Dataset".
4. Set your working directory to where this script is located using ```"setwd()"``` function in RStudio.
5. Run ```source("run_analysis.R")```, then it will create a new file ```tidy_data.txt``` in your working directory. ```tidy_data.txt``` file is created by executing: ```write.table('tidy_data.txt', sep=" ", row.names = FALSE)```

## Dependencies

Make sure ```dplyr``` library is installed prior to executing the ```"run_analysis.R"``` script.

Please read ```CodeBook.md``` for data source information and tranformation details.

