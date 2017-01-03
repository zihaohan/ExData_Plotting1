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


