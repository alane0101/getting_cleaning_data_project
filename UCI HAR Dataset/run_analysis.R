packages <- c("dplyr", "data.table")
lapply(packages, library, character.only = TRUE)

# Read the various datasets into variables

trainlabels <- fread("./train/y_train.txt")
trainset <- fread("./train/X_train.txt")
trainsubj <- fread("./train/subject_train.txt")

testlabels <- fread("./test/y_test.txt")
testset <- fread("./test/X_test.txt")
testsubj <- fread("./test/subject_test.txt")

activitylabels <- fread("./activity_labels.txt")

featurenames <- fread("./features.txt")

# Label the dataset with descriptive variable names

colnames(trainset) <- featurenames$V2
colnames(testset) <- featurenames$V2

colnames(trainsubj) <- "subject"
colnames(testsubj) <- "subject"

# Extract only the measurements on the mean and standard deviation for each measurement

testsubset <- subset(testset, select = grep("mean|std", names(testset), ignore.case = TRUE))
trainsubset <- subset(trainset, select = grep("mean|std", names(trainset), ignore.case = TRUE))


# Rename the activities in the dataset with descriptive names

getactlabel <- function(classid){
  activitylabels$V2[classid]
}

trainact <- sapply(trainlabels, getactlabel)
colnames(trainact) <- "activity"
testact <- sapply(testlabels, getactlabel)
colnames(testact) <- "activity"

# Merge the training and the test sets to create one data set

testmerge <- cbind(testsubj, testact, testsubset)
trainmerge <- cbind(trainsubj, trainact, trainsubset)
merged <- rbind(trainmerge, testmerge)

# From the dataset above, create a second, independent tidy data set with the average of each variable for each activity and each subject

tidy_avg <- aggregate(merged[, 3:ncol(merged)], list(merged$subject, merged$activity), mean)

