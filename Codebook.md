# Codebook of data clean
This codebook describes the variables, the data, and any transformations or work performed to clean up the data.


## files
### file paths
feature_path	
activityLabels_path	
testSet_path	
testLabel_path	
testSubject_path	
trainSet_path	
train Label_path	
trainSubject_path	
### tables read directly from txt files
testSetTable	
testLabelTable	
testSubjectTable	
trainSetTable	
trainLabelTable	
trainSubjectTable	
featureTable	
activityLabelsTable	

## variables
total_data: contains test and train data 	
total_label: contains activity labels of both test and train data	
total_subject: contains subject IDs of both test and train data	
data_mean_std: contains only the measurements on the mean and standard deviation for each measurement on total_data	
total_activity: contains activity labels and activity descriptions of all subjects	
total_dataset: contains test and train data with subject ID, activity and only the measurements on the mean and standard deviation for each measurement	
new_names: contains refined names of all columns of total_dataset	
average_subject_activity: contains the average of each variable for each activity and each subject	

## transformations
total_data, total_label and total_subject are prepared by row binding of test and train datasets.	
featureTable contains only names of all features via removing feature index from the original dataset.	
variable names on total_data are replaced by featureTable.	
uses descriptive activity names for all subjects by inner join total_label and activityLabelsTable	
the complete dataset is generated via column binding of three tables: total_subject,total_activity,data_mean_std.	
rename columns of total_dataset by replacing "t" with "time", replacing "f" with "freq" and eliminating "-" and "()" from variable names.	
a second, independent tidy data set is obtained by summarize_all functions and group by subject ID and activity.	


