library(lubridate)
library(dplyr)
getwd()
setwd("C:/Users/Gabriel/Documents/Coursera/4 exploratory data analysis//week1")

d <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt",
                header = TRUE, 
                sep = ";")

d$Date <- dmy(d$Date)

td <- filter(d,Date %in% c(dmy("01/02/2007"),dmy("02/02/2007")))


## Open png device; create 'myplot.png' in my working directory
png(file = "plot1.png",width = 480,height = 480) 

## Create plot and send to a file (no plot appears on screen)
hist(as.numeric(td$Global_active_power)/500, breaks = 12,
     col = "red",
     main ="Global Active Power",
     xlab ="Global Active Power (kilowatts)"
)

## Close the PNG file device
dev.off() 
## Now you can view the file 'myplot.png' on your computer