# Read in the dataset
dt <- read.csv("household_power_consumption.txt", header=T, sep=';', 
                      na.strings="?")
# Subset the dataset
st <- subset(dt, Date == "1/2/2007"|Date == "2/2/2007")

# Convert the data and time
st$Datetime <- strptime(paste(st$Date, st$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Plot the histogram
hist(st$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Save as png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()