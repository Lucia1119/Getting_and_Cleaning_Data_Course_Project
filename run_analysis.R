# Here are the scripts for performing the analysis


# load libraries
library(data.table)
library(dplyr)


# read txt file to table
feature_path=".\\UCI HAR Dataset\\features.txt"
activityLabels_path=".\\UCI HAR Dataset\\activity_labels.txt"
testSet_path=".\\UCI HAR Dataset\\test\\X_test.txt"
testLabel_path=".\\UCI HAR Dataset\\test\\y_test.txt"
testSubject_path=".\\UCI HAR Dataset\\test\\subject_test.txt"
trainSet_path=".\\UCI HAR Dataset\\train\\X_train.txt"
trainLabel_path=".\\UCI HAR Dataset\\train\\y_train.txt"
trainSubject_path=".\\UCI HAR Dataset\\train\\subject_train.txt"

# read test data
testSetTable=read.table(testSet_path)
testLabelTable=read.table(testLabel_path)
testSubjectTable=read.table(testSubject_path)

# read train data
trainSetTable=read.table(trainSet_path)
trainLabelTable=read.table(trainLabel_path)
trainSubjectTable=read.table(trainSubject_path)

# read feature
featureTable=read.table(feature_path)

# read activity label
activityLabelsTable=read.table(activityLabels_path)


# 1.Merges the training and the test sets to create one data set.
total_data=rbind(testSetTable,trainSetTable) # merge data set
total_label=rbind(testLabelTable,trainLabelTable) # merge activity labels
total_subject=rbind(testSubjectTable,trainSubjectTable) # merge subject


# 2.Extracts only the measurements on the mean and standard deviation for each measurement.
featureTable$V2=as.character(featureTable$V2)
featureTable=featureTable[,2] # eliminate index from feature table
names(total_data)=featureTable # use feature as names of variables in the dataset
data_mean_std=total_data[,grep("(mean|std)",names(total_data))]


# 3.Uses descriptive activity names to name the activities in the data set
names(total_label)="labels"
names(activityLabelsTable)=c("labels","activity")
total_activity=inner_join(total_label,activityLabelsTable,by="labels")
total_dataset=cbind(total_subject,total_activity$activity,data_mean_std)


# 4.Appropriately labels the data set with descriptive variable names.
names(total_dataset)[1]="subjectID"
names(total_dataset)[2]="activity"
new_names=sub("^t","time",names(total_dataset)) # replace "t" in variable names to "time"
new_names=sub("^f","freq",names(total_dataset)) # replace "f" in variable names to "freq"
new_names=gsub("-|\\(|\\)","",names(total_dataset)) # eliminate "-" and "()" from variable names
names(total_dataset)=new_names


# 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# total_dataset is the final data set after operations in step 1 to step 4
average_subject_activity = total_dataset %>% group_by(subjectID,activity) %>% summarize_all(funs(mean))


# write tidy data into a txt file
write.table(average_subject_activity, file="tidyData.txt", row.name=FALSE)