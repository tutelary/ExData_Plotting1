library(proto)
library(gsubfn)
library(sqldf)
fn <- "C:/Users/chaitanya/ExData_Plotting1/household_power_consumption.txt"
data <- read.csv.sql(fn, sep=";",sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"')
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

#plot 
png(filename = 'plot3.png', width = 480, height = 480, units = 'px')
hist(data$Global_active_power,col = "orangered3",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")

