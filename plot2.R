## Coursera Exploratory Data Analysis
## Project 1
## Brad Chadwell
## 6 October 2015

## run code in load.R to download, read, and tidy data
## data frame 'tidy' contains data as described,
## plus 'DateTime' POSIXlt variable

setwd("~/Coursera/ExData/ExData_Plotting1")
source("load.R")

## plot 2: plot saved as a 480x480 pixel PNG
png(filename = "plot2.png",
    width = 480, height = 480, units = "px",
    bg = "transparent")
plot(tidy$DateTime, tidy$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()