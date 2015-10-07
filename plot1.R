## Coursera Exploratory Data Analysis
## Project 1
## Brad Chadwell
## 6 October 2015

## run code in load.R to download, read, and tidy data
## data frame 'tidy' contains data as described,
## plus 'DateTime' POSIXlt variable

setwd("~/Coursera/ExData/ExData_Plotting1")
source("load.R")

## plot 1: histogram saved as a 480x480 pixel PNG
png(filename = "plot1.png",
    width = 480, height = 480, units = "px",
    bg = "transparent")
hist(tidy$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.off()