#DRAFT
# 1 Merge the training and test sets to create one data set.
# 2. Extract only the measures of the mean and standard deviation of each measure.
# 3 use descriptive activity names to name activities
#in the dataset
# 4. Properly label the dataset with descriptive variable names.
# 5 From the data set from step 4, create a second set of
# ordered and independent data with the average of each variable for each
#activity and each topic.

#******************************************************************
# 1.Merges the training and the test sets to create one data set.
#******************************************************************
#create directory
dir.create("./dataset")
#download file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./dataset/Dataset.zip")
#extract file
unzip(zipfile="./data/Dataset.zip",exdir="./data")

#  Reading files

# 1.1.1  Reading trainings tables:

train_1 <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
train_2 <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# 1.1.2 Reading testing tables:
test_1 <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
test_2 <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# 1.1.3 Reading feature vector:
features <- read.table('./data/UCI HAR Dataset/features.txt')

# 1.1.4 Reading activity labels:
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')
#1.3 Merging all data in one set:
datos1<-rbind(test_1, train_1)
datos2<-rbind(test_2, train_2)
Subject<-rbind(subject_test, subject_train)

#2.-Extracts only the measurements on the mean and standard deviation for each measurement.

#getting features indices which contain std and mean
index<-grep("mean\\(\\)|std\\(\\)", features[,2]) 
datos1<- datos1[,index]

#Step 3. Uses descriptive activity names to name the activities in the data set

datos2[,1]<-activityLabels[datos2[,1],2]
head(datos2) 
#******************************************************************
#Step 4. Appropriately labels the data set with descriptive variable names.
#******************************************************************
## getting names for variables
names<-features[index,2] 
## updating colNames for new dataset
names(datos1)<-names 
names(Subject)<-"Subject_ID"
names(datos2)<-"Activity"
CleanedData<-cbind(Subject, datos2, datos1)

#******************************************************************
#Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#******************************************************************

#5.1 Making a second tidy data set
library(data.table)
CleanedData<-data.table(CleanedData)
## features average by Subject and by activity
Datos_finales <- CleanedData[, lapply(.SD, mean), by = 'Subject_ID,Activity']
#5.2 Writing second tidy data set in txt file

write.table(Datos_finales, "Data.txt", row.name=FALSE)
