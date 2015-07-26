
packagesRequired<-function()
{
    # The createdTidyDataSet function requires the dplyr and plyr packages
    
    # Install packages dplyr and plyr
    install.packages(c("dplyr" , "plyr"))
    # Load the plyr and dplyr 
    library(plyr)
    library(dplyr)
}


downloadFiles<-function()
{
    if(!file.exists("./data")){dir.create("./data")}
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
    download.file(fileUrl,destfile="./data/dataset.zip", method="libcurl")
    unzip ("./data/dataset.zip", exdir = "./data")
}


createTidyDataSet<-function()
{
    
    # Step 1 - Merges the training and the test sets to create one data set.
    
    # Read the training dataset
    training<-read.table("./data/UCI HAR Dataset/train/X_train.txt") 
    
    # Read the file that contains the volunteers numbers for training dataset 
    subject_train<-read.table("./data/UCI HAR Dataset/train/subject_train.txt")
    # Rename the column from V1 to subject
    subject_train <- rename(subject_train, subject = V1)
    
    # Read the file that contains the activity for each observation in the training dataset
    activity_train<-read.table("./data/UCI HAR Dataset/train/y_train.txt")
    # Rename the column from V1 to activity
    activity_train <- rename(activity_train, activity = V1)
    
    #Add the subject and activity columns to the training 
    training<-cbind(subject_train,activity_train, training)
    
    #Read the test data set
    test<-read.table("./data/UCI HAR Dataset/test/X_test.txt") 
    
    # Read the file that contains the volunteers numbers for test dataset 
    subject_test<-read.table("./data/UCI HAR Dataset/test/subject_test.txt")
    # Rename the column from V1 to subject
    subject_test <- rename(subject_test, subject = V1)
    
    # Read the file that contains the activity for each observation in the test dataset
    activity_test<-read.table("./data/UCI HAR Dataset/test/y_test.txt")
    # Rename the column from V1 to activity
    activity_test <- rename(activity_test, activity = V1)
    
    #Add the subject and activity columns to the test dataset
    test<-cbind(subject_test,activity_test,test)
    
    # Merge the test and train data set
    mergedDataSet<-merge(training,test,all=TRUE)
    
    #Read the features file
    features<-read.table("./data/UCI HAR Dataset/features.txt") 
    
    #Rename all meansurements columns (V1..V561) with the actual features names 
    #  i = 3  since i=1 subject and i = 2 activity
    for (i in 3:563) {names(mergedDataSet)[i] <- as.character(features[(i-2),2])}
    
    
    # 2 - Extracts only the measurements on the mean and standard deviation for each measurement.
    
    #Remove the duplicates
    mergedDataSet <- mergedDataSet[ !duplicated(names(mergedDataSet)) ]
    
    #Select only measuments with mean and std
    meanStdDataSet<-select(mergedDataSet,subject,activity,contains("mean()"),contains("std()"))
    

    # 3 - Uses descriptive activity names to name the activities in the data set
    #Read the features file
    activityLbl<-read.table("./data/UCI HAR Dataset/activity_labels.txt") 
    
    for (i in 1:6){meanStdDataSet$activity[meanStdDataSet$activity == activityLbl[i,1] ]<- as.character(activityLbl[i,2])}

    
    # 4 - Appropriately labels the data set with descriptive variable names. 
    names(meanStdDataSet)<- tolower(names(meanStdDataSet))
    names(meanStdDataSet)<-gsub("-", "", names(meanStdDataSet))
    names(meanStdDataSet)<-gsub("[:():]", "", names(meanStdDataSet))
    names(meanStdDataSet)<-gsub("^t", "time", names(meanStdDataSet))
    names(meanStdDataSet)<-gsub("^f", "frequency", names(meanStdDataSet))
    names(meanStdDataSet)<-gsub("acc", "accelerometer", names(meanStdDataSet))
    names(meanStdDataSet)<-gsub("gyro", "gyroscope", names(meanStdDataSet))
    names(meanStdDataSet)<-gsub("mag", "magnitude", names(meanStdDataSet))
    names(meanStdDataSet)<-gsub("bodybody", "body", names(meanStdDataSet))
    
    
    #5 From the data set in step 4, creates a second, independent tidy data set with the average of each 
    # variable for each activity and each subject.
    
    tidydata<-aggregate(. ~subject + activity, meanStdDataSet, mean)
    tidydata<-arrange(tidydata,subject,activity)
    # Rename the columns adding a average in the columns name to better identtify what the meansurements means.
    names(tidydata)[3:68]<-paste0("average",names(tidydata)[3:68])
    
    write.table(tidydata, file = "./data/tidydata.txt",row.name=FALSE)
    
    tidydata<-read.table("./data/tidydata.txt",header=TRUE)
    View(tidydata)
}


