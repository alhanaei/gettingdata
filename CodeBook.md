---
title: "CodeBook"
author: "Ahmed Alhanaei"
date: "February 22, 2015"
output: html_document
---

## Orignal Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Tidy Data SET

An aggregate data set from the original data set,  with the average of each variable for each activity and each subject.
In this data set we are getting the average of the mean and standard deviation for each measurement in the original data set. measurements.

## Attribute Information:

For each record in the dataset it is provided mean of the measurement grouped by two variables activites (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) and subjects (1-30). The final set has total of 180 records. 
The original data set contains Triaxial Angular velocity from the gyroscope, feature vector with time and frequecies. In the Tidy data set we record the means of the original data for selected column (the columns that contain mean and standard deviation records) 
