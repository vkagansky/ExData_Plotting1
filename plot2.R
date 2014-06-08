## reading data; assumed the file is already in the working directory

power <- read.csv("household_power_consumption.txt",sep=";", header=TRUE, as.is=TRUE)




## creating subset, adding a date-time variable and correcting data times

power$Date <- as.Date(power$Date, format="%d/%m/%Y" )

power2007 <- subset(power, Date=="2007-02-01" | Date=="2007-02-02" )
power2007$DateTime <- as.POSIXct(strptime(paste(as.character(power2007$Date ),as.character(power2007$Time) ), "%Y-%m-%d %H:%M:%S"))

power2007$Global_active_power <- as.numeric(power2007$Global_active_power)
power2007$Sub_metering_1 <- as.numeric(power2007$Sub_metering_1)
power2007$Sub_metering_2 <- as.numeric(power2007$Sub_metering_2)
power2007$Sub_metering_3 <- as.numeric(power2007$Sub_metering_3)
power2007$Voltage <- as.numeric(power2007$Voltage)




#### Plot 2
par(mfrow = c(1, 1))
plot( power2007$DateTime, power2007$Global_active_power, type ='l', xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()



