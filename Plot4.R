##reading data in R

HouseholdPwer <- read.table("household_power_consumption.txt",stringsAsFactors = FALSE, header  = FALSE, sep = ";", skip = 66637, nrows = 2880,
                            col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1","Sub_metering_2","Sub_metering_3"))

str(HouseholdPwer)
summary(HouseholdPwer$Global_active_power)

#Plot 4

HouseholdPwer$DateTime <- strptime(paste(HouseholdPwer$Date,HouseholdPwer$Time), format="%d/%m/%Y %H:%M:%S")

HouseholdPwer$Weekday <- table(wday(HouseholdPwer$DateTime, label = TRUE))

plot4 <- par(mfrow = c(2,2), mar = c(4,4,0.5,4), )
{
  plot(HouseholdPwer$DateTime, HouseholdPwer$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(HouseholdPwer$DateTime,HouseholdPwer$Voltage,type = "l", xlab = "DateTime", ylab = "Voltage")
  plot(HouseholdPwer$DateTime, HouseholdPwer$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  with(HouseholdPwer, lines(DateTime, Sub_metering_2, col = "red"))
  with(HouseholdPwer, lines(DateTime, Sub_metering_3, col = "blue"))
  legend("topright", lty = 1 ,col = c("Black", "Red", "Blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(HouseholdPwer$DateTime, HouseholdPwer$Global_reactive_power, type = "l", xlab = "DateTime", ylab = "Global_reactive_power")
}

dev.copy(device = png, file = "Plot4.png")
dev.off()
dev.list()

