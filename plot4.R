library(proto)
library(gsubfn)
library(sqldf)
fn <- "C:/Users/chaitanya/ExData_Plotting1/household_power_consumption.txt"
data <- read.csv.sql(fn, sep=";",sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"')
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

#plot
x <- data$Date
y <- data$Global_active_power
y1 <- data$Sub_metering_1
y2 <- data$Sub_metering_2
y3 <- data$Sub_metering_3
z <- data$Voltage
r <- data$Global_reactive_power
png(filename = 'plot4.png', width = 480, height = 480, units = 'px')
par(mfrow = c(2,2))
plot(x,y,xlab=" ",ylab="Global Active Power","l")
plot(x,z,xlab="datetime",ylab="Voltage","l")
plot(x,y1,'l',col="black",xlab=" ",ylab="Energy sub metering")
lines(x,y2,col="red")
lines(x,y3,col="blue")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=c(2.5,2.5),col=c("black","red","blue"),cex=0.90)
plot(x,r,"l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
