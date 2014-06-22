## loading files 

features <- read.table("features.txt")
names(features) <- c("feature_number","feature_name")
activity_labels <- read.table("activity_labels.txt")
names(activity_labels) <- c("label","activityname")

## loading test data
setwd("./test")

subject_test <- read.table("subject_test.txt")
X_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")

names(y_test) <- "label"
names(X_test) <- features$feature_name
names(subject_test) <- "subject"

X_test_full <- cbind(subject_test,y_test,X_test)
## loading train data


setwd("../")
setwd("./train")

subject_train <- read.table("subject_train.txt")
X_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")

names(y_train) <- "label"
names(X_train) <- features$feature_name
names(subject_train) <- "subject"

X_train_full <- cbind(subject_train,y_train,X_train)

## merging train and test data into one data frame
global_data<-rbind(X_test_full,X_train_full)


## lookin for standard deviation and mean vars

global_data_std <- grep("std\\(\\)", names(global_data), value = TRUE)
global_data_mean <- grep("mean\\(\\)",names(global_data), value = TRUE)

vars_with_std_mean <- c(global_data_std,global_data_mean)
cols_with_std_mean <- c("label","subject", global_data_std,global_data_mean)

## setting a data frame only with std and mean vars
global_data_std_mean <- global_data[ , cols_with_std_mean]


## renaming columns


names(global_data_std_mean) <- gsub("\\(", "" , names(global_data_std_mean))
names(global_data_std_mean) <- gsub("\\)", "" , names(global_data_std_mean))
names(global_data_std_mean) <- gsub("-", "" , names(global_data_std_mean))
names(global_data_std_mean) <- gsub("std", "StanDev" , names(global_data_std_mean))
names(global_data_std_mean) <- gsub("mean", "Mean" , names(global_data_std_mean))

## calculating means

library(plyr)
vars_with_std_mean <- setdiff(names(global_data_std_mean),"label")
vars_with_std_mean <- setdiff(vars_with_std_mean,"subject")
global_data_std_mean_average <- aggregate(global_data_std_mean[ vars_with_std_mean], by = list(global_data_std_mean$label,global_data_std_mean$subject), mean )





names(global_data_std_mean_average) <- gsub( "Group.1", "label", names(global_data_std_mean_average) )
names(global_data_std_mean_average) <- gsub( "Group.2", "subject", names(global_data_std_mean_average) )

global_data_std_mean_average <- merge(activity_labels, global_data_std_mean_average)
##back to main directory
setwd("../")

##writing tidy data

write.table(global_data_std_mean_average, "tidy_average_activity_subject.txt", row.names = FALSE)







