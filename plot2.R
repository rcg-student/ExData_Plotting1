#reading data and using the days we want
electric <- read.table("household_power_consumption.txt", header =TRUE, sep=";")
electric_to_use <- electric[  ((electric$Date == "1/2/2007") | (electric$Date == "2/2/2007"))&(electric$Global_active_power != "?") ,]
#decimal formatting and date format for the plot 
electric_to_use$Global_active_power <- format(electric_to_use$Global_active_power, decimal.mark = ".")
datetime <- strptime(paste(electric_to_use$Date, electric_to_use$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#plotting the results
plot(datetime,as.numeric(electric_to_use$Global_active_power),type="l",xlab="", ylab="Global Active Power (kilowatts)")
## Copy my plot to a PNG file
dev.copy(png, file = "plot2.png")  
dev.off() 