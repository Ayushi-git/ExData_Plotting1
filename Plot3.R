##reading data in R

HouseholdPwer <- read.table("household_power_consumption.txt",stringsAsFactors = FALSE, header  = FALSE, sep = ";", skip = 66637, nrows = 2880,
                            col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1","Sub_metering_2","Sub_metering_3"))

str(HouseholdPwer)
summary(HouseholdPwer$Global_active_power)

##plot 3

HouseholdPwer$DateTime <- strptime(paste(HouseholdPwer$Date,HouseholdPwer$Time), format="%d/%m/%Y %H:%M:%S")

HouseholdPwer$Weekday <- table(wday(HouseholdPwer$DateTime, label = TRUE))

plot3 <- plot(HouseholdPwer$DateTime, HouseholdPwer$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
with(HouseholdPwer, lines(DateTime, Sub_metering_2, col = "red"))
with(HouseholdPwer, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1 ,col = c("Black", "Red", "Blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(device = png, file = "Plot3.png")
dev.off()
dev.list()