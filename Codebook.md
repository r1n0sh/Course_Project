# NOTES #


## Study Design ##
*The dataset used in this study is obtained from experiments of Human Recognition using Smart Phones* 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

For each record in the dataset it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

After setting the source directory for the files, read into tables the data located in

- features.txt
- activity_labels.txt
- subject_train.txt
- x_train.txt
- y_train.txt
- subject_test.txt
- x_test.txt
- y_test.txt

The script `run_analysis.R` performs the 5 steps as described in the course project.

1. Merge the input data using the `rbind()` function. 
2. The columns with the mean and standard deviation measures are extracted from the whole dataset. Then the columns are renamed with labels extracted from `features.txt`
3. Uses descriptive activity names taken from `activity_labels.txt` to name the activities in the data set.
4. Appropriately labels the columns of data set with descriptive variable names using `gsub()`.
5. From the data set created above, an independent tidy data set (30 subjects * 6 activities = 180 rows)
with the average of each variable for each activity and each subject is created The output file is called `Tidy_data.txt`, and uploaded to this repository.

## Code Book ##
- `test_Xdata`, `train_Xdata`, `test_Ydata`, `train_Ydata`, `test_Subdata `and `train_Subdata` contain the data from the downloaded files.
- `merge_Xdata`, `merge_Ydata `and `merge_Subdata `were created by merging the previous datasets to further analysis.
- `featureData` contains the correct names for the `merge_Xdata `dataset, 
- Similarly, `activity_Data` variable contains names of all activities.
-  `merge_Subdata`, `merge_Xdata` and `merge_Ydata `are merged again into a big dataset `full_Data`.
- Finally, `Tidy_data` contains the relevant averages which will be later stored in a .txt file. 