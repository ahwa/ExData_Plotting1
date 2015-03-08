data <- read.table(unz("exdata-data-household_power_consumption.zip","household_power_consumption.txt"), header=T, sep=";", na.string="?")
subset <- data[data$Date == '1/2/2007'|data$Date == "2/2/2007",]

datetime <- strptime(paste(as.Date(subset$Date,"%d/%m/%Y"),subset$Time), "%Y-%m-%d %H:%M:%S")
subset <- cbind(subset, datetime)

png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(subset, {
plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
plot(datetime, Voltage, type = "l", ylab = "Voltage")
plot(datetime, Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", lwd=1, bty="n", col = c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(datetime, Global_reactive_power, type = "l", ylab = "Global_reactive_power")
})
dev.off()