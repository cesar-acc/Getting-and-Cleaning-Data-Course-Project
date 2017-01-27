#CODE BOOK

This repository was created in order to complete Coursera's Getting and Cleaning Data Course project.

## Instructions

Download the next data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Create an R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Note: In the R script can be found commentaries with the steps followed to achieve the goals.

## Variables

x_test and x_train: objects that use the function read.table() to load the txt files of the test and training sets.
y_test and y_train: objects that use the function read.table() to load the txt files of the test and training labels.
s_test and s_train: objects that use the function read.table() to load the txt files of the test and training subjects.

x_set, y_set and s_set: objects that use the function rbind() to merge the tables loaded previosly.

features: object that uses the funcion read.table() to load the txt file with the names of the variables.
pattern: uses the grep() function to search in the variables names the labels "mean" or "std".
x: subset of the data set with only the variables that contain mean or std in their names.
activities: object that uses the funcion read.table() to load the txt file with the names of the activities.

xys: data set with the data from the X sets, the Y labels and the subjects.
final: uses ddply to create an indepedent tidy data set with the average of each variable for each activity and each subject.
