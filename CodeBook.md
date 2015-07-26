## Code Book

This document will describe all the variables, values, units and all transformations and choices that were performed to create a tidy data set.

## Project Description
Create one R script called run_analysis.R that will create a tidy data set with the average of each variable for each activity and each subject.


##Study design and data processing

###Collection of the raw data
The raw data used in this project was collected from the accelerometers from the Samsung Galaxy S smartphone. 

A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

For more information see the original dataset files in the 'UCI HAR Dataset'.

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'test or  'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


##Creating the tidy datafile

The steps to transform the raw data sets to create the tidy data set are:

Merges the training and the test sets to create one data set: Read the test, training, subject and activity and merge them all to create one data set.

Extracts only the measurements on the mean and standard deviation for each measurement: The original dataset included a large set of variables, for this project we were supposed to include the mean and standard deviation.  Since it was not clear what exactly variables should be included I decided to only include variables which contains  "mean()"  and "std()" in their name. This will result in different   number  of variables in the tidydata.txt.

Uses descriptive activity names to name the activities in the data set: replace the number representing the activities with the descriptive names.(1 WALKING, 2 WALKING_UPSTAIRS,3 WALKING_DOWNSTAIRS, 4 SITTING, 5 STANDING, 6 LAYING).

Appropriately labels the data set with descriptive variable names: Change the variable names to be more descriptive. Some guidelines suggest to lowercase the variables, replace abreviation  like replace t with time, f with frequency, acc with accelerometer, gyro with gyroscope, mag wtih magnitude, remove all punctuation like -, ().

Creates a tidy data set:  A new data set called tidydata.txt is created with the average of each variable for each activity and each subject.

##Description of the variables in the tidydata.txt file

The tidydata set contains 180 objeservations and 68 variables.


[1] subject  - Identify the volunteer "subject" who performed the experiment. It is an int with the range from 1 to 30. 

[2] activity - WALKING, WALKING_UPSTAIRS,  WALKING_DOWNSTAIRS,  SITTING,  STANDING , LAYING. It is a factor with 6 levels.

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

The variable name convention:
average: global mean value

mean/std: mean or standard deviation of the measurement

xyz: one direction of a 3-axial signal

measurement: the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable: gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean,tBodyGyroJerkMean.

time: time domain measure 

frequency: frequency domain measure 

                             
 [3] averagetimebodyaccelerometermeanx    
 [4] averagetimebodyaccelerometermeany                 
 [5] averagetimebodyaccelerometermeanz                 
 [6] averagetimegravityaccelerometermeanx              
 [7] averagetimegravityaccelerometermeany              
 [8] averagetimegravityaccelerometermeanz              
 [9] averagetimebodyaccelerometerjerkmeanx             
[10] averagetimebodyaccelerometerjerkmeany             
[11] averagetimebodyaccelerometerjerkmeanz             
[12] averagetimebodygyroscopemeanx                     
[13] averagetimebodygyroscopemeany                     
[14] averagetimebodygyroscopemeanz                     
[15] averagetimebodygyroscopejerkmeanx                 
[16] averagetimebodygyroscopejerkmeany                 
[17] averagetimebodygyroscopejerkmeanz                 
[18] averagetimebodyaccelerometermagnitudemean         
[19] averagetimegravityaccelerometermagnitudemean      
[20] averagetimebodyaccelerometerjerkmagnitudemean     
[21] averagetimebodygyroscopemagnitudemean             
[22] averagetimebodygyroscopejerkmagnitudemean         
[23] averagefrequencybodyaccelerometermeanx            
[24] averagefrequencybodyaccelerometermeany            
[25] averagefrequencybodyaccelerometermeanz            
[26] averagefrequencybodyaccelerometerjerkmeanx        
[27] averagefrequencybodyaccelerometerjerkmeany        
[28] averagefrequencybodyaccelerometerjerkmeanz    
[29] averagefrequencybodygyroscopemeanx                
[30] averagefrequencybodygyroscopemeany                
[31] averagefrequencybodygyroscopemeanz                
[32] averagefrequencybodyaccelerometermagnitudemean    
[33] averagefrequencybodyaccelerometerjerkmagnitudemean
[34] averagefrequencybodygyroscopemagnitudemean        
[35] averagefrequencybodygyroscopejerkmagnitudemean    
[36] averagetimebodyaccelerometerstdx                  
[37] averagetimebodyaccelerometerstdy                  
[38] averagetimebodyaccelerometerstdz                  
[39] averagetimegravityaccelerometerstdx               
[40] averagetimegravityaccelerometerstdy               
[41] averagetimegravityaccelerometerstdz               
[42] averagetimebodyaccelerometerjerkstdx              
[43] averagetimebodyaccelerometerjerkstdy              
[44] averagetimebodyaccelerometerjerkstdz              
[45] averagetimebodygyroscopestdx                      
[46] averagetimebodygyroscopestdy                      
[47] averagetimebodygyroscopestdz                      
[48] averagetimebodygyroscopejerkstdx                  
[49] averagetimebodygyroscopejerkstdy                  
[50] averagetimebodygyroscopejerkstdz                  
[51] averagetimebodyaccelerometermagnitudestd          
[52] averagetimegravityaccelerometermagnitudestd       
[53] averagetimebodyaccelerometerjerkmagnitudestd      
[54] averagetimebodygyroscopemagnitudestd              
[55] averagetimebodygyroscopejerkmagnitudestd          
[56] averagefrequencybodyaccelerometerstdx             
[57] averagefrequencybodyaccelerometerstdy             
[58] averagefrequencybodyaccelerometerstdz             
[59] averagefrequencybodyaccelerometerjerkstdx         
[60] averagefrequencybodyaccelerometerjerkstdy         
[61] averagefrequencybodyaccelerometerjerkstdz         
[62] averagefrequencybodygyroscopestdx                 
[63] averagefrequencybodygyroscopestdy                 
[64] averagefrequencybodygyroscopestdz                 
[65] averagefrequencybodyaccelerometermagnitudestd     
[66] averagefrequencybodyaccelerometerjerkmagnitudestd 
[67] averagefrequencybodygyroscopemagnitudestd         
[68] averagefrequencybodygyroscopejerkmagnitudestd




