data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")
valid_dates <-c("1/2/2007","2/2/2007")
myData <-data[data$Date %in% valid_dates,]

png(filename = "plot1.png")
hist(myData$Global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()