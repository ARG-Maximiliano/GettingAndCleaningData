## Getting and Cleaning Data Course Project

This is a submission for the peer-graded assignment in the Coursera’s Getting and Cleaning Data course. The purpose of the project is that students can demonstrate their abilities to collect, work with, and clean a dataset.

---

### Dataset

The dataset for the project will be the Human Activity Recognition Using Smartphones Dataset [1].

It can be downloaded from the following link:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

*[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012*

---

### Files

In the repository there are available the following files:

**run_analysis.R**: an R script that performs the five steps asked in the description of the assignment:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

**Tidy_Dataset.txt**: a file with the dataset obtained after running the run_analysis.R script.

**CodeBook.md**: a code book that explains the transformations applied to the original dataset through the run_analysis.R script to obtain the dataset as presented in the Tidy_Dataset.txt file. It also includes an explanation of the variables within the dataset mentioned above.