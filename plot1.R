########################################
# COURSERA : EXPLORATORY DATA ANALYSIS #  
# Course Project 1 : Plot1             #
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
d$dd<-as.numeric(format(d$Date.format, "%d"))
d$mm<-as.numeric(format(d$Date.format, "%m"))
d$yy<-as.numeric(format(d$Date.format, "%Y"))

d$Global_active_power<-as.numeric(d$Global_active_power)

# Create analysis subset
d1 <- subset(d, d$mm == 2 & d$yy == 2007 & d$dd %in% c(1,2))

# Plot1
png(filename = 'plot1.png', width = 480, height = 480)
par(mfrow = c(1,1))
hist(d1$Global_active_power, col = "red" , main = "Global Active Power", xlab ="Global Active Power (kilowatts)")
dev.off()

# END OF CODE
