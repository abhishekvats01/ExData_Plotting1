data <-read.table("household_power_consumption.txt",sep=";",
                  header=TRUE,stringsAsFactors=FALSE,na.strings="?")

subsetdata<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")

subsetdata$DateTime <- as.POSIXct(paste(subsetdata$Date, subsetdata$Time), format="%d/%m/%Y %H:%M:%S") 
## Plot 4
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(subsetdata, {
  plot(Global_active_power ~ DateTime, type = "l", 
       ylab = "Global Active Power", xlab = "")
  plot(Voltage ~ DateTime, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(Sub_metering_1 ~ DateTime, type = "l", ylab = "Energy sub metering",
       xlab = "")
  lines(Sub_metering_2 ~ DateTime, col = 'Red')
  lines(Sub_metering_3 ~ DateTime, col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
         bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ DateTime, type = "l", 
       ylab = "Global_rective_power", xlab = "datetime")
})
dev.copy(png,file="plot4.png")
dev.off() 