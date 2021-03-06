#This code is in fulfilment of the R COURSE module group Activity.

# Set the working Directory
setwd("C:/Users/olginam/Documents/R/Exploratory Data Analysis/Group Activity Assignment 1")


# Download file from URL
downloadURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
downloadFile <- "./Data/household_power_consumption.zip"
householdFile <- "./Data/household_power_consumption.txt"

#Unzip the file
if (!file.exists(householdFile)) {
  download.file(downloadURL, downloadFile, mode="wb")
  unzip(downloadFile, overwrite = T, exdir = "./Data")}

# Use Read Table to read the data
householdData <- read.table(householdFile, header=T, sep=";", na.strings="?")


# read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.
SampleData <- householdData[householdData$Date %in% c("1/2/2007","2/2/2007"),]

#convert the Date and Time variables to Date/Time classes in R using the \color{red}{\verb|strptime()|}strptime()  and \color{red}{\verb|as.Date()|}as.Date() functions.
SetTime <-strptime(paste(SampleData$Date, SampleData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
SampleData <- cbind(SetTime, SampleData)

head(SampleData)


#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
dev.cur() 


#Plotting the 3rd Plot
png(file="Plot3.png", width = 480, height = 480)

columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(SampleData$SetTime, SampleData$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(SampleData$SetTime, SampleData$Sub_metering_2, col=columnlines[2])
lines(SampleData$SetTime, SampleData$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")

dev.off()
