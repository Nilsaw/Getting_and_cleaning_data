#A scrambled up version of the Code. Did not have time to clean it up. 


X_train <- read.table("UCI_HAR_Dataset/train/X_train.txt")
X_test <- read.table("UCI_HAR_Dataset/test/X_test.txt")
subject_train <- read.table("UCI_HAR_Dataset/train/subject_train.txt")
subject_test <- read.table("UCI_HAR_Dataset/test/subject_test.txt")
y_train <- read.table("UCI_HAR_Dataset/train/y_train.txt")
y_test <- read.table("UCI_HAR_Dataset/test/y_test.txt")
x_table <- rbind(X_train, X_test)
subject <- rbind(subject_train, subject_test)
y_table <- rbind(y_train, y_test)
features <- read.table("UCI_HAR_Dataset/features.txt")
indices_of_good_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
x_table <- x_table[, indices_of_good_features]
names(x_table) <- features[indices_of_good_features, 2]
names(x_table) <- gsub("\\(|\\)", "", names(x_table))
names(x_table) <- tolower(names(x_table)) 
activities <- read.table("UCI_HAR_Dataset/activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
y_table[,1] = activities[y_table[,1], 2]
names(y_table) <- "activity"
names(subject) <- "subject"
tidyData <- cbind(subject, y_table, x_table)
write.table(tidyData, "TidyData.txt")
uniqueSubjects = unique(subject)[,1]
numSubjects = length(unique(subject)[,1])
numActivities = length(activities[,1])
numCols = dim(tidyData)[2]
result = tidyData[1:(numSubjects*numActivities), ]
row = 1
for (s in 1:numSubjects) {
  for (a in 1:numActivities) {
    result[row, 1] = uniqueSubjects[s]
    result[row, 2] = activities[a, 2]
    tmp <- tidyData[tidyData$subject==s & tidyData$activity==activities[a, 2], ]
    result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
    row = row+1
  }
}
write.table(result, "dataSetContainingaverages.txt")
