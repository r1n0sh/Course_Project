library("dplyr")
library("tidyr")

#### Reading data from text files

test_Xdata <- read.table("./UCI HAR Dataset/test/X_test.txt")
train_Xdata <- read.table("./UCI HAR Dataset/train/X_train.txt")

test_Ydata <- read.table("./UCI HAR Dataset/test/y_test.txt")
train_Ydata <- read.table("./UCI HAR Dataset/train/y_train.txt")

test_Subdata <- read.table("./UCI HAR Dataset/test/subject_test.txt")
train_Subdata <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Step - 1 - Merging the input data #


merge_Xdata <- rbind(test_Xdata,train_Xdata)
merge_Ydata <- rbind(test_Ydata,train_Ydata)
merge_Subdata <- rbind(test_Subdata,train_Subdata)

# Step 2
# Extract only the measurements on the mean and standard deviation for each measurement

featureData <- read.table("./UCI HAR Dataset/features.txt")
colnames(merge_Xdata) <- featureData[,2]
pat <- grep("mean\\(\\)|std\\(\\)",colnames(merge_Xdata))
merge_Xdata <- merge_Xdata[,pat]

# Step 3
# Uses descriptive activity names to name the activities in the data set
activity_Data <- read.table("./UCI HAR Dataset/activity_labels.txt")
merge_Ydata[,1] <- activity_Data[merge_Ydata[,1],2]
colnames(merge_Ydata) <- "activities"

# Step 4
# Appropriately labels the data set with descriptive variable names
colnames(merge_Subdata) <- "subject"
full_Data <- cbind(merge_Subdata,merge_Ydata,merge_Xdata)
colnames(full_Data)<-gsub("^t", "time", colnames(full_Data))
colnames(full_Data)<-gsub("^f", "frequency", colnames(full_Data))
colnames(full_Data)<-gsub("Acc", "Accelerometer", colnames(full_Data))
colnames(full_Data)<-gsub("Gyro", "Gyroscope", colnames(full_Data))
colnames(full_Data)<-gsub("Mag", "Magnitude", colnames(full_Data))
colnames(full_Data)<-gsub("BodyBody", "Body", colnames(full_Data))


# Step 5
# From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

all_Data <- group_by(full_Data,subject,activities)
all_Data <- summarise_each(all_Data,funs(mean))

write.table(all_Data, "Tidy_data.txt", row.name=FALSE)