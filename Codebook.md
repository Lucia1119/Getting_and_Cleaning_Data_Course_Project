# Codebook of data clean
This codebook describes the variables, the data, and any transformations performed to clean up the data.


## files 
#### file paths
* feature_path <br /> 
* activityLabels_path <br /> 
* testSet_path <br /> 
* testLabel_path <br /> 
* testSubject_path <br /> 
* trainSet_path <br /> 
* train Label_path <br /> 
* trainSubject_path <br />
#### tables read directly from txt files
* testSetTable<br /> 
* testLabelTable<br /> 
* testSubjectTable<br /> 
* trainSetTable<br /> 
* trainLabelTable<br /> 
* trainSubjectTable<br /> 
* featureTable<br /> 
* activityLabelsTable<br /> 
<br /> 
 
## variables
* total_data: contains test and train data<br /> 
* total_label: contains activity labels of both test and train data<br /> 
* total_subject: contains subject IDs of both test and train data<br /> 
* data_mean_std: contains only the measurements on the mean and standard deviation for each measurement on total_data<br /> 
* total_activity: contains activity labels and activity descriptions of all subjects<br /> 
* total_dataset: contains test and train data with subject ID, activity and only the measurements on the mean and standard deviation for each measurement<br /> 
* new_names: contains refined names of all columns of total_dataset<br /> 
* average_subject_activity: contains the average of each variable for each activity and each subject<br /> 
<br /> 

## transformations
* total_data, total_label and total_subject are prepared by row binding of test and train datasets.<br /> 
* featureTable contains only names of all features via removing feature index from the original dataset.<br /> 
* variable names on total_data are replaced by featureTable.<br /> 
* uses descriptive activity names for all subjects by inner join total_label and activityLabelsTable<br /> 
* the complete dataset is generated via column binding of three tables: total_subject,total_activity,data_mean_std.<br /> 
* rename columns of total_dataset by replacing "t" with "time", replacing "f" with "freq" and eliminating "-" and "()" from variable names.<br /> 
* a second, independent tidy data set is obtained by summarize_all functions and group by subject ID and activity.<br /> 


