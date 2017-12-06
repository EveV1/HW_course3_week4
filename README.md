## HW_course3_week4

The data used in project is https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The script run_analysis.R does the following:

### Merges data to one data set.
It reads files with folowing adresses:
* Dataset/features.txt as features
* Dataset/activity_labels.txt as labels
* Dataset/train/X_train.txt with column names at features
* Dataset/test/X_test.txt with column names at features
* Dataset/train/y_train.txt with column name "activity")
* Dataset/test/y_test.txt with column name "activity"))

It creates three datasets by joining followed data pairs with rbind:
 * X_train and X_test
 * y_train and y_test
 * subject_train and subject_test 
 
Finally, it merges theese three dataset with cbind and get single dataframe with 10299 rows and 563 columns  

### Extracts only the measurements on the mean and standard deviation for each measurement.
I choosed to treat meanFreq variables as mean variables.

It selects all variables which contains "mean" or "std".
Selected dataset contains 79 variabels with "mean" or "std" and variables "activity" and "subject".

### Uses descriptive activity names to name the activities in the data set


Appropriately labels the data set with descriptive variable names.


From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


