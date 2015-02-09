data <-read.table("household_power_consumption.txt",sep=";",
                  header=TRUE,stringsAsFactors=FALSE,na.strings="?")

subsetdata<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")

subsetdata$DateTime <- as.POSIXct(paste(subsetdata$Date, subsetdata$Time), format="%d/%m/%Y %H:%M:%S") 

plot(subsetdata$DateTime, subsetdata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png")
dev.off() 