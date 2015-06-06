setwd('~/Documents/Personal Projects/Baseball/')
batting_stats$X1B <- (batting_stats$H - batting_stats$X2B - batting_stats$X3B - batting_stats$HR) #Singles
#below is the total fantasy points in a game judged by Fan Duel's scoring system for batters
batting_stats$Fantasy_Points <- ((batting_stats$HR*4)+(batting_stats$X1B)+(batting_stats$X2B*2)+(batting_stats$X3B*3)+(batting_stats$RBI)+(batting_stats$SB)+(batting_stats$HBP)+(batting_stats$BB)+(batting_stats$R)-(batting_stats$AB-batting_stats$H)*.25)
batting_stats$FPPG <- batting_stats$Fantasy_Points/batting_stats$G #Fantasy Points Per a Game
library(ggplot2)
plot(batting_stats$Fantasy_Points,batting_stats$FPPG)
help(qplot)
qplot(Fantasy_Points,FPPG,data = batting_stats, xlab = 'Total Fantasy Points(2015)', ylab = 'Fantasy Points Per Game(2015)')
mlb2014$X1B <- (mlb2014$H - mlb2014$X2B - mlb2014$X3B - mlb2014$HR) #Singles
mlb2014$Fantasy_Points <- ((mlb2014$HR*4)+(mlb2014$X1B)+(mlb2014$X2B*2)+(mlb2014$X3B*3)+(mlb2014$RBI)+(mlb2014$SB)+(mlb2014$HBP)+(mlb2014$BB)+(mlb2014$R)-(mlb2014$AB-mlb2014$H)*.25)
mlb2014$FPPG <- mlb2014$Fantasy_Points/mlb2014$G #Fantasy Points Per a Game
qplot(Fantasy_Points,FPPG ,data = mlb2014, xlab = 'Total Fantasy Points (2014)', ylab = 'Fantasy Points Per Game (2014)')

#This didn't work, tried to use the multiplot function from the grid package
#however the function wasn't there when I looked for it
#p1 <- qplot(Fantasy_Points,FPPG,data = batting_stats, xlab = 'Total Fantasy Points(2015)', ylab = 'Fantasy Points Per Game(2015)')
#p2 <- qplot(Fantasy_Points,FPPG ,data = mlb2014, xlab = 'Total Fantasy Points (2014)', ylab = 'Fantasy Points Per Game (2014)')
#library(grid)
#help(multiplot)
#multiplot(p1,p2,cols=2)
help(ggplot)
qplot(ERA,WHIP, data=pitcherstats2015,xlab = "Earned Runs Average", ylab= "Walks and Hits per Inning Pitched",label)
qplot(ERA,K, data=pitcherstats2015,xlab = "Earned Runs Average", ylab= "Strike Outs")
qplot(WHIP,K, data=pitcherstats2015,xlab = "Walks and Hits Per Inning", ylab= "Strike outs")
qplot(ERA,IP, data=pitcherstats2015,xlab = "Earned Runs Average", ylab= "Innings Pitched")
qplot(WHIP,IP, data=pitcherstats2015,xlab = "Walks and Hits Per Inning", ylab= "Innings Pitched")


library(randomForest)
library(readr)
set.seed(0)
trainsize <- 100000
treesize <- 100
numberofrows <- sample(1:nrow(mlb2014)trainsize)
x <- as.factor(train[numberofrows,1])
train <- train[numberofrows,-1]
randomforest <- randomForest(mlb2014, x, xtest=test, ntree=treesize)
prediction <- data.frame(Fantasy_Points=1:nrow(batting_stats), x=levels(labels)[randomforest$test$predicted])
write_csv(predictions[,11:12], "test") 
fit <- rpart(Fantasy_POints ~ AVG + OBP + BABIP + OPS + wOBA, data=batting_stats, method="class")
plot(fit)
printcp(fit)
plotcp(fit)
summary(fit)

aggregate(Fantasy_Points ~ AVG, data=batting_stats, FUN=sum)
aggregate(Fantasy_Points ~ AVG, data=batting_stats, FUN=function(x) {sum(x)/length(x)})
aggregate(Fantasy_Points ~ OBP, data=batting_stats, FUN=function(x) {sum(x)/length(x)})
aggregate(Fantasy_Points ~ OPS, data=batting_stats, FUN=function(x) {sum(x)/length(x)})
aggregate(Fantasy_Points ~ BABIP, data=batting_stats, FUN=function(x) {sum(x)/length(x)})

help(glm)
glm(batting_stats$AVG+batting_stats$OPS+batting_stats$OBP+mlbadvanced$BABIP)
#p <- ggplot(aes(x=pitcherstats2015$ERA, y=pitcherstats2015$WHIP, label=pitcherstats2015$Last.Name))

aggregate(K ~ ERA, data=pitcherstats2015, FUN=function(x) {sum(x)/length(x)})
aggregate(k ~ WHIP, data=pitcherstats2015, FUN=function(x) {sum(x)/length(x)})


#p + geom_text()
attach(pitcherstats2015)
plot(pitcherstats2015$ERA, pitcherstats2015$WHIP, main="ERA vs WHIP", 
     xlab="ERA", ylab="WHIP", pch=18, col="blue")
text(pitcherstats2015$ERA, pitcherstats2015$WHIP, row.names(Last.Name), cex=0.6, pos=4, col="red")