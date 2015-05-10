## Plot4.R

# Data is the "Individual household electric power consumption Data Set" from the UC Irvine Machine Learning Repository
# Variables are:
# Date: Date in format dd/mm/yyyy
# Time: time in format hh:mm:ss
# Global_active_power: household global minute-averaged active power (in kilowatt)
# Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
# Voltage: minute-averaged voltage (in volt)
# Global_intensity: household global minute-averaged current intensity (in ampere)
# Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
# Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
# Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

# Read data from February 1, 2007 (1/2/2007) to February 2, 2007 (2/2/2007)
data <- read.table("household_power_consumption.txt",sep=";",na.string="?",skip=66637,nrow=2880,
                   col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity",
                               "Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                   colClasses=c("character","character",rep("numeric",7)))

#Make plot 4 and save to 480x480pixel .png file
datetime <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
png(filename="plot4.png")
par(mfrow = c(2, 2))
with(data, { #Multiple base plots
  plot(datetime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
  plot(datetime,data$Voltage,type="l",xlab="",ylab="datetime")
  plot(datetime,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  lines(datetime,data$Sub_metering_2,type="l",col="red")
  lines(datetime,data$Sub_metering_3,type="l",col="blue")
  legend("topright", lty=1,cex=0.3,col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  plot(datetime,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
})
dev.off()
