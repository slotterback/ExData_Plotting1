data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")
valid_dates <-c("1/2/2007","2/2/2007")
myData <-data[data$Date %in% valid_dates,]

png(filename = "plot2.png")

plot(myData$Global_active_power,type = 'n',xaxt='n', main = "",xlab = "",ylab = "Global Active Power (kilowatts)")
lines(myData$Global_active_power)
axis.indices <- 1:length(myData$Global_active_power)
axis(1, at=c(1, axis.indices[myData$Date == "2/2/2007" & myData$Time == "00:00:00"],  max(axis.indices)), labels=c("Thu", "Fri", "Sat"))

dev.off()