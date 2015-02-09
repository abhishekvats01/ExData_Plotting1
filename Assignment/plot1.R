data <-read.table("household_power_consumption.txt",sep=";",
                  header=TRUE,stringsAsFactors=FALSE,na.strings="?")

subsetdata<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")

subsetdata$DateTime <- as.POSIXct(paste(subsetdata$Date, subsetdata$Time), format="%d/%m/%Y %H:%M:%S") 

##Plot 1
hist(subsetdata$Global_active_power, main = "Global Active Power", ylab = "Frequency", 
     xlab = "Global Active Power (kilowatts)", col = "red")

dev.copy(png,file="plot1.png")
dev.off() 