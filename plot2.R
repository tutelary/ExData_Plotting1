library(proto)
library(gsubfn)
library(sqldf)
fn <- "C:/Users/chaitanya/ExData_Plotting1/household_power_consumption.txt"
data <- read.csv.sql(fn, sep=";",sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"')
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

#plot
x <- data$Date
y <- data$Global_active_power
png(filename = 'plot2.png', width = 480, height = 480, units = 'px')
plot(x,y,"l",xlab=" ",ylab="Global Active Power (kilowatts)")
