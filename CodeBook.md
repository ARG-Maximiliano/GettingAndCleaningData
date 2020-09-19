## Getting and Cleaning Data Course Project | CODEBOOK

The **run_analysis.R** script performs the five steps asked in the description of the assignment to generate the dataset in the **Tidy_Dataset.txt** file. To run the script it is required that you download the original dataset and extract the "UCI HAR Dataset" folder in your working directory. The script was developed under the following R version and platform:

        R version 4.0.2 (2020-06-22) -- "Taking Off Again"
        Platform: x86_64-w64-mingw32/x64 (64-bit)

---

### Transformations to the original dataset

**Step 1**: Merges the training and the test sets to create one data set.

To begin with, the script will read 8 files from the folder mentioned above: *X_test.txt, y_test.txt, subject_test.txt, X_train.txt, y_train.txt, subject_train.txt, features.txt and activity_labels.txt*.Those files will be used to merge both test and training datasets by separate. After that, they will be merged into an object named `merge_dataset` and labels to the variables that they contain will be assigned.

**Step 2**: Extracts only the measurements on the mean and standard deviation for each measurement.
        
Only variables that contain the words `[Mn]ean` or `[Ss]td` will be selected from `merge_dataset` in order to fulfill the instructions in step 2. As a result the object `merge_dataset_selection` is created.

**Step 3**: Uses descriptive activity names to name the activities in the data set.

The variable `Activities` in `merge_dataset_selection` will be transformed to a factor variable and labels from the second vector of the *activity_labels.txt* file will be assigned.

**Step 4**: Appropriately labels the data set with descriptive variable names.
        
The labels in `merge_dataset_selection` from step 3 will be modified in order to describe more appropriate the variable names. Any *parentheses* and any *hyphen* will be removed. All the variables will labeled so that the terms begin with *capital letters*. As a result, the following terms will be replaced:

        BodyBody by Body
        tBody by TimeBody
        tGravity by TimeGravity
        fBody by FrecuencyBody
        Acc by Acceleration
        Gyro by Gyroscope
        Mag by Magnitude
        mean by Mean
        std by Std
        meanFreq by MeanFrequency
        gravity by Gravity

**Step 5**: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
        
For the fifth step, `dplyr package` will be used (Version 1.0.0). Two groups will be constructed with the `Activities` and `Subjets` variables. *Then all the rest of the variables will be summarize by the mean of their values*. The `dataset_grouped_average` object will contain this final transformation and by using the `write.table` function it will be stored in a txt file.

---

### Description of the variables in the Tidy_Dataset.txt file

After performing the **run_analysis.R** script we will obtain the dataset provided in the in the **Tidy_Dataset.txt** file (180 rows and 88 columns). This dataset contains the following variables:

(@) Subjects: an integer variable from 1 to 30 representing the subjects that participate in the experiment carried out in the original dataset.
(@) Activities: a factor variable with six types of activities that were named as WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING.

*The following variables indicate time and frequency features from the windows recorded at 50 Hz during the experiments:*

