library(dplyr)

## Read data from txt asuming you unzipped into WD, convert to Data Frame
hpower <- read.table("household_power_consumption.txt",header=T,sep=";",colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")
hpower <- data.frame(hpower)

#Date & Time col to date & time class
hpower$DateTime <- as.POSIXct(paste(hpower$Date, hpower$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")

#filter
hpower_filter <- hpower[hpower$Date == "1/2/2007" | hpower$Date == "2/2/2007", ]

#graph plot 2

png(filename="plot2.png", width=480, height=480)
plot(hpower_filter$DateTime, hpower_filter$Global_active_power, type="l", xaxt = "n",
        ylab = "Global Active Power (kilowatts)", xlab = NA)
#axis.Date(hpower_filter$DateTime,side = 1)
dev.off()