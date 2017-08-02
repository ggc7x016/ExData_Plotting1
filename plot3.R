# Read data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
# Set date format
data[,"Date"] <- as.Date(data[,"Date"],format = "%d/%m/%Y")
# Filter data
sdata<-subset(data,Date == "2007-02-01" | Date == "2007-02-02")
# Date-time format
dateTime<-strptime(paste(sdata$Date,sdata$Time,sep = " "), "%Y-%m-%d %H:%M:%S" )
# Convert string to numeric format
sm1<-as.numeric(sdata[,"Sub_metering_1"])
sm2<-as.numeric(sdata[,"Sub_metering_2"])
sm3<-as.numeric(sdata[,"Sub_metering_3"])

# Make and save plot
png("plot3.png",width = 480, height = 480)
plot(dateTime,sm1,col = "black",type = "l", xlab = " ", ylab = "Energy sub metering")
#Add lines to the plot for other sub-meters
lines(dateTime, sm2, col = "red")
lines(dateTime, sm3, col = "blue")
#Add legend
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1), col = c("black","red","blue"))
dev.off()