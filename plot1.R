#set working directory
setwd("C:/Users/DAI02/Desktop/Coursera/Exploratory Data Analysis/Project 1/ExData_Plotting1")

#read data file into a table
tblPlot <- read.table("household_power_consumption.txt", header = TRUE,sep=";", na.strings="?", stringsAsFactors = FALSE) 

#convert the date to date format and time to time format
tblPlot$Date <- as.Date(tblPlot$Date, format="%d/%m/%Y")

#subset data table to only have needed dates
tblPlot1 <- subset(tblPlot, (tblPlot$Date == "2007-02-01" | tblPlot$Date == "2007-02-02"))

#create field combining date and time
tblPlot1$DateTime <- as.POSIXct(strptime(paste(tblPlot1$Date, tblPlot1$Time), "%Y-%m-%d %H:%M:%S"))

#create and export histigram
hist(tblPlot1$Global_active_power, col = "red", breaks = 11, main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#copy histogram  to .png file and close file device
dev.copy(png, file = "plot1.png")
dev.off()