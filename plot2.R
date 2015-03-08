data <- read.table(unz("exdata-data-household_power_consumption.zip","household_power_consumption.txt"), header=T, sep=";", na.string="?")
subset <- data[data$Date == '1/2/2007'|data$Date == "2/2/2007",]

datetime <- strptime(paste(as.Date(subset$Date,"%d/%m/%Y"),subset$Time), "%Y-%m-%d %H:%M:%S")

png(filename="plot2.png", width=480, height=480)
plot(datetime, subset$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()