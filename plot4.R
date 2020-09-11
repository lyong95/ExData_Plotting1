#find out what the lines for 01-02-2007 and 02-02-2007 to read are
lines_to_read<-grep("(^(1|2)/2/2007)", readLines("household_power_consumption.txt"), fixed = FALSE)

#read the raw text files for only the lines specified above
data<- read.csv2("household_power_consumption.txt", header = FALSE)[lines_to_read,]
names<- read.csv2("household_power_consumption.txt", header = FALSE, nrows=1)
names(data)<- unlist(as.list(names))

#convert dates to date format
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

#Make Plot 4
png("Plot4.png")
par(mfrow = c(2,2))

#make Plot 4 top left
with(data, plot(DateTime, Global_active_power, type = "l", xlab= " ", ylab = "Global Active Power(Kilowatts)"))


#make Plot 4 top right
with(data, plot(DateTime, as.numeric(as.character(Voltage)), type = "l", xlab= "datetime", ylab = "Voltage"))

#make Plot 4 bottom left
with(data, plot(DateTime, as.numeric(as.character(data$Sub_metering_1)), type = "l", col = "black", xlab = " ", ylab = "Energy Sub metering"))
with(data, lines(DateTime, as.numeric(as.character(data$Sub_metering_2)), col = "red"))
with(data, lines(DateTime, as.numeric(as.character(data$Sub_metering_3)), col = "blue"))
legend("topright", legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"), lty = 1, bty = "n", col = c("black", "red", "blue"), cex = 1)


#make Plot 4 bottom right
with(data, plot(DateTime, as.numeric(as.character(Global_reactive_power)), type = "l", xlab= "datetime", ylab = "Global reactive power"))

dev.off()