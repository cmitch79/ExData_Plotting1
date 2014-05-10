## Coursera EXploratory Data Analysis
## Week 1 Assignment
## May 10, 2014
## Import household power consumption data and create 4 plots
## Plot 3

## Import household power consumption data

fileUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./data/household_power_consumption.zip")

## Unzip the file and read into R

unzip("data/household_power_consumption.zip", exdir = "data")
hhpcdata <- read.table("data/household_power_consumption.txt", sep = ";", header = TRUE, colClasses = c("character", "character", rep("numeric", 7)), na.strings = "?")

## Combine data and time and format

hhpcdata$datetime <- strptime(paste(hhpcdata$Date, hhpcdata$Time), "%d/%m/%Y %H:%M:%S")

## Subset Date Range

sub.hhpcdata <- subset(hhpcdata, as.Date(datetime) >= as.Date("2007-02-01") & as.Date(datetime) <= as.Date("2007-02-02"))

## Render plot3 and export png file

png(filename="plot3.png", width = 480, height = 480)

with(sub.hhpcdata, plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", ylim=range(c(Sub_metering_1,Sub_metering_2,Sub_metering_3))))
with(sub.hhpcdata, lines(datetime, Sub_metering_2, col="red", ylim=range(c(Sub_metering_1,Sub_metering_2,Sub_metering_3))))
with(sub.hhpcdata, lines(datetime, Sub_metering_3, col="blue", ylim=range(c(Sub_metering_1,Sub_metering_2,Sub_metering_3))))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1,  col=c("black","red","blue"))
dev.off()