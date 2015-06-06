#Worst Location seems to be swig, though with the method I used I had a hard time making sure every place is represented
BikeTheftLog$NewLoc <- "Blank"
BikeTheftLog$NewLoc[str_detect(BikeTheftLog$LOCATION, "Swig")] <- "Swig"
BikeTheftLog$NewLoc[str_detect(BikeTheftLog$LOCATION, "Dunne")] <- "Dunne"
BikeTheftLog$NewLoc[str_detect(BikeTheftLog$LOCATION, "Nobili")] <- "Nobili"
BikeTheftLog$NewLoc[str_detect(BikeTheftLog$LOCATION, "McLaughlin")] <- "McLaughlin"
BikeTheftLog$NewLoc[str_detect(BikeTheftLog$LOCATION, "Casa")] <- "Casa"
BikeTheftLog$NewLoc[str_detect(BikeTheftLog$LOCATION, "Graham")] <- "Graham"
BikeTheftLog$NewLoc[str_detect(BikeTheftLog$LOCATION, "Benson")] <- "Benson"
BikeTheftLog$NewLoc[str_detect(BikeTheftLog$LOCATION, "Campisi")] <- "Campisi"
BikeTheftLog$NewLoc[str_detect(BikeTheftLog$LOCATION, "Sobrato")] <- "Sobrato"
BikeTheftLog$NewLoc[str_detect(BikeTheftLog$LOCATION, "Kenna")] <- "Kenna"
BikeTheftLog$NewLoc[str_detect(BikeTheftLog$LOCATION, "Bannan")] <- "Bannan"
BikeTheftLog$NewLoc[str_detect(BikeTheftLog$LOCATION, "Engineering")] <- "Engineering"
BikeTheftLog$NewLoc[str_detect(BikeTheftLog$LOCATION, "Malley")] <- "Malley"
BikeTheftLog$NewLoc[str_detect(BikeTheftLog$LOCATION, "Music")] <- "Music"
BikeTheftLog$NewLoc[str_detect(BikeTheftLog$LOCATION, "O'Connor")] <- "O'Connor"
BikeTheftLog$NewLoc[str_detect(BikeTheftLog$LOCATION, "Walsh")] <- "Walsh"
BikeTheftLog$NewLoc[str_detect(BikeTheftLog$LOCATION, "Villas")] <- "Villas"
BikeTheftLog$NewLoc[str_detect(BikeTheftLog$LOCATION, "Sanfilippo")] <- "Sanfilippo"

#Worst Day of week turns out to be Monday
BikeTheftLog$DATE <- as.Date(BikeTheftLog$DATE, "%m/%d/%y")
BikeTheftLog$DayOfWeek <- weekdays(as.Date(BikeTheftLog$DATE))
WorstDayOfWeek <- table(BikeTheftLog$DayOfWeek)
sort(WorstDayOfWeek, decreasing = TRUE)

#Worst month of the year turns out to be Februrary
BikeTheftLog$MonthOfYear <- months(as.Date(BikeTheftLog$DATE))
WorstMonthOfYear <- table(BikeTheftLog$MonthOfYear)
sort(WorstMonthOfYear, decreasing = TRUE)

#all the stuff above is from the previous mike assignment


t <- table(newLoc,as.Date(BikeTheftLog$Date))
writetsv(table(newLoc,as.Date(BikeTheftLog$Date)))
write.table(t, file='excel.tsv', quote=FALSE, sep='\t')
#For the first part of this asignment I took the table from the tab then opened it numbers and edited it manually with the correct date format before resaving it

#part 2
#Im honestly really confused how to do this part and Havent been able to complete it