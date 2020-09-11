#find out what the lines for 01-02-2007 and 02-02-2007 to read are
lines_to_read<-grep("(^(1|2)/2/2007)", readLines("household_power_consumption.txt"), fixed = FALSE)

#read the raw text files for only the lines specified above
data<- read.csv2("household_power_consumption.txt", header = FALSE)[lines_to_read,]
names<- read.csv2("household_power_consumption.txt", header = FALSE, nrows=1)
names(data)<- unlist(as.list(names))

#convert dates to date format
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

#make Plot2

png("Plot2.png")
with(data, plot(DateTime, Global_active_power, type = "l", xlab= " ", ylab = "Global Active Power(Kilowatts)"))

dev.off()