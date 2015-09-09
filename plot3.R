powerds <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
after1stFeb <- powerds[as.Date(powerds$Date, "%d/%m/%Y") >= '2007-02-01',]
power1st2ndFeb <- after1stFeb[as.Date(after1stFeb$Date, "%d/%m/%Y") < '2007-02-03',]
power1st2ndFeb <- within(power1st2ndFeb, DateTime <- as.POSIXlt(paste(as.character(power1st2ndFeb$Date), as.character(power1st2ndFeb$Time)),format = "%d/%m/%Y %H:%M:%S"))
with(power1st2ndFeb, plot(power1st2ndFeb$DateTime, as.double(as.character(power1st2ndFeb$Sub_metering_1)), type="n", ylab = "Energy sub metering", xlab = ''))
lines(power1st2ndFeb$DateTime, as.double(as.character(power1st2ndFeb$Sub_metering_1)))
lines(power1st2ndFeb$DateTime, as.double(as.character(power1st2ndFeb$Sub_metering_2)), col = "red")
lines(power1st2ndFeb$DateTime, as.double(as.character(power1st2ndFeb$Sub_metering_3)), col = "blue")
legend("topright", lty=c(1,1), col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file = "plot3.png")
dev.off()