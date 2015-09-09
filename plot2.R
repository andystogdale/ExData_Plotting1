powerds <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
after1stFeb <- powerds[as.Date(powerds$Date, "%d/%m/%Y") >= '2007-02-01',]
power1st2ndFeb <- after1stFeb[as.Date(after1stFeb$Date, "%d/%m/%Y") < '2007-02-03',]
power1st2ndFeb <- within(power1st2ndFeb, DateTime <- as.POSIXlt(paste(as.character(power1st2ndFeb$Date), as.character(power1st2ndFeb$Time)),format = "%d/%m/%Y %H:%M:%S"))
with(power1st2ndFeb, plot(power1st2ndFeb$DateTime, as.double(as.character(power1st2ndFeb$Global_active_power)), type="n", ylab = "Global Active Power (kilowatts)", xlab = ''))
lines(power1st2ndFeb$DateTime, as.double(as.character(power1st2ndFeb$Global_active_power)))
dev.copy(png, file = "plot2.png")
dev.off()