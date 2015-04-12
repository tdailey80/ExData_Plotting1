#set working directory
setwd("C:/Users/DAI02/Desktop/Coursera/Exploratory Data Analysis/Project 1/ExData_Plotting1")

#read data file into a table
tblPlot <- read.table("household_power_consumption.txt", header = TRUE,sep=";", na.strings="?", stringsAsFactors = FALSE) 

#convert the date to date format and time to time format
tblPlot$Date <- as.Date(tblPlot$Date, format="%d/%m/%Y")

#subset data table to only have needed dates
tblPlot2 <- subset(tblPlot, (tblPlot$Date == "2007-02-01" | tblPlot$Date == "2007-02-02"))

#create field combining date and time
tblPlot2$DateTime <- as.POSIXct(strptime(paste(tblPlot2$Date, tblPlot2$Time), "%Y-%m-%d %H:%M:%S"))

#create and export plot
plot(x=tblPlot2$DateTime, y = tblPlot2$Global_active_power, type = 'n', xlab = "", ylab = "Global Active Power (kilowatts)") 
lines(tblPlot2$DateTime, tblPlot2$Global_active_power, col = "black")

#copy line plot to .png file and close file device
dev.copy(png, file = "plot2.png")
dev.off()