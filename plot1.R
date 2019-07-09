#unzip the source file
unzip(zipfile = "exdata_data_household_power_consumption.zip")
# Reading the file to the data.frame
data<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
# Subseting rows with dates 2007-02-01 and 2007-02-02
library(dplyr)
plotdt <- filter(data, Date=="1/2/2007" | Date == "2/2/2007")
#Saving a histogram to a PNG file
png("plot1.png", width = 480, height = 480)
with(plotdt, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()