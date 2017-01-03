setwd(".\\course4")

df <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?", stringsAsFactors = FALSE)

df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

twoday <- df %>% filter(Date == "2007-02-01"|Date == "2007-02-02")

addtime <- twoday %>% mutate(when = paste(Date, Time), 
                             scale = as.POSIXct(when))


##plot 1 
png("plot1.png", width = 480, height = 480)
attach(addtime)
hist(Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     main = "Global Active Power")
dev.off()


## plot2
png("plot2.png", width = 450, height = 450)
attach(addtime)
plot(scale, Global_active_power, type = "l", xlab = NA, ylab = "Global Active Power (kilowatts)")
dev.off()


##plot3
png("plot3.png", width = 450, height = 450)
plot(scale, Sub_metering_1, type = "l", col = "black", xlab="", ylab= "Energy sub metering")
lines(scale, Sub_metering_2, col="red")
lines(scale, Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1), lwd=c(1,1))
dev.off()

names(addtime)

## plot4
png("plot4.png", width = 450, height = 450)
par(mfcol = c(2, 2))
##plot1
hist(Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     main = "Global Active Power")
##plot2
plot(scale, Sub_metering_1, type = "l", col = "black", xlab="", ylab= "Energy sub metering")
lines(scale, Sub_metering_2, col="red")
lines(scale, Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1), lwd=c(1,1))

##plot3
plot(scale, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

##plot4
plot(scale, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
