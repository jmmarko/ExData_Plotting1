#load data
allData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?")
allData$Time <- strptime(paste(allData$Date, allData$Time), "%d/%m/%Y %H:%M:%S")
allData$Date <- as.Date(allData$Date, "%d/%m/%Y")
dateRange <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data <- subset(allData, Date %in% dateRange)

#construct the plot and save it to png (480x480)
png("plot2.png", width = 480, height = 480)
plot(data$Time, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
