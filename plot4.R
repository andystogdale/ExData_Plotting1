powerds <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
after1stFeb <- powerds[as.Date(powerds$Date, "%d/%m/%Y") >= '2007-02-01',]
power1st2ndFeb <- after1stFeb[as.Date(after1stFeb$Date, "%d/%m/%Y") < '2007-02-03',]
power1st2ndFeb <- within(power1st2ndFeb, DateTime <- as.POSIXlt(paste(as.character(power1st2ndFeb$Date), as.character(power1st2ndFeb$Time)),format = "%d/%m/%Y %H:%M:%S"))
par(mfrow = c(2,2),  mar = c(4, 4, 3, 3))
with(power1st2ndFeb, {
  with(power1st2ndFeb, plot(power1st2ndFeb$DateTime, as.double(as.character(power1st2ndFeb$Global_active_power)), type="n", ylab = "Global Active Power (kilowatts)", xlab = ''))
  lines(power1st2ndFeb$DateTime, as.double(as.character(power1st2ndFeb$Global_active_power)))
  
  with(power1st2ndFeb, plot(power1st2ndFeb$DateTime, as.double(as.character(power1st2ndFeb$Voltage)), type="n", ylab = "Voltage", xlab = 'datetime'))
  lines(power1st2ndFeb$DateTime, as.double(as.character(power1st2ndFeb$Voltage)))
  
  with(power1st2ndFeb, plot(power1st2ndFeb$DateTime, as.double(as.character(power1st2ndFeb$Sub_metering_1)), type="n", ylab = "Energy sub metering", xlab = ''))
  lines(power1st2ndFeb$DateTime, as.double(as.character(power1st2ndFeb$Sub_metering_1)))
  lines(power1st2ndFeb$DateTime, as.double(as.character(power1st2ndFeb$Sub_metering_2)), col = "red")
  lines(power1st2ndFeb$DateTime, as.double(as.character(power1st2ndFeb$Sub_metering_3)), col = "blue")
  legend("topright", lty=c(1,1), col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  with(power1st2ndFeb, plot(power1st2ndFeb$DateTime, as.double(as.character(power1st2ndFeb$Global_reactive_power)), type="n", ylab = "Global_reactive_power", xlab = 'datetime'))
  lines(power1st2ndFeb$DateTime, as.double(as.character(power1st2ndFeb$Global_reactive_power)))
})

dev.copy(png, file = "plot4.png")
dev.off()