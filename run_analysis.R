rm(list=ls())
library(dplyr)
library(lubridate)
library(reshape2)
#Merges the training and the test sets to create one data set.
features<-readLines("Dataset/features.txt")
labels<-read.csv("Dataset/activity_labels.txt",sep=" ", header = FALSE)
data<-read.table("Dataset/train/X_train.txt",col.names= features)
data<-rbind(data,read.table("Dataset/test/X_test.txt", col.names= features))

data_y<-read.table("Dataset/train/y_train.txt",col.names = "activity")
data_y<-rbind(data_y, read.table("Dataset/test/y_test.txt", col.names = "activity"))

data_sub<-read.table("Dataset/train/subject_train.txt",col.names = "subject")
data_sub<-rbind(data_sub, read.table("Dataset/test/subject_test.txt", col.names = "subject"))

data1<-cbind(data,data_y,data_sub)

#Extracts only the measurements on the mean and standard deviation for each measurement.

feat_select<-grep("mean|std",features)
feat_select<-c(feat_select, length(features)+1, length(features)+2)
data1<-data1[,feat_select]

#Uses descriptive activity names to name the activities in the data set
data1$activity<-sapply(data1$activity,function(x) labels[x,2])

#Appropriately labels the data set with descriptive variable names.
features2<-names(data1)
features2<-gsub("Acc","_Accelerometer",features2)
features2<-gsub("Gyro","_Gyroscope",features2)
features2<-gsub("X[0-9]*.","",features2)
features2<-gsub("^t","time_domain_",features2)
features2<-gsub("^f","frequency_domain_",features2)
features2<-gsub("\\.\\.","",features2)
features2<-gsub("\\.","_",features2)
features2<-gsub("Mag","_Magnitude",features2)
features2<-gsub("Jerk","_Jerk",features2)
names(data1)<- features2

#From the data set in step 4, creates a second, 
#independent tidy data set with the average of each variable 
#for each activity and each subject.
data2<- melt(data1, id=c("activity","subject"))
data2<-dcast(data2, activity + subject ~ variable, mean)
write.table(data2,file= "dataset5.txt", row.name=FALSE)

