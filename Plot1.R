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
#Plotting the 2nd Plot

png(file="Plot1.png", width = 480, height = 480)
hist(SampleData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")


dev.off()
