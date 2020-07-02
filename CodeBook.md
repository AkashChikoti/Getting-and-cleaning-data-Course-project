## Overview of the project

30 volunteers performed 6 different activities while wearing a smartphone. The smartphone captured various data about their movements. 30% of the volunteers were randomly selected and put in test set.

## Explanation of each file

* `features.txt` : Contains names of the 561 features measured.
* `activity_labels.txt` : Names and IDs for each of the 6 activities performed by the volunteers.
* `X_train.txt` : 7352 observations of the 561 features, for 21 of the 30 volunteers.
* `subject_train.txt` : A vector of 7352 integers, denoting the ID of the volunteer related to each of the observations in X_train.txt.
* `y_train.txt` : A vector of 7352 integers, denoting the ID of the activity related to each of the observations in X_train.txt.
* `X_test.txt` : 2947 observations of the 561 features, for 9 of the 30 volunteers.
* `subject_test.txt` : A vector of 2947 integers, denoting the ID of the volunteer related to each of the observations in X_test.txt.
* `y_test.txt` : A vector of 2947 integers, denoting the ID of the activity related to each of the observations in X_test.txt.

## Steps performed in the analysis

1. All the datasets mentioned above were read into R workspace as dataframes.
2. Column names were given to the datasets : features list to measured data X_train and X_test, subjectNo to subject_train and subject_test, Activity name to y_train and y_test using activity_labels
3. Subsetting the variables in measurement data which contains "mean()" and "std()" in the variable names. This led to selection of 66 variables
4. Combining activity, subject and measurement data for both train and test set
5. A tidy data set was created containing the mean of each feature for each subject and each activity. For instance, subject #1 has 6 records corresponding to each activity and each row contains the mean value for each of the 66 features for that subject/activity combination.
6. The tidy data set is written into a csv file to the working directory.
