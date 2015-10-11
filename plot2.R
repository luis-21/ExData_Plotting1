powercons <- "./getdata/exdata-data-household_power_consumption/household_power_consumption.txt"
data <- read.table(powercons, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
usedData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#str(usedData)
datetime <- strptime(paste(usedData$Date, usedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global <- as.numeric(usedData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, global, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()