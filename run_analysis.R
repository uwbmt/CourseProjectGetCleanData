print("Script started")
library(reshape2)

print("Reading test data")
subject.test <- read.table('./test/subject_test.txt')
x.test <- read.table('./test/X_test.txt')
y.test <- read.table('./test/y_test.txt')

print("Reading training data")
subject.train <- read.table('./train/subject_train.txt')
x.train <- read.table('./train/X_train.txt')
y.train <- read.table('./train/y_train.txt')

print("Reading features and activity labels")
features <- read.table('features.txt')
activity.labels <- read.table('activity_labels.txt')

print("Assign feature labels")
colnames(x.test) <- features$V2
colnames(x.train) <- features$V2

print("Find relevant features")
mean.cols <-  grep('mean', features$V2)
std.cols <-  grep('std', features$V2)

cols.of.interest <- features[c(mean.cols, std.cols),]

print("Rename labels")
x.test <- x.test[, cols.of.interest$V2]
x.train <- x.train[, cols.of.interest$V2]

colnames(x.test) <- cols.of.interest$V2
colnames(x.train) <- cols.of.interest$V2

print("Rename activities")
y.test.labeled <- factor(y.test$V1, activity.labels$V1,activity.labels$V2)
y.train.labeled <- factor(y.train$V1, activity.labels$V1,activity.labels$V2)

print("Combine data")
test <- cbind(subject.test, y.test.labeled, x.test)
train <- cbind(subject.train, y.train.labeled, x.train)

colnames(test) <- c('Subject','Activity', colnames(test)[3:81])
colnames(train) <- c('Subject','Activity', colnames(train)[3:81])

print("Finish tidy data")
tidy.data <- rbind(test,train)

print("Write tidy data to file")
write.table(tidy.data, "tidy_data.txt", sep="\t")

print("Melt tidy data")
tidy.data.melted <- melt(tidy.data,id=c("Subject","Activity"),measure.vars=colnames(test)[3:81])

print("Cast melted tidy data")
final.output <- dcast(tidy.data.melted, Subject + Activity ~ variable, mean)

print("Write final output to file")
write.table(final.output, "final_output.txt", sep="\t")

print("Done")


