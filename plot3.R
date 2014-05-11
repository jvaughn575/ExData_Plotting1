#plot3

# read data in from current working directory
data <- read.table(file = "household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")

head(data)

gpa.2day.subset <- na.omit(data[which(data$Date == '1/2/2007' | data$Date == '2/2/2007'),
                                c("Date","Time","Sub_metering_1","Sub_metering_2","Sub_metering_3")])

png(filename = "plot3.png", width = 480, height = 480, units = "px")

plot(strptime(paste(gpa.2day.subset$Date,gpa.2day.subset$Time),"%d/%m/%Y %H:%M:%S"),
     gpa.2day.subset$Sub_metering_1,type="l",
     xlab = "",ylab = "Energy sub metering")

lines(strptime(paste(gpa.2day.subset$Date,gpa.2day.subset$Time),"%d/%m/%Y %H:%M:%S"),
      gpa.2day.subset$Sub_metering_2,type="l",
      xlab = "",col = "red")

lines(strptime(paste(gpa.2day.subset$Date,gpa.2day.subset$Time),"%d/%m/%Y %H:%M:%S"),
      gpa.2day.subset$Sub_metering_3,type="l",
      xlab = "",col = "blue")

legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=(c("black","red","blue")))

dev.off()