(@) TimeBodyAccelerationMeanX                          
(@) TimeBodyAccelerationMeanY                          
(@) TimeBodyAccelerationMeanZ                          
(@) TimeBodyAccelerationStdX                           
(@) TimeBodyAccelerationStdY                           
(@) TimeBodyAccelerationStdZ                           
(@) TimeGravityAccelerationMeanX                       
(@) TimeGravityAccelerationMeanY                       
(@) TimeGravityAccelerationMeanZ                       
(@) TimeGravityAccelerationStdX                        
(@) TimeGravityAccelerationStdY                        
(@) TimeGravityAccelerationStdZ                        
(@) TimeBodyAccelerationJerkMeanX                      
(@) TimeBodyAccelerationJerkMeanY                      
(@) TimeBodyAccelerationJerkMeanZ                      
(@) TimeBodyAccelerationJerkStdX                       
(@) TimeBodyAccelerationJerkStdY                       
(@) TimeBodyAccelerationJerkStdZ                       
(@) TimeBodyGyroscopeMeanX                             
(@) TimeBodyGyroscopeMeanY                             
(@) TimeBodyGyroscopeMeanZ                             
(@) TimeBodyGyroscopeStdX                              
(@) TimeBodyGyroscopeStdY                              
(@) TimeBodyGyroscopeStdZ                              
(@) TimeBodyGyroscopeJerkMeanX                         
(@) TimeBodyGyroscopeJerkMeanY                         
(@) TimeBodyGyroscopeJerkMeanZ                         
(@) TimeBodyGyroscopeJerkStdX                          
(@) TimeBodyGyroscopeJerkStdY                          
(@) TimeBodyGyroscopeJerkStdZ                          
(@) TimeBodyAccelerationMagnitudeMean                  
(@) TimeBodyAccelerationMagnitudeStd                   
(@) TimeGravityAccelerationMagnitudeMean               
(@) TimeGravityAccelerationMagnitudeStd                
(@) TimeBodyAccelerationJerkMagnitudeMean              
(@) TimeBodyAccelerationJerkMagnitudeStd               
(@) TimeBodyGyroscopeMagnitudeMean                     
(@) TimeBodyGyroscopeMagnitudeStd                      
(@) TimeBodyGyroscopeJerkMagnitudeMean                 
(@) TimeBodyGyroscopeJerkMagnitudeStd                  
(@) FrecuencyBodyAccelerationMeanX                     
(@) FrecuencyBodyAccelerationMeanY                     
(@) FrecuencyBodyAccelerationMeanZ                     
(@) FrecuencyBodyAccelerationStdX                      
(@) FrecuencyBodyAccelerationStdY                      
(@) FrecuencyBodyAccelerationStdZ                      
(@) FrecuencyBodyAccelerationMeanFrequencyX            
(@) FrecuencyBodyAccelerationMeanFrequencyY            
(@) FrecuencyBodyAccelerationMeanFrequencyZ            
(@) FrecuencyBodyAccelerationJerkMeanX                 
(@) FrecuencyBodyAccelerationJerkMeanY                 
(@) FrecuencyBodyAccelerationJerkMeanZ                 
(@) FrecuencyBodyAccelerationJerkStdX                  
(@) FrecuencyBodyAccelerationJerkStdY                  
(@) FrecuencyBodyAccelerationJerkStdZ                  
(@) FrecuencyBodyAccelerationJerkMeanFrequencyX        
(@) FrecuencyBodyAccelerationJerkMeanFrequencyY        
(@) FrecuencyBodyAccelerationJerkMeanFrequencyZ        
(@) FrecuencyBodyGyroscopeMeanX                        
(@) FrecuencyBodyGyroscopeMeanY                        
(@) FrecuencyBodyGyroscopeMeanZ                        
(@) FrecuencyBodyGyroscopeStdX                         
(@) FrecuencyBodyGyroscopeStdY                         
(@) FrecuencyBodyGyroscopeStdZ                         
(@) FrecuencyBodyGyroscopeMeanFrequencyX               
(@) FrecuencyBodyGyroscopeMeanFrequencyY               
(@) FrecuencyBodyGyroscopeMeanFrequencyZ               
(@) FrecuencyBodyAccelerationMagnitudeMean             
(@) FrecuencyBodyAccelerationMagnitudeStd              
(@) FrecuencyBodyAccelerationMagnitudeMeanFrequency    
(@) FrecuencyBodyAccelerationJerkMagnitudeMean         
(@) FrecuencyBodyAccelerationJerkMagnitudeStd          
(@) FrecuencyBodyAccelerationJerkMagnitudeMeanFrequency
(@) FrecuencyBodyGyroscopeMagnitudeMean                
(@) FrecuencyBodyGyroscopeMagnitudeStd                 
(@) FrecuencyBodyGyroscopeMagnitudeMeanFrequency       
(@) FrecuencyBodyGyroscopeJerkMagnitudeMean            
(@) FrecuencyBodyGyroscopeJerkMagnitudeStd             
(@) FrecuencyBodyGyroscopeJerkMagnitudeMeanFrequency   
(@) AngleTimeBodyAccelerationMeanGravity               
(@) AngleTimeBodyAccelerationJerkMeanGravityMean       
(@) AngleTimeBodyGyroscopeMeanGravityMean              
(@) AngleTimeBodyGyroscopeJerkMeanGravityMean          
(@) AngleXGravityMean                                  
(@) AngleYGravityMean                                  
(@) AngleZGravityMean

---

A full description of the original dataset is available at the site where the data was obtained:

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>
