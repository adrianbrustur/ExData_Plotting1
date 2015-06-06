# Load the data
#--------------
# The code that loads the data is
# common for all the plots, but
# should all the plots be made,
# the code only needs to be run once.

# read the data in a data frame
data<-na.omit(read.table("./data/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")))
data$Date<-as.Date(data$Date, "%d/%m/%Y")

# Select the data between the two dates
date1<-as.Date("2007-02-01")
date2<-as.Date("2007-02-02")
data.selection<-data[(data$Date==date1) | (data$Date==date2), ]
data.selection$Date<-paste(data.selection$Date, data.selection$Time,sep=" ")

# Generate plot no.4
#-------------------
png(filename = "plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))
par(mar=c(4,4,1,4))

plot(strptime(data.selection$Date, format="%Y-%m-%d %H:%M:%S"), 
     data.selection$Global_active_power, 
     type="l",
     xlab="",
     ylab="Global Active Power")

par(mar=c(4,4,1,1))
plot(strptime(data.selection$Date, format="%Y-%m-%d %H:%M:%S"), 
     data.selection$Voltage, 
     type="l",
     xlab="datetime",
     ylab="Voltage")

par(mar=c(4,4,4,4))
plot(strptime(data.selection$Date, format="%Y-%m-%d %H:%M:%S"), 
     data.selection$Sub_metering_1, 
     type="l",
     col="black",
     ylim=range( c(data.selection$Sub_metering_1, data.selection$Sub_metering_2, data.selection$Sub_metering_3) ),
     xlab="",
     ylab="Energy sub metering")
lines(strptime(data.selection$Date, format="%Y-%m-%d %H:%M:%S"), data.selection$Sub_metering_2, type="l", col="red")
lines(strptime(data.selection$Date, format="%Y-%m-%d %H:%M:%S"), data.selection$Sub_metering_3, type="l", col="blue")
legend("topright", 
       lty=1, 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black", "red", "blue"),
       cex=0.5)

par(mar=c(4,4,4,1))
plot(strptime(data.selection$Date, format="%Y-%m-%d %H:%M:%S"), 
     data.selection$Global_reactive_power, 
     type="l",
     xlab="datetime",
     ylab="Global Reactive Power")

dev.off()
