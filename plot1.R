#plot1

# read data in from current working directory
data <- read.table(file = "household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")

head(data)

gpa.2day.subset <- na.omit(data[which(data$Date == '1/2/2007' | data$Date == '2/2/2007'),"Global_active_power"])

png(filename = "plot1.png", width = 480, height = 480, units = "px")

hist(gpa.2day.subset, col = "red",xlab = "Global Active Power (kilowats)",main = "Global Active Power")

dev.off()
     

