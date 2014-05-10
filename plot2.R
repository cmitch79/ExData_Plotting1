## Coursera EXploratory Data Analysis
## Week 1 Assignment
## May 10, 2014
## Import household power consumption data and create 4 plots
## Plot 2

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

## Render plot2 and export png file

png(filename="plot2.png", width = 480, height = 480)

with(sub.hhpcdata, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()