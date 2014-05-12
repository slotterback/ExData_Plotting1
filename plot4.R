data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")
valid_dates <-c("1/2/2007","2/2/2007")
myData <-data[data$Date %in% valid_dates,]

png(filename="plot4.png")

par(mfcol= c(2,2))

#plot #1, Global Active Power vs time
plot(myData$Global_active_power,type = 'n',xaxt='n', main = "",xlab = "",ylab = "Global Active Power")
lines(myData$Global_active_power)
axis.indices <- 1:length(myData$Global_active_power)
axis(1, at=c(1, axis.indices[myData$Date == "2/2/2007" & myData$Time == "00:00:00"],  max(axis.indices)), labels=c("Thu", "Fri", "Sat"))

#plot #2, Sub Metering vs time
plot(myData$Sub_metering_1,type = 'n',xaxt='n', main = "",xlab = "",ylab = "Energy Sub Metering")
lines(myData$Sub_metering_1)
lines(myData$Sub_metering_2,col = "red")
lines(myData$Sub_metering_3,col = "blue")
axis.indices <- 1:length(myData$Sub_metering_1)
axis(1, at=c(1, axis.indices[myData$Date == "2/2/2007" & myData$Time == "00:00:00"],  max(axis.indices)), labels=c("Thu", "Fri", "Sat"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lwd=1, bty = "n")

#plot #3, Voltage vs time
plot(myData$Voltage,type = 'n',xaxt='n', main = "",xlab = "datetime",ylab = "Voltage")
lines(myData$Voltage)
axis.indices <- 1:length(myData$Voltage)
axis(1, at=c(1, axis.indices[myData$Date == "2/2/2007" & myData$Time == "00:00:00"],  max(axis.indices)), labels=c("Thu", "Fri", "Sat"))

#plot #4, Global Reactive Power
plot(myData$Global_reactive_power,type = 'n',xaxt='n', main = "",xlab = "datetime",ylab = "Global_reactive_power")
lines(myData$Global_reactive_power)
axis.indices <- 1:length(myData$Global_reactive_power)
axis(1, at=c(1, axis.indices[myData$Date == "2/2/2007" & myData$Time == "00:00:00"],  max(axis.indices)), labels=c("Thu", "Fri", "Sat"))

dev.off()