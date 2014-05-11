#plot4

# read data in from current working directory
data <- read.table(file = "household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")

png(filename = "plot4.png", width = 480, height = 480, units = "px")

par(mfrow = c(2,2))

## Figure 1
gpa.2day.subset.figure1 <- na.omit(data[which(data$Date == '1/2/2007' | data$Date == '2/2/2007'),
                                        c("Date","Time","Global_active_power")])


plot(strptime(paste(gpa.2day.subset.figure1$Date,gpa.2day.subset.figure1$Time),"%d/%m/%Y %H:%M:%S"),
     gpa.2day.subset.figure1$Global_active_power,type="l",
     xlab = "",ylab = "Global Active Power (kilowatts)")

## Figure 2
gpa.2day.subset.figure2 <- na.omit(data[which(data$Date == '1/2/2007' | data$Date == '2/2/2007'),
                                        c("Date","Time","Voltage")])

plot(strptime(paste(gpa.2day.subset.figure2$Date,gpa.2day.subset.figure2$Time),"%d/%m/%Y %H:%M:%S"),
     gpa.2day.subset.figure2$Voltage,type="l",
     xlab = "datetime",ylab = "Voltage")


## Figure 3
gpa.2day.subset.figure3 <- na.omit(data[which(data$Date == '1/2/2007' | data$Date == '2/2/2007'),
                                c("Date","Time","Sub_metering_1","Sub_metering_2","Sub_metering_3")])

plot(strptime(paste(gpa.2day.subset.figure3$Date,gpa.2day.subset.figure3$Time),"%d/%m/%Y %H:%M:%S"),
     gpa.2day.subset.figure3$Sub_metering_1,type="l",
     xlab = "",ylab = "Energy sub metering")

lines(strptime(paste(gpa.2day.subset.figure3$Date,gpa.2day.subset.figure3$Time),"%d/%m/%Y %H:%M:%S"),
      gpa.2day.subset.figure3$Sub_metering_2,type="l",
      xlab = "",col = "red")

lines(strptime(paste(gpa.2day.subset.figure3$Date,gpa.2day.subset.figure3$Time),"%d/%m/%Y %H:%M:%S"),
      gpa.2day.subset.figure3$Sub_metering_3,type="l",
      xlab = "",col = "blue")

legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=(c("black","red","blue")))

# Figure 4
gpa.2day.subset.figure4 <- na.omit(data[which(data$Date == '1/2/2007' | data$Date == '2/2/2007'),
                                        c("Date","Time","Global_reactive_power")])

plot(strptime(paste(gpa.2day.subset.figure4$Date,gpa.2day.subset.figure4$Time),"%d/%m/%Y %H:%M:%S"),
     gpa.2day.subset.figure4$Global_reactive_power,type="l",
     xlab = "datetime",ylab = "Global_reactive_power")

dev.off()
