########################################
# COURSERA : EXPLORATORY DATA ANALYSIS #  
# Course Project 1 : Plot3             #
########################################

# Set work directory - this location contains the data
workdir<-"C:/Users/e038163/Desktop/Coursera/"
setwd(workdir)

# Read in data
d = read.table("household_power_consumption.txt", 
               sep=";", 
               col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
               fill = TRUE , header = TRUE )

# Format date and time columns
d$Date.format<-as.Date(d$Date, format="%d/%m/%Y")
d$Time.format<-format(strptime(d$Time, format="%H:%M"),format="%H:%M")
d$datetime <- strptime(paste(d$Date, d$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
d$dd<-as.numeric(format(d$Date.format, "%d"))
d$mm<-as.numeric(format(d$Date.format, "%m"))
d$yy<-as.numeric(format(d$Date.format, "%Y"))
d$wkday <- format(as.Date(d$Date.format),"%w")
d$wkday2 <- substr(weekdays(as.Date(d$Date.format)),1,3)

d$Sub_metering_1<-as.numeric(d$Sub_metering_1)
d$Sub_metering_2<-as.numeric(d$Sub_metering_2)
d$Sub_metering_3<-as.numeric(d$Sub_metering_3)

# Create analysis subset

d1 <- subset(d, d$mm == 2 & d$yy == 2007 & d$dd %in% c(1,2))
d1sorted <- d1[order(d1$datetime ,decreasing = FALSE),]

# Plot3

png(filename = 'plot3.png', width = 480, height = 480)
par(mfrow = c(1,1))
plot(d1sorted$datetime, d1sorted$Sub_metering_1, type = "l", col = "black", xlab = "" ,ylab = "Energy sub metering")
lines(d1sorted$datetime, d1sorted$Sub_metering_2, type = "l", col = "red", xlab = "" ,ylab = "Energy sub metering")
lines(d1sorted$datetime, d1sorted$Sub_metering_3, type = "l", col = "blue", xlab = "" ,ylab = "Energy sub metering")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"),cex = .75)
dev.off()

# END OF CODE