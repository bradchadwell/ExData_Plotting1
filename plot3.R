## Coursera Exploratory Data Analysis
## Project 1
## Brad Chadwell
## 6 October 2015

## first run code in load.R to download, read, and tidy data
## data frame 'tidy' contains data as described,
## plus 'DateTime' POSIXlt variable
##setwd("~/Coursera/ExData/ExData_Plotting1")
##source("load.R")
## reproducing load.R code here to follow instructions for "including code"

########## Beginning of load.R
setwd("~/Coursera/ExData/ExData_Plotting1")
if (!file.exists("data")) {dir.create("data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfileName <-"./data/proj1.zip"
datafileName <- "household_power_consumption.txt"
download.file(fileUrl, destfile = zipfileName, method = "curl")

## read in 5 rows and get colClasses to speed full upload
dat <- read.table(unz(zipfileName, datafileName),
                  nrows=5, header=T, na.strings = "?", sep=";")
classes <- sapply(dat, class)

#I adjusted read.table skip to find approx. start and end of data of interest
skipRows <-65000
nRows2Read <- (70000 - 65000)

## read portion of data file containing dates of interest
## since skipping header row, header=F and use col.names and classes from dat
dat2 <- read.table(unz(zipfileName, datafileName),
                   nrows=nRows2Read, skip = skipRows, header=F,
                   na.strings = "?", sep=";",
                   col.names = names(classes),
                   colClasses = classes)

## subset data to include only the two dates of interest
dates2eval <- c("1/2/2007","2/2/2007") #date format is character 'd/m/yyyy'
tidy <- dat2[dat2$Date %in% dates2eval,]

## format date and time into single column that I can plot against
## concatenate Date and Time field
## convert to POSIXlt and add to data frame
temp <- paste(tidy$Date,tidy$Time)
tidy$DateTime <- strptime(temp,"%d/%m/%Y %H:%M:%S")

########## End of load.R


## plot 3: plot saved as a 480x480 pixel PNG
png(filename = "plot3.png",
    width = 480, height = 480, units = "px",
    bg = "transparent")
plot(tidy$DateTime, tidy$Sub_metering_1,
     type = "l",
     col = "black",
     xlab = "",
     ylab = "Energy sub metering")
lines(tidy$DateTime, tidy$Sub_metering_2, col="red")
lines(tidy$DateTime, tidy$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black", "red", "blue"), lty=1)
dev.off()