#unzip the source file
unzip(zipfile = "exdata_data_household_power_consumption.zip")
# Reading the file to the data.table
library(data.table)
data<-fread("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
# Subseting rows with dates 2007-02-01 and 2007-02-02
dt <- filter(data, Date=="1/2/2007" | Date == "2/2/2007")
dt$DateTime <- strptime(paste(dt$Date, dt$Time), "%d/%m/%Y %H:%M:%S")
#Saving a plot to a PNG file
png("plot2.png", width = 480, height = 480)
plot(dt$DateTime, dt$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()