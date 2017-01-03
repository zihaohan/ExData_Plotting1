setwd(".\\course4")

df <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?", stringsAsFactors = FALSE)

df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

twoday <- df %>% filter(Date == "2007-02-01"|Date == "2007-02-02")

addtime <- twoday %>% mutate(when = paste(Date, Time), 
                             scale = as.POSIXct(when))



##plot3
png("plot3.png", width = 480, height = 480)
plot(scale, Sub_metering_1, type = "l", col = "black", xlab="", ylab= "Energy sub metering")
lines(scale, Sub_metering_2, col="red")
lines(scale, Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1), lwd=c(1,1))
dev.off()



