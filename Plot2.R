HouseholdPwer <- read.table("household_power_consumption.txt",stringsAsFactors = FALSE, header  = FALSE, sep = ";", skip = 66637, nrows = 2880,
                            col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1","Sub_metering_2","Sub_metering_3"))

str(HouseholdPwer)
summary(HouseholdPwer$Global_active_power)

##plot 2

HouseholdPwer$DateTime <- strptime(paste(HouseholdPwer$Date,HouseholdPwer$Time), format="%d/%m/%Y %H:%M:%S")

HouseholdPwer$Weekday <- table(wday(HouseholdPwer$DateTime, label = TRUE))

plot2 <- plot(HouseholdPwer$DateTime, HouseholdPwer$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(device = png, file = "Plot2.png")
dev.off()
dev.list()