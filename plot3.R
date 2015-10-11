powercons <- "./getdata/exdata-data-household_power_consumption/household_power_consumption.txt"
data <- read.table(powercons, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
usedData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#str(usedData)
datetime <- strptime(paste(usedData$Date, usedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global <- as.numeric(usedData$Global_active_power)

sub_metering_1 <- as.numeric(usedData$Sub_metering_1)
sub_metering_2 <- as.numeric(usedData$Sub_metering_2)
sub_metering_3 <- as.numeric(usedData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_metering_2, type="l", col="red")
lines(datetime, sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()