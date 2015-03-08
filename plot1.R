data <- read.table(unz("exdata-data-household_power_consumption.zip","household_power_consumption.txt"), header=T, sep=";", na.string="?")

subset <- data[data$Date == '1/2/2007'|data$Date == "2/2/2007",]

png(filename="plot1.png", width = 480, height = 480)
hist(as.numeric(subset$Global_active_power),col='red', main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()