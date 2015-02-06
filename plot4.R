library(lubridate)
library(dplyr)
getwd()
setwd("C:/Users/Gabriel/Documents/Coursera/4 exploratory data analysis//week1")

d <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt",
                header = TRUE, 
                sep = ";")

d$Datetime <- dmy_hms(paste(d$Date,d$Time))

d$Date <- dmy(d$Date)

td <- filter(d,Date %in% c(dmy("01/02/2007"),dmy("02/02/2007")))

## Open png device; create 'myplot.png' in my working directory
png(file = "plot4.png",width = 480,height = 480) 

## Create plot and send to a file (no plot appears on screen)
par(mfrow=c(2,2))
#1
plot(type ='n', td$Datetime, as.numeric(td$Global_active_power)/500,
     ylab ="Global Active Power (kilowatts)",
     xlab ="")
lines(td$Datetime, as.numeric(td$Global_active_power)/500, type='l')

#2
plot(type ='n', td$Datetime, as.numeric(td$Voltage)/25+200,
     ylab ="Voltage",
     xlab ="Datetime")
lines(td$Datetime, as.numeric(td$Voltage)/25+200, type='l')

#3
plot(type ='n', td$Datetime, as.numeric(td$Sub_metering_1),
     ylab ="Energy sub metering",
     xlab =""
)
lines(td$Datetime, as.numeric(td$Sub_metering_1), type='l',col="black")
lines(td$Datetime, as.numeric(td$Sub_metering_2), type='l',col = "red")
lines(td$Datetime, as.numeric(td$Sub_metering_3), type='l',col = "blue")
legend("topright",  title="", 
       legend = c("Submetering_1","Submetering_2","Submetering_3"),
       lwd = 1,
       col = c("black","red","blue") ,
       horiz= FALSE)

#4
plot(type ='n', td$Datetime, as.numeric(td$Global_reactive_power)/400,
     ylab ="Global_reactive_power",
     xlab ="Datetime")
lines(td$Datetime, as.numeric(td$Global_reactive_power)/400, type='l')

## Close the PNG file device
dev.off() 
