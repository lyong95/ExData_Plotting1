#find out what the lines for 01-02-2007 and 02-02-2007 to read are
lines_to_read<-grep("(^(1|2)/2/2007)", readLines("household_power_consumption.txt"), fixed = FALSE)

#read the raw text files for only the lines specified above
data<- read.csv2("household_power_consumption.txt", header = FALSE)[lines_to_read,]
names<- read.csv2("household_power_consumption.txt", header = FALSE, nrows=1)
names(data)<- unlist(as.list(names))

#convert dates to date format
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

#make Plot3

png("Plot3.png")

with(data, plot(DateTime, as.numeric(as.characterdata$Sub_metering_1)), type = "l", col = "black", xlab = " ", ylab = "Energy Sub metering")
with(data, lines(DateTime, as.numeric(as.characterdata$Sub_metering_2)), col = "red")
with(data, lines(DateTime, as.numeric(as.character(data$Sub_metering_3)), col = "blue"))
legend("topright", legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"), lty = 1, col = c("black", "red", "blue"), cex = 0.5)

dev.off()

