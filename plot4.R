library(dplyr)

## Read data from txt asuming you unzipped into WD, convert to Data Frame
hpower <- read.table("household_power_consumption.txt",header=T,sep=";",colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")
hpower <- data.frame(hpower)

#Date & Time col to date & time class
hpower$DateTime <- as.POSIXct(paste(hpower$Date, hpower$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")

#filter
hpower_filter <- hpower[hpower$Date == "1/2/2007" | hpower$Date == "2/2/2007", ]

#graph plot 4
png("plot4.png",width=480,height=480)
par(mfcol=c(2,2))
plot(hpower_filter$DateTime, hpower_filter$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=NA)
plot(hpower_filter$DateTime, hpower_filter$Sub_metering_1,type="l",ylab="Energy sub metering",xlab=NA,col="black")
lines(hpower_filter$DateTime, hpower_filter$Sub_metering_2, col="red")
lines(hpower_filter$DateTime, hpower_filter$Sub_metering_3, col="blue")
legend("topright", lty=1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(hpower_filter$DateTime, hpower_filter$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot (hpower_filter$DateTime, hpower_filter$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()