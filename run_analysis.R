#This script labels the columns of the training and testing data using the 'features.txt' file
#Matches the features of with the corresponding activities using the 'y_train.txt' and 'y_test.txt' files
#on a row-wise basis.
#Finally, it combines the training and testing dataframes by using an rbind.

#Read feature names into memory.
features <- read.table("features.txt", header = FALSE)

#Read train activities and train data
train_activities <- read.table("train/y_train.txt",header = FALSE)
colnames(train_activities) <- 'Activity'
train_data <- read.table("train/X_train.txt",header = FALSE)

#Set train data column names to their features
#Filter columns so that they must contain "mean", "Mean" or "Std"
#C-Bind the activities with the features
colnames(train_data) <- features$V2
contain_mean <- grep('mean',colnames(train_data))
contain_Mean <- grep('Mean',colnames(train_data))
contain_std <- grep('std',colnames(train_data))
select_columns <- c(contain_mean, contain_Mean, contain_std)
train_data <- train_data[,select_columns]
train_data <- cbind(train_activities, train_data)


#Read test activities and test data
test_activities <- read.table("test/y_test.txt",header = FALSE)
colnames(test_activities) <- 'Activity'
test_data <- read.table("test/X_test.txt",header = FALSE)

#Set test data column names to their features
#Filter columns so that they must contain "mean", "Mean" or "Std"
#C-Bind the activities with the features
colnames(test_data) <- features$V2
contain_mean <- grep('mean',colnames(test_data))
contain_Mean <- grep('Mean',colnames(test_data))
contain_std <- grep('std',colnames(test_data))
select_columns <- c(contain_mean, contain_Mean, contain_std)
test_data <- test_data[,select_columns]
test_data <- cbind(test_activities, test_data)

#R-bind the training and testing data so it's one big dataset
#Write to file
all_data <- rbind(train_data,test_data)
write.table(all_data,"tidy_result.txt",row.name=FALSE,sep = '\t')