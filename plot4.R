#load data
allData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?")
allData$Time <- strptime(paste(allData$Date, allData$Time), "%d/%m/%Y %H:%M:%S")
allData$Date <- as.Date(allData$Date, "%d/%m/%Y")
dateRange <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data <- subset(allData, Date %in% dateRange)

#construct the plot and save it to png (480x480)
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))	
#plot1
plot(data$Time, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
#plot2
plot(data$Time, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
#plot3
plot(data$Time, data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_3, type="l", col="blue")
lines(data$Time, data$Sub_metering_2, type="l", col="red")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"))
#plot4
plot(data$Time, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()