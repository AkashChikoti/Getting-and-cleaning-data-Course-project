############# Loading dependent libraries ############
library(reshape2)

############# Reading the data ##################
# Reading train data
X_train <- read.table("X_train.txt")
Y_train <- read.table("Y_train.txt")
subject_train <- read.table("subject_train.txt")

# Reading test data
X_test <- read.table("X_test.txt")
Y_test <- read.table("Y_test.txt")
subject_test <- read.table("subject_test.txt")

# Reading features and activity data
activity_labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")

########### Naming columns ###############
# Naming columns of train and test set data using features list
names(X_test) <- features$V2
names(X_train) <- features$V2

# Naming subject data column
names(subject_train) <- "subjectNo"
names(subject_test) <- "subjectNo"

# Naming activities data
names(Y_train) <- "activity"
names(Y_test) <- "activity"

########### Activity description ###########
# Mapping activity names
Y_train$activity <- factor(Y_train$activity, labels = activity_labels$V2)
Y_test$activity <- factor(Y_test$activity, labels = activity_labels$V2)

########### Subsetting variables #############
# Keeping only features that calculated mean or standard deviation (contains mean() or std() in the column name)
X_train_features <- X_train[, grepl("mean\\(\\)", features$V2) | grepl("std\\(\\)", features$V2)]
X_test_features <- X_test[, grepl("mean\\(\\)", features$V2) | grepl("std\\(\\)", features$V2)]

########### Combining data #############
# Combining activity, subject and measurement data for both train and test set
finalData <- rbind(cbind(subject_train,Y_train,X_train_features),
                   cbind(subject_test,Y_test,X_test_features))

########### Tidying data ###############
# Creating a tidy data
melted <- melt(finalData, id=c("subjectNo","activity"))
tidyData <- dcast(melted, subjectNo+activity ~ variable, mean)

########### Writing tidy data ###############
# Write the tidy data to a file
write.table(tidyData, "tidyData.txt", row.names=FALSE)
