Description

This project is part of a Coursera Getting and Cleaning Data course.

The goal is to create in the github repository the following files:

README.md: this file
CodeBook.md: describe the raw and tidy dataset. (variables, values, units, etc..)
R script called run_analysis.R 

The script run_analysis.R  is composed of 3 functions:
1.    packagesrequired()<-function
 It will install the packages dplyr and plyr required by the createTidyDataSet() function.

2.	downloadfiles()<-function

The data for the project is located at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
The function will create a directory called "data" if it doesn't exist and it will download the zip file containing all the data need for the project and it will extract the files into the "data" directory.
The zip file contains a directory called "UCI HAR Dataset" 

3.	createTidyDataSet()<-function
The createTidyDataSet() will create a independent tidy data set  called tidydata.txt with the average of each variable for each activity and each subject.

The function will: 
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names. 
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Instructions:

1.	Open R or RStudio.
2.	Type  getwd() , it will say what is the working directory.
3.	Set the working directory in R. You can use the setwd("your working directory") command or Session | Set Working Directory | Choose Directory.
4.	Clone the repository
5.	Add the run_analysis.R  file script in the working directory in RStudio
6.	File | Open File | run_analysis.R
7.	Type source ("run_analysis.R")
8.	Type packagesRequired() *only if you don't have the dplyr and plyr packages installed and loaded
9.	Type downloadFiles()
10.	Type createTidyDataSet()

Results: A file called tidydata.txt will be created into the "data" folder.
