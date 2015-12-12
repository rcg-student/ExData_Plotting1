#reading data and using the days we want
electric <- read.table("household_power_consumption.txt", header =TRUE, sep=";")
electric_to_use <- electric[  ((electric$Date == "1/2/2007") | (electric$Date == "2/2/2007"))&(electric$Global_active_power != "?") ,]
#decimal formatting and date format for the plot 
electric_to_use$Sub_metering_1 <- format(electric_to_use$Sub_metering_1, decimal.mark = ".")
electric_to_use$Sub_metering_2 <- format(electric_to_use$Sub_metering_2, decimal.mark = ".")
electric_to_use$Sub_metering_3 <- format(electric_to_use$Sub_metering_3, decimal.mark = ".")
datetime <- strptime(paste(electric_to_use$Date, electric_to_use$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#plotting the results
plot(datetime,as.numeric(electric_to_use$Sub_metering_1), col="black",type="l",xlab="", ylab="Energy sub metering")
with(electric_to_use,lines(datetime,as.numeric(electric_to_use$Sub_metering_2), col="red"))
with(electric_to_use,lines(datetime,as.numeric(electric_to_use$Sub_metering_3), col="blue"))
legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty =1, lwd=2)
## Copy my plot to a PNG file
dev.copy(png, file = "plot3.png") 
dev.off() 