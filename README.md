# HW_course3_week4

The data used in project is https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The script run_analysis.R does the following:

## Merges the training and the test sets to create one data set.
I create three datasets by joining followed data pairs with rbind:
  X_train.txt and X_test.txt  with column names at feature.txt
  y_train.txt and y_test.txt  with column names "activity"
  subject_train.txt and subject_test.txt with column names "subject"
Finally, I merge theese three dataset with cbind and get single dataframe with 10228 rows and 81 columns  

## Extracts only the measurements on the mean and standard deviation for each measurement.


Uses descriptive activity names to name the activities in the data set


Appropriately labels the data set with descriptive variable names.


From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


