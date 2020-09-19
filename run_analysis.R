#Reading the files
#You need to have the "UCI HAR Dataset" folder in your working directory 

#Test datasets
data_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
label_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjects_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
#Train datasets
data_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
label_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subjects_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
#Features
features <- read.table("./UCI HAR Dataset/features.txt")
#Activities
activivities_label <- read.table("./UCI HAR Dataset/activity_labels.txt")


#Adding subjects and activities to both test and train datasets

data_test_complete <- cbind(subjects_test, label_test, data_test)
data_train_complete <- cbind(subjects_train, label_train, data_train)


#Merging test and train datasets

merge_dataset <- rbind(data_test_complete, data_train_complete)


#Adding labels to the merge dataset

names(merge_dataset) <- c("Subjects", "Activities", features[[2]])


#Selecting variables to which mean and std was calculated

merge_dataset_selection <- merge_dataset[, c(1,2, grep("[Mm]ean|[Ss]td", names(merge_dataset)))]


#Assigning descriptive activity names to the activities

merge_dataset_selection$activities <- factor(as.character(merge_dataset_selection$Activities), activivities_label$V1, labels = activivities_label$V2)


#Assigning appropiate labels to the variables 

names(merge_dataset_selection) <- gsub("BodyBody", "Body", names(merge_dataset_selection))
names(merge_dataset_selection) <- gsub("tBody", "TimeBody", names(merge_dataset_selection))
names(merge_dataset_selection) <- gsub("tGravity", "TimeGravity", names(merge_dataset_selection))
names(merge_dataset_selection) <- gsub("fBody", "FrecuencyBody", names(merge_dataset_selection))
names(merge_dataset_selection) <- gsub("Acc", "Acceleration", names(merge_dataset_selection))
names(merge_dataset_selection) <- gsub("Gyro", "Gyroscope", names(merge_dataset_selection))
names(merge_dataset_selection) <- gsub("Mag", "Magnitude", names(merge_dataset_selection))
names(merge_dataset_selection) <- gsub("-mean\\(\\)", "Mean", names(merge_dataset_selection))
names(merge_dataset_selection) <- gsub("-std\\(\\)", "Std", names(merge_dataset_selection))
names(merge_dataset_selection) <- gsub("meanFreq\\(\\)", "MeanFrequency", names(merge_dataset_selection))
names(merge_dataset_selection) <- gsub("-", "", names(merge_dataset_selection))
names(merge_dataset_selection) <- gsub(",gravity", "Gravity", names(merge_dataset_selection))
names(merge_dataset_selection) <- gsub("\\)", "", names(merge_dataset_selection))
names(merge_dataset_selection) <- gsub("\\(", "", names(merge_dataset_selection))
names(merge_dataset_selection) <- gsub("angle", "Angle", names(merge_dataset_selection))

#Calculating the average of each variable for each activity and each subject
#Will use the package dplyr to performe the task

library(dplyr)
dataset_grouped <- group_by(merge_dataset_selection, Activities, Subjects)
dataset_grouped_average <- summarize_all(dataset_grouped, mean)


View(dataset_grouped_average)
write.table(dataset_grouped_average, "./Tidy_dataset.txt", row.names = FALSE)

