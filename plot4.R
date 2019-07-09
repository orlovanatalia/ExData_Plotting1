#unzip the source file
unzip(zipfile = "exdata_data_household_power_consumption.zip")
# Reading the file to the data.table
library(data.table)
data<-fread("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
# Subseting rows with dates 2007-02-01 and 2007-02-02
dt <- filter(data, Date=="1/2/2007" | Date == "2/2/2007")
dt$DateTime <- strptime(paste(dt$Date, dt$Time), "%d/%m/%Y %H:%M:%S")
#Saving a plot to a PNG file
png("plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))
plot(dt$DateTime, dt$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(dt$DateTime, dt$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(dt$DateTime, dt$Sub_metering_2, type="l", col="red")
points(dt$DateTime, dt$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty = 1)
plot(dt$DateTime, dt$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(dt$DateTime, dt$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()