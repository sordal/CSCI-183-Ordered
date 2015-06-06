# simple random forest
# tried the simple random forest and got like .5... something which is pretty bad
setwd('~/Desktop/ThirdKaggle')
library(randomForest)
library(readr)
set.seed(0)
trainsize <- 100000
treesize <- 100
train <- read_csv("test.csv")
test <- read_csv("train.csv")
numberofrows <- sample(1:nrow(train)trainsize)
x <- as.factor(train[numberofrows,1])
train <- train[numberofrows,-1]
randomforest <- randomForest(train, labels, xtest=test, ntree=treesize)
prediction <- data.frame(ImageId=1:nrow(test), Label=levels(labels)[randomforest$test$predicted])
write_csv(predictions[,11:12], "randomforestsecond3") 
