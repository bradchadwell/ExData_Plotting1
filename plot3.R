## Coursera Exploratory Data Analysis
## Project 1
## Brad Chadwell
## 6 October 2015

## run code in load.R to download, read, and tidy data
## data frame 'tidy' contains data as described,
## plus 'DateTime' POSIXlt variable

setwd("~/Coursera/ExData/ExData_Plotting1")
source("load.R")

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