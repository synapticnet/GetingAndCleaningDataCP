######### Project instructions ###############################################################
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average 
#    of each variable for each activity and each subject.
##############################################################################################

require(dplyr)


##1. Merge training and test sets into one data set

# read in data
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
xtest <- read.table("UCI HAR Dataset/test/x_test.txt")
ytest <- read.table("UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
features <- read.table("UCI HAR Dataset/features.txt",sep = " ",colClasses = "character")
features <- features[,2]

# merge train and test sets into large x, y, and subject dataframes 
xAll <- rbind(xtrain,xtest)
yAll <- rbind(ytrain,ytest)
subjectAll <- rbind(subjectTrain,subjectTest)
rm(xtrain,ytrain,subjectTrain,subjectTest,xtest,ytest)

# apply original lables to the xAll columns
colnames(xAll) <- features

# complete the data set by graphting in subject and activity columns with names
colnames(subjectAll) <- "subject"
colnames(yAll) <- "activity"
completeData <- cbind(subjectAll,xAll,yAll)
rm(xAll,yAll,subjectAll)


## 2. Extract only measurements on the mean(46 features) and standard deviation(33 features).
##    I chose features that included mean(), meanFreq() and excluded the angle measurements as
##    I felt that it was not a mean of a feature but a new feature that used
##    the calculation of means to be derived and thus are left out.

# pull out feature names that contain mean() meanFreq() and std()
selectedFeatures <- features[grepl("mean()|meanFreq()|std()",features)]

# creat new data set containing only selected features while retaining subject and activity
selectedFeatures <- c("subject",selectedFeatures,"activity")
colNums <- match(selectedFeatures,names(completeData))
dataSubset <- completeData[,selectedFeatures]


## 3. Replace activity factors with activity discription.

dataSubset$activity[dataSubset$activity == 1] <- "walking"
dataSubset$activity[dataSubset$activity == 2] <- "walking_upstairs"
dataSubset$activity[dataSubset$activity == 3] <- "walking_downstairs"
dataSubset$activity[dataSubset$activity == 4] <- "sitting"
dataSubset$activity[dataSubset$activity == 5] <- "standing"
dataSubset$activity[dataSubset$activity == 6] <- "laying"


## 4. I feel the original variable names included in the data set are discriptive
##    and well suited for our purposes so I will keep them as is.  Since I have
##    already applied those names in step #1 we will move on to step 5


## 5. Create a second, independent tidy data set that contains the mean
##    of each feature by activity for each subject.

featMeanByActForSubject <- 
    dataSubset %>% group_by(subject,activity) %>% summarise_each(funs(mean))

write.table(featMeanByActForSubject,"featMeanByActForSubject.txt",row.names = FALSE)







