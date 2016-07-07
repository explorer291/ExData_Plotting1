library(dplyr)

## Read data from txt asuming you unzipped into WD, convert to Data Frame
hpower <- read.table("household_power_consumption.txt",header=T,sep=";",colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")
hpower <- data.frame(hpower)

#Date & Time col to date & time class
hpower$DateTime <- as.POSIXct(paste(hpower$Date, hpower$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")

#filter
hpower_filter <- hpower[hpower$Date == "1/2/2007" | hpower$Date == "2/2/2007", ]

#graph plot 3
png("plot3.png",width=480,height=480)
plot(hpower_filter$DateTime, hpower_filter$Sub_metering_1,type="l",ylab="Energy sub metering",xlab=NA,col="black")
lines(hpower_filter$DateTime, hpower_filter$Sub_metering_2, col="red")
lines(hpower_filter$DateTime, hpower_filter$Sub_metering_3, col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()