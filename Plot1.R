  #find out what the lines for 01-02-2007 and 02-02-2007 to read are
  lines_to_read<-grep("(^(1|2)/2/2007)", readLines("household_power_consumption.txt"), fixed = FALSE)
  
  #read the raw text files for only the lines specified above
  data<- read.csv2("household_power_consumption.txt", header = FALSE)[lines_to_read,]
  names<- read.csv2("household_power_consumption.txt", header = FALSE, nrows=1)
  names(data)<- unlist(names)
  
  #Make plot 1 as png
  png("plot1.png")
  hist(as.numeric(data$Global_active_power), col = "red", 
       xlab = "Global Active Power (kilowatts)", 
       main = "Global Active Power")
  
dev.off()