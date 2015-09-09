powerds <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
after1stFeb <- powerds[as.Date(powerds$Date, "%d/%m/%Y") >= '2007-02-01',]
power1st2ndFeb <- after1stFeb[as.Date(after1stFeb$Date, "%d/%m/%Y") < '2007-02-03',]
hist(as.double(as.character(power1st2ndFeb$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()
