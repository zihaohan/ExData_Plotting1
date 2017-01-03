setwd(".\\course4")

df <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?", stringsAsFactors = FALSE)

df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

twoday <- df %>% filter(Date == "2007-02-01"|Date == "2007-02-02")

addtime <- twoday %>% mutate(when = paste(Date, Time), 
                             scale = as.POSIXct(when))



## plot2
png("plot2.png", width = 480, height = 480)
attach(addtime)
plot(scale, Global_active_power, type = "l", xlab = NA, ylab = "Global Active Power (kilowatts)")
dev.off()


