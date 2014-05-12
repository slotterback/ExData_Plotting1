data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")
valid_dates <-c("1/2/2007","2/2/2007")
myData <-data[data$Date %in% valid_dates,]

png(filename = "plot3.png")
plot(myData$Sub_metering_1,type = 'n',xaxt='n', main = "",xlab = "",ylab = "Energy Sub Metering")
lines(myData$Sub_metering_1)
lines(myData$Sub_metering_2,col = "red")
lines(myData$Sub_metering_3,col = "blue")
axis.indices <- 1:length(myData$Sub_metering_1)
axis(1, at=c(1, axis.indices[myData$Date == "2/2/2007" & myData$Time == "00:00:00"],  max(axis.indices)), labels=c("Thu", "Fri", "Sat"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lwd=1)

#dev.copy(png,"plot3.png")
dev.off()