# A lot of my stuff didnt work
# I had a lot of trouble aquiring and using the images

setwd(‘~/Documents/School/Data Science/kaggle’)

source(“http://bioconductor.org/biocLite.R”) # gets ebimage to work
biocLite(“EBImage”, ask = FALSE) # same as above

library(‘EBImage’)
library(‘jpeg’)
library(‘ripa’) # had to download some other thing in order for this library to work

help(list.files)

galaxy_photos <- list.files(‘~/Documents/School/Data Science/kaggle/images_training_rev1’)

#this didn’t work as intended
# for(file in galaxy_photos)
# {
#  galaxy_photos1 <- readJPEG(paste( , file, sep = ‘’
#  shrink <- rgb2grey(resize(img, 50, 50))
#	new_data <- data.frame()
#	new_data$mean <- mean(shrink)
#
#} 

help(data.frame)

galaxy_dataframe <- data.frame(GalaxyID = integer(length(galaxy_photos)),
                               var1 = double(length(galaxy_photos)),
                               mean = double(length(galaxy_photos)),
                               q1 = double(length(galaxy_photos)),
                               q2 = double(length(galaxy_photos)),
                               q3 = double(length(galaxy_photos)),
                               q4 = double(length(galaxy_photos)))

for( i in 1:61579)
{
  image <- readJpeg(galaxy_photos)
  galaxy_photos <- rgb2grey(resize(images, 50, 50)) # resize images to 50x50
  GalaxyID <- gsub(“.jpg, “ “, galaxy_photos[i]) # getting name of images
  #row <- galaxyProb[galaxyProb$GalaxyID == GalaxyID, ]
}

for(i in 1:61579)
{
  data$GalaxyID[i] <- GalaxyID
  data$Variance <- var(as.vector(galaxy_photos)) # getting variance
  data$mean[i] <- mean(galaxy_photos) # figuring out the mean
}
help(quantile)

for(in in 1:61579)
{
  data$q1[i] <- quantile(galaxy_photos,.1) #splitting into the quantiles asked for in class
  data$q2[i] <- quantile(galaxy_photos,.25)
  data$q3[i] <- quantile(galaxy_photos,.75)
  data$q4[i] <- quantile(galaxy_photos,.9)
  
}
submit <- data.frame("GalaxyID" = GalaxyID, Prob_Smooth = mean)
write.csv(submit, file = "submission", row.names = FALSE)