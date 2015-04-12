#set working directory
setwd("C:/Users/DAI02/Desktop/Coursera/Exploratory Data Analysis/Project 1/ExData_Plotting1")

#read data file into a table
tblPlot <- read.table("household_power_consumption.txt", header = TRUE,sep=";", na.strings="?", stringsAsFactors = FALSE) 

#convert the date to date format and time to time format
tblPlot$Date <- as.Date(tblPlot$Date, format="%d/%m/%Y")

#subset data table to only have needed dates
tblPlot3 <- subset(tblPlot, (tblPlot$Date == "2007-02-01" | tblPlot$Date == "2007-02-02"))

#create field combining date and time
tblPlot3$DateTime <- as.POSIXct(strptime(paste(tblPlot3$Date, tblPlot3$Time), "%Y-%m-%d %H:%M:%S"))

#create and export plot
plot(x=tblPlot3$DateTime, y = tblPlot3$Sub_metering_1,type='n', xlab = "", ylab = "Energy sub metering") 
lines(tblPlot3$DateTime, tblPlot3$Sub_metering_1, col = "black")
lines(tblPlot3$DateTime, tblPlot3$Sub_metering_2, col = "red")
lines(tblPlot3$DateTime, tblPlot3$Sub_metering_3, col = "blue")
legend("topright", cex=0.5, c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black","red", "blue"), lwd=c(2.5,2.5,2.5,2.5))

#copy line plot to .png file and close file device
dev.copy(png, file = "plot3.png")
dev.off()