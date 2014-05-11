#plot2

# read data in from current working directory
data <- read.table(file = "household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")

head(data)

gpa.2day.subset <- na.omit(data[which(data$Date == '1/2/2007' | data$Date == '2/2/2007'),c("Date","Time","Global_active_power")])

png(filename = "plot2.png", width = 480, height = 480, units = "px")

plot(strptime(paste(gpa.2day.subset$Date,gpa.2day.subset$Time),"%d/%m/%Y %H:%M:%S"),
     gpa.2day.subset$Global_active_power,type="l",
     xlab = "",ylab = "Global Active Power (kilowatts)")

dev.off()