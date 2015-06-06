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


# Generate plot no.1
#-------------------
png(filename = "plot1.png", width = 480, height = 480)

hist(data.selection$Global_active_power,
     breaks=12, 
     freq=TRUE, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequencies")

dev.off()
