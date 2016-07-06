#====reading file============= (coded in windows)
setInternet2(TRUE)
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, "household_power_consumption.zip")
data <- read.table(unz("household_power_consumption.zip","household_power_consumption.txt"),sep = ";", header = FALSE, skip =1)
names(data) = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data1 <-subset(data,data$Date =="1/2/2007" |data$Date == "2/2/2007")
data1$Global_active_power <- as.numeric(as.character(data1$Global_active_power))
x <- paste(data1$Date, data1$Time)
#========creating plot 2===================
plot(strptime(x,"%d/%m/%Y %H:%M:%S"),data1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file ="plot2.png", width=480, height=480)
dev.off()