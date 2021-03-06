setwd(".\\course4")

df <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?", stringsAsFactors = FALSE)

df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

twoday <- df %>% filter(Date == "2007-02-01"|Date == "2007-02-02")

addtime <- twoday %>% mutate(when = paste(Date, Time), 
                             scale = as.POSIXct(when))


## plot4
png("plot4.png", width = 480, height = 480)
par(mfcol = c(2, 2))

##plot4.1
plot(scale, Global_active_power, type = "l", xlab = NA, ylab = "Global Active Power (kilowatts)")

##plot4.2
plot(scale, Sub_metering_1, type = "l", col = "black", xlab="", ylab= "Energy sub metering")
lines(scale, Sub_metering_2, col="red")
lines(scale, Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1), lwd=c(1,1))

##plot4.3
plot(scale, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

##plot4.4
plot(scale, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
