# Readme 
This is the readme file of the Getting and Cleaning Data Course Project (getdata-030) of Coursera.

##Files
The following files are available:  
+ **[run_analysis.R](https://github.com/dtgeoinfo/getdata-030/blob/master/run_analysis.R)**. The R code that process the raw data and generate the tidy data file.
+ **[README.md](https://github.com/dtgeoinfo/getdata-030/blob/master/README.md)**. This file, that explains what files are available in the repo and what they do.
+ **[codebook.md](https://github.com/dtgeoinfo/getdata-030/blob/master/codebook.md)**. A file that explain all the variables in the tidy data file.
+ **[Readme_raw.md](https://github.com/dtgeoinfo/getdata-030/blob/master/Readme_raw.md)**. A file that describe the raw data. It's referenced in the codebook.  
+ **[features_info.txt](https://github.com/dtgeoinfo/getdata-030/blob/master/features_info.txt)**. Another file that describe the raw data. It's referenced in the codebook. 

## Process
1. Download the data.
2. Unzip the data.
3. Read the train and test data in data frames.
4. Merge the train and test data in a new dataframe: "ucihar".
5. Give better names to the columns, to improve further references to them. Type "activities" and "subject" and extracts the rest of them of the features.txt file in the raw data.
6. Extracts only the measurements on the mean and standard deviation for each measurement (i.e. select the column names that have the words "means" or "std" in their names and exclude those that have the word meanFreq").
7. Change the values of activities (1,2,3..) by theirs names ("laying", "siting", etc)
8. Eliminate strange characters and typos of the column names.
9. Create a new data frame with the average of each variable for each activity and each subject.
This data frame ("varByActSub") has the propierties of tidy data: each variable is in one column, Each different observation is in a different row.
10. Export that data frame to a new file: "ucihar_tidy.txt".

Complete steps (the code) to create the tidy data are found in the [run_analysis.R](https://github.com/dtgeoinfo/getdata-030/blob/master/run_analysis.R) file.