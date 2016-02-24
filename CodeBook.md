# Codebook for Getting and Cleaning Data Project

The "average.txt" file contains the dataset generated according to the project requirements.

Each row is an observation of a subject performing an activity and 66 variables (measurements) for that activity. Each measurement value is the average of that measurement for the activity of the subject. There are 30 subjects and 6 activities for each subject in the experiment (total 180 observations in this dataset).

To create "average.txt", a list of unique subjects and activities was created from a dataset ("extracted_set" in run_analysis.R) that contained all observations of measurements that calculated means and standard deviations in the training and test datasets.

The "extracted_set" dataset was then filtered by all the observations of a subject given an activity. The mean for each measurement in the filtered dataset was calculated. The result of this was one observation with 68 variables: subject, activity and 66 measurements means. This observation was then inserted in a data frame. This process was run for all subjects and their activities.

## List of variables in average.txt

- Subject: the subject Id (number)
- Activity: the activity performed by the subject (character)

All variables (measurements) below are in standard gravity units 'g'. Each value in "average.txt" is the mean of all observations of that variable in "merged_data" for each activity of each subject.
- tBodyAcc-mean()-X
- tBodyAcc-mean()-Y
- tBodyAcc-mean()-Z
- tGravityAcc-mean()-X
- tGravityAcc-mean()-Y
- tGravityAcc-mean()-Z
- tBodyAccJerk-mean()-X
- tBodyAccJerk-mean()-Y
- tBodyAccJerk-mean()-Z
- tBodyAccMag-mean()
- tGravityAccMag-mean()
- tBodyAccJerkMag-mean()
- tBodyAcc-std()-X
- tBodyAcc-std()-Y
- tBodyAcc-std()-Z
- tGravityAcc-std()-X
- tGravityAcc-std()-Y
- tGravityAcc-std()-Z
- tBodyAccJerk-std()-X
- tBodyAccJerk-std()-Y
- tBodyAccJerk-std()-Z
- tBodyAccMag-std()
- tGravityAccMag-std()
- tBodyAccJerkMag-std()
- fBodyAcc-mean()-X
- fBodyAcc-mean()-Y
- fBodyAcc-mean()-Z
- fBodyAccJerk-mean()-X
- fBodyAccJerk-mean()-Y
- fBodyAccJerk-mean()-Z
- fBodyAccMag-mean()
- fBodyBodyAccJerkMag-mean()
- fBodyAcc-std()-X
- fBodyAcc-std()-Y
- fBodyAcc-std()-Z
- fBodyAccJerk-std()-X
- fBodyAccJerk-std()-Y
- fBodyAccJerk-std()-Z
- fBodyAccMag-std()
- fBodyBodyAccJerkMag-std()

All variables (measurements) below are in radians/second. Each value in "average.txt" is the mean of all observations of that variable in "merged_data" for each activity of each subject.
- tBodyGyro-mean()-X
- tBodyGyro-mean()-Y
- tBodyGyro-mean()-Z
- tBodyGyroJerk-mean()-X
- tBodyGyroJerk-mean()-Y
- tBodyGyroJerk-mean()-Z
- tBodyGyroMag-mean()
- tBodyGyroJerkMag-mean()
- tBodyGyro-std()-X
- tBodyGyro-std()-Y
- tBodyGyro-std()-Z
- tBodyGyroJerk-std()-X
- tBodyGyroJerk-std()-Y
- tBodyGyroJerk-std()-Z
- tBodyGyroMag-std()
- tBodyGyroJerkMag-std()
- fBodyGyro-mean()-X
- fBodyGyro-mean()-Y
- fBodyGyro-mean()-Z
- fBodyBodyGyroMag-mean()
- fBodyBodyGyroJerkMag-mean()
- fBodyGyro-std()-X
- fBodyGyro-std()-Y
- fBodyGyro-std()-Z
- fBodyBodyGyroMag-std()
- fBodyBodyGyroJerkMag-std()

This codebook updates the explanation in the UCI HAR Dataset "features_info.txt" file with the information that each measurement value in "average.txt" is a mean.

For practical reasons, please refer to "features_info.txt" for an explanation of each measurement name.