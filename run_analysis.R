
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
              destfile="projectfilesDataset.zip", method="curl")

# Read the data
unzip(zipfile ="data/getdata_projectfiles_UCI HAR Dataset.zip")
x_test <- read.table("data/test/X_test.txt")
subject_test <- read.table("data/test/subject_test.txt")
y_test <- read.table("data/test/y_test.txt")
x_train <- read.table("data/train/X_train.txt")
subject_train <- read.table("data/train/subject_train.txt")
y_train <- read.table("data/train/y_train.txt")
features <- read.table("data/features.txt", stringsAsFactors = F)

# 1. Merges the training and the test sets to create one data set.
## Add the subject and activity column
test <- cbind(subject_test, y_test, x_test)

train <- cbind(subject_train, y_train, x_train)
ucihar <- rbind(test, train)

## Column names
columnNames <- as.vector(c("subject", "activity", features[[2]]))
names(ucihar) <- columnNames

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
library(stringr)
columnas<- str_detect(names(ucihar), ("subject|activity|mean|std"))
ucihar_ms <- ucihar[columnas]
Meanfreq <- str_detect(names(ucihar_ms), ("meanFreq"))
Meanfreq <- which(Meanfreq)
ucihar_ms <- ucihar_ms[,-Meanfreq]

# 3.Uses descriptive activity names to name the activities in the data set
activity <- read.table("data/activity_labels.txt")
ucihar_tmp1 <- merge(ucihar_ms, activity, by.x="activity", by.y="V1")
ucihar_tmp1 <- ucihar_tmp1[,-1]; 
names(ucihar_tmp1)[68]<-"activity"
ucihar_ms <- ucihar_tmp1
ucihar_tmp1 <- NULL

#4. Appropriately labels the data set with descriptive variable names. 
etiq <- names(ucihar_ms)
etiq <- gsub('()', "", etiq, fixed=T)
etiq <- gsub('BodyBody', "Body", etiq, fixed=T)
etiq<-str_replace(etiq, "-", "_")
names(ucihar_ms) <- etiq
    
# 5. From the data set in step 4, creates a second, independent tidy data set with 
#the average of each variable for each activity and each subject.
library(dplyr)
varByActSub <- ucihar_ms %>%
            group_by(activity, subject) %>%
            summarise_each(funs(mean), c(2:67))

write.table(varByActSub, file="ucihar_tidy.txt", row.name=FALSE)
