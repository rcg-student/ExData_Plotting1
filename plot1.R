#reading data and using the days we want
electric <- read.table("household_power_consumption.txt", header =TRUE, sep=";")
electric_to_use <- electric[  ((electric$Date == "1/2/2007") | (electric$Date == "2/2/2007"))&(electric$Global_active_power != "?") ,]
#decimal formatting for the plot
electric_to_use$Global_active_power <- format(electric_to_use$Global_active_power, decimal.mark = ".")
#plotting the results
hist(as.numeric(electric_to_use$Global_active_power),col="red",breaks=20,main="Global active power",
     xlab = "Global active power (kilowatts)",ylab="Frequency",xlim=c(0,6),ylim=c(0,1200))
## Copy my plot to a PNG file
dev.copy(png, file = "plot1.png")  
dev.off()  