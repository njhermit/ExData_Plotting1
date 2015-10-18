# Read in the dataset
dt <- read.csv("household_power_consumption.txt", header=T, sep=';', 
               na.strings="?")
# Subset the dataset
st <- subset(dt, Date == "1/2/2007"|Date == "2/2/2007")

# Convert the data and time
st$Datetime <- strptime(paste(st$Date, st$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Plot three submetering variables against Datetime
png("plot3.png", width=480, height=480)
plot(st$Datetime, st$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(st$Datetime, as.numeric(st$Sub_metering_2), type="l", col="red")
lines(st$Datetime, st$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2.5, 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
