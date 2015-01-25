# Getting-and-Cleaning-Data


This script cleans and merges data from this dataset:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The dataset has files containing train and test versions of the following:

1) A list of the names of the features

2) Unlabeled X variable observations of those features (the columns of the observations are in the same order as the list from 1)

3) Observations of the Y variable to be predicted (the rows of this file match the rows of file 2)



This script labels the columns of the training and testing data by matching the correct labels to the correct columns.
It subsets this data, selecting only those features that contain "mean" or "std" (standard deviation) in the names.
It matches the X features with their corresponding Y observations.
At this point there are two dataframes. One for training, one for testing.
The script then merges these two dataframes using rbind.