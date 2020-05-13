HouseholdPwer <- read.table("household_power_consumption.txt",stringsAsFactors = FALSE, header  = FALSE, sep = ";", skip = 66637, nrows = 2880,
                            col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1","Sub_metering_2","Sub_metering_3"))

str(HouseholdPwer)
summary(HouseholdPwer$Global_active_power)
library(lubridate)
HouseholdPwer$Date <- dmy(HouseholdPwer$Date)
HouseholdPwer$Time <- hms(HouseholdPwer$Time)

##plot 1

plot1 <- hist(HouseholdPwer$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency",
              col = "Red")

dev.copy(device = png, file = "Plot1.png")
dev.off()
dev.list()
