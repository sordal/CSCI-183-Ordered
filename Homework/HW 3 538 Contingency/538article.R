help(setwd)
setwd('~/Desktop/CSCI 183 Ordered/Homework/HW 3 538 Contingency')


#get rid of NA's for marhomo variable
generalsurvey2010$marhomo[is.na(generalsurvey2010$marhomo)] <- mean(generalsurvey2010$marhomo, na.rm = TRUE)
generalsurvey2012$marhomo[is.na(generalsurvey2012$marhomo)] <- mean(generalsurvey2012$marhomo, na.rm = TRUE)

#same as above but for eqwlth
generalsurvey2010$eqwlth[is.na(generalsurvey2010$eqwlth)] <- mean(generalsurvey2010$eqwlth, na.rm = TRUE)
generalsurvey2012$eqwlth[is.na(generalsurvey2012$eqwlth)] <- mean(generalsurvey2012$eqwlth, na.rm = TRUE)

#notes from article
#hardhats favor income redistribuition and against gay marriage
#libertarians favor gay marriage and are against income redistribution
#liberals favor both
#conservative are against both

hardhat2010 <- (generalsurvey2010$marhomo > mean(generalsurvey2010$marhomo) & generalsurvey2010$eqwlth < mean(generalsurvey2010$eqwlth))
hardhat2012<-  (generalsurvey2012$marhomo > mean(generalsurvey2012$marhomo) & generalsurvey2012$eqwlth < mean(generalsurvey2012$eqwlth))
hardhat <- sum(hardhat2010,hardhat2012)

libertarian2010 <- (generalsurvey2010$marhomo < mean(generalsurvey2010$marhomo) & generalsurvey2010$eqwlth > mean(generalsurvey2010$eqwlth))
libertarian2012 <- (generalsurvey2012$marhomo < mean(generalsurvey2012$marhomo) & generalsurvey2012$eqwlth > mean(generalsurvey2012$eqwlth))
libertarian <- sum(libertarian2010,libertarian2012)

conservative2010 <- (generalsurvey2010$marhomo > mean(generalsurvey2010$marhomo) & generalsurvey2010$eqwlth > mean(generalsurvey2010$eqwlth))
conservative2012 <- (generalsurvey2012$marhomo > mean(generalsurvey2012$marhomo) & generalsurvey2012$eqwlth > mean(generalsurvey2012$eqwlth)) 
conservative <- sum(conservative2010,conservative2012)

liberal2010 <- (generalsurvey2010$marhomo < mean(generalsurvey2010$marhomo) & generalsurvey2010$eqwlth < mean(generalsurvey2010$eqwlth))
liberal2012 <- (generalsurvey2012$marhomo < mean(generalsurvey2012$marhomo) & generalsurvey2012$eqwlth < mean(generalsurvey2012$eqwlth))
liberal <- sum(liberal2010,liberal2012)

total <- sum(liberal, libertarian, hardhat, conservative) #need total for percentage

help(round)

percentage_hardhat <- round(hardhat / total * 100) #finding percentages
percentage_libertarian <- round(libertarian / total * 100)
percentage_conservative <- round(conservative / total * 100)
percentage_liberal <- round(liberal / total * 100)

help(matrix)
help(dimnames)
help(mosaic)
help(labeling_cells)
#creating the mosaic table using instructions from help
table <- matrix(c(percentage_liberal, percentage_libertarian, percentage_hardhat, percentage_conservative), nrow=2, ncol=2)
dimnames(table) = list(c("Favor", "Oppose"), c("Favor", "Oppose"))
mosaic(table, main = "Where To Find The Libertarians (2010-2012)", gp = gpar(c("blue", "green", "yellow", "red"), 2, 2)) 
labeling_cells(c("Liberal", "Libertarian", "Hardhat", "Conservative"))