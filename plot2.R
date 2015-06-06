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

# Generate plot no.2
#-------------------
png(filename = "plot2.png", width = 480, height = 480)

plot(strptime(data.selection$Date, format="%Y-%m-%d %H:%M:%S"), 
     data.selection$Global_active_power, 
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()