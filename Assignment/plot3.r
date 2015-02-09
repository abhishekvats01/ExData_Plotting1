data <-read.table("household_power_consumption.txt",sep=";",
                  header=TRUE,stringsAsFactors=FALSE,na.strings="?")

subsetdata<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")

subsetdata$DateTime <- as.POSIXct(paste(subsetdata$Date, subsetdata$Time), format="%d/%m/%Y %H:%M:%S") 

##Plot 3 
plot(subsetdata$DateTime, subsetdata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(subsetdata$DateTime, subsetdata$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", 
       col = "red")
points(subsetdata$DateTime, subsetdata$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", 
       col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "red", "blue"))
dev.copy(png,file="plot3.png")
dev.off() 