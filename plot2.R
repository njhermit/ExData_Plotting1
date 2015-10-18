dt <- read.csv("household_power_consumption.txt", header=T, sep=';', 
               na.strings="?")
# Subset the dataset
st <- subset(dt, Date == "1/2/2007"|Date == "2/2/2007")

# Convert the data and time
st$Datetime <- strptime(paste(st$Date, st$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Plot Global active power by Datetime
plot(st$Datetime, st$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()