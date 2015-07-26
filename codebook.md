---
title: "Codebook "
author: "David"
date: "7/20/2015"
output:
  html_document:
    keep_md: yes
---

## Project Description
The goal of this project is to prepare tidy data about wearable computing that can be used for later analysis.

##Raw data
The [README-raw.txt](https://github.com/dtgeoinfo/getdata-030/blob/master/README-raw.txt) file, includes a description of how the data was collected. and what the raw dataset includes. The  'data/features_info.txt'  file shows information about the variables used on the feature vector.

##Guide to create the tidy data file
1. Download the data.
2. Unzip the data.
3. Read the train and test data in data frames.
4. Merge the train and test data in a new dataframe: "ucihar".
5. Give better names to the columns, to improve further references to them. Type "activities" and "subject" and extracts the rest of them of the features.txt file in the raw data.
6. Extracts only the measurements on the mean and standard deviation for each measurement.
7. Change the values of activities (1,2,3..) by theirs names ("laying", "siting", etc)
8. Eliminate strange characters and typos of the column names.
9. Create a new data frame with the average of each variable for each activity and each subject.
This data frame ("varByActSub") has the propierties of tidy data: each variable is in one column, Each different observation is in a different row.
10. Export that data frame to a new file: "ucihar_tidy.txt".

Complete steps (the code) to create the tidy data are found in the run_analysis.R file.

##Description of the variables in the tidy_data.txt file  
The dataset has 180 observations (30 subjects x 6 activities) of 66 variables (68 including "activity" and "subject").
* "activity" - Represent the six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) that each person performed wearing a smartphone.  
* "subject" - Represent the ID of each of the subject of a group of 30 volunteers within an age bracket of 19-48 years.  
* The rest of the variables, represent the average of that variable for each activity and each subject. The [features_info.txt](https://github.com/dtgeoinfo/getdata-030/blob/master/features_info.txt) file explains the means of each of these variables.  

##Sources
Sources you used if any, otherise leave out.

##Annex
If you used any code in the codebook that had the echo=FALSE attribute post this here (make sure you set the results parameter to 'hide' as you do not want the results to show again)