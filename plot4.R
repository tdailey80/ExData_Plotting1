#set working directory
setwd("C:/Users/DAI02/Desktop/Coursera/Exploratory Data Analysis/Project 1/ExData_Plotting1")

#read data file into a table
tblPlot <- read.table("household_power_consumption.txt", header = TRUE,sep=";", na.strings="?", stringsAsFactors = FALSE) 

#convert the date to date format and time to time format
tblPlot$Date <- as.Date(tblPlot$Date, format="%d/%m/%Y")

#subset data table to only have needed dates
tblPlot4 <- subset(tblPlot, (tblPlot$Date == "2007-02-01" | tblPlot$Date == "2007-02-02"))

#create field combining date and time
tblPlot4$DateTime <- as.POSIXct(strptime(paste(tblPlot4$Date, tblPlot4$Time), "%Y-%m-%d %H:%M:%S"))

#set plot area to accommodate 4 plots
windows(width=16, height=16)
par(mfrow = c(2,2))
par(bg = "white")

#create plot #1 and format legend
plot(x=tblPlot4$DateTime, y = tblPlot4$Global_active_power, type = 'n', xlab = "", ylab = "Global Active Power") 
lines(tblPlot4$DateTime, tblPlot4$Global_active_power, col = "black")

#create plot #2 and format legend
plot(x=tblPlot4$DateTime, y = tblPlot4$Voltage, type = 'n', xlab = "datetime", ylab = "Voltage") 
lines(tblPlot4$DateTime, tblPlot4$Voltage, col = "black")

#create plot #3 and format legend
plot(x=tblPlot4$DateTime, y = tblPlot4$Sub_metering_1,type='n', xlab = "", ylab = "Energy sub metering") 
lines(tblPlot4$DateTime, tblPlot4$Sub_metering_1, col = "black")
lines(tblPlot4$DateTime, tblPlot4$Sub_metering_2, col = "red")
lines(tblPlot4$DateTime, tblPlot4$Sub_metering_3, col = "blue")
legend("topright", cex=0.5, c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black","red", "blue"), bty="n", lwd=c(2.5,2.5,2.5,2.5))


#create plot #4 and format legend
plot(x=tblPlot4$DateTime, y = tblPlot4$Global_reactive_power, type = 'n', xlab = "datetime", ylab = "Global_reactive_power") 
lines(tblPlot4$DateTime, tblPlot4$Global_reactive_power, col = "black")

#copy line plot to .png file and close file device
dev.copy(png, file = "plot4.png")
dev.off()