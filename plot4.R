## Coursera Exploratory Data Analysis
## Project 1
## Brad Chadwell
## 6 October 2015

## run code in load.R to download, read, and tidy data
## data frame 'tidy' contains data as described,
## plus 'DateTime' POSIXlt variable

setwd("~/Coursera/ExData/ExData_Plotting1")
source("load.R")

## plot 4: plot a 2x2 array of scatterplots
## saved as a 480x480 pixel PNG
png(filename = "plot4.png",
    width = 480, height = 480, units = "px",
    bg = "transparent")
par(mfrow = c(2,2)) #by rows, so top-left, top-right, bottom-left, bottom-right

## Top-left (same as plot2 without units in ylab)
plot(tidy$DateTime, tidy$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

## Top-right
plot(tidy$DateTime, tidy$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

## Bottom-left (same as plot3, with no legend border)
plot(tidy$DateTime, tidy$Sub_metering_1,
     type = "l",
     col = "black",
     xlab = "",
     ylab = "Energy sub metering")
lines(tidy$DateTime, tidy$Sub_metering_2, col="red")
lines(tidy$DateTime, tidy$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black", "red", "blue"), lty=1,
       bty = "n")

## Bottom-right
plot(tidy$DateTime, tidy$Global_reactive_power,
     type = "l",
     col = "black",
     xlab = "datetime",
     ylab = "Global_reactive_power")
dev.off()