#Read in table
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                   stringsAsFactors=FALSE, na.strings=c("?"))

#Data for two specific days
subdata <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

# change the date format
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")

subdata$DateTime <- as.POSIXct(paste(subdata$Date, subdata$Time))

# create plot
png("plot2.png", width=480, height= 480)

plot(subdata$DateTime, subdata$Global_active_power, type= "l", lwd=1, 
     ylab= "Global Active Power (kilowatts)", xlab="")

dev.off()

