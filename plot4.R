#Read in table
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                   stringsAsFactors=FALSE, na.strings=c("?"))

#Data for two specific days
subdata <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

# change the date format
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")

subdata$DateTime <- as.POSIXct(paste(subdata$Date, subdata$Time))

# create plot
png("plot4.png", width = 480, height = 480)

# divide the plot device into four subplots
par(mfrow=c(2,2)) 

# 1 - top left
plot(subdata$DateTime, subdata$Global_active_power, type= "l", 
     lwd=1, ylab= "Global Active Power (kilowatts)", xlab="") 

# 2 - top right
plot(subdata$DateTime, subdata$Voltage, type="l", 
     xlab="datetime", ylab="Voltage")   

# 3 - bottom left
plot(subdata$DateTime, subdata$Sub_metering_1, type="l", 
     ylab= "Energy sub metering", xlab="")

lines(subdata$DateTime, subdata$Sub_metering_2, type="l", col="red")
lines(subdata$DateTime, subdata$Sub_metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, bty="n", col=c("black", "red", "blue")) 

# 4 - bottom right
plot(subdata$DateTime, subdata$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_power")  


dev.off()