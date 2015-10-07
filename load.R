## Coursera Exploratory Data Analysis
## Project 1
## Brad Chadwell
## 6 October 2015

## This code is for downloading the data file,
## loading the data, and
## subsetting the data of interest
##
## This code is run before the plotting is conducted

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
##100,000 is 24/2/2007
##70,000 is 3/2/2007 end here
##60,000 is 27/1/2007
##65,000 is 30/1/2007 start here
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
## convert to Date/Time and add to data frame
temp <- paste(tidy$Date,tidy$Time)
tidy$DateTime <- strptime(temp,"%d/%m/%Y %H:%M:%S")

# str(tidy)
# 'data.frame':	2880 obs. of  10 variables:
#         $ Date                 : Factor w/ 5 levels "1/2/2007","2/2/2007",..: 1 1 1 1 1 1 1 1 1 1 ...
# $ Time                 : Factor w/ 1440 levels "00:00:00","00:01:00",..: 1 2 3 4 5 6 7 8 9 10 ...
# $ Global_active_power  : num  0.326 0.326 0.324 0.324 0.322 0.32 0.32 0.32 0.32 0.236 ...
# $ Global_reactive_power: num  0.128 0.13 0.132 0.134 0.13 0.126 0.126 0.126 0.128 0 ...
# $ Voltage              : num  243 243 244 244 243 ...
# $ Global_intensity     : num  1.4 1.4 1.4 1.4 1.4 1.4 1.4 1.4 1.4 1 ...
# $ Sub_metering_1       : num  0 0 0 0 0 0 0 0 0 0 ...
# $ Sub_metering_2       : num  0 0 0 0 0 0 0 0 0 0 ...
# $ Sub_metering_3       : num  0 0 0 0 0 0 0 0 0 0 ...
# $ DateTime             : POSIXlt, format: "2007-02-01 00:00:00" "2007-02-01 00:01:00" "2007-02-01 00:02:00" ...

