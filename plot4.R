############reading data

setwd("C:\\gnain\\data_science_project\\4_ex_data\\projects")
data<-read.table(file=
                "exdata-data-household_power_consumption\\household_power_consumption.txt",
                header=TRUE,
                na.string="?",
                sep=";") 

data$Date<-as.Date(data$Date, "%m/%d/%Y") ####converting date column values to date format 


#####subsetting data

data1 <- subset(data,data$Date=="2007-02-01"| data$Date=="2007-02-02") ##subsetting values which have required date 

datetime <- paste(as.Date(data1$Date), data1$Time)
data1$dt_both <-as.POSIXct(datetime)

################plot 4------------------------------

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))
###1st plot----
plot(data1$Global_active_power~data1$dt_both, type="l",xlab="", ylab="Global Active Power (killowatts)")


##########plot2------------
plot(data1$Voltage~data1$dt_both, type="l",xlab="datetime", ylab="Voltage", ylim=c(234,247))

####plot 3------------

with(data1, {
  plot(Sub_metering_1~dt_both, type="l",
       ylab="Global Active Power (kilowatts)", xlab="", ylim=c(0,37), col="Black")
  lines(Sub_metering_2~dt_both,col='Red')
  lines(Sub_metering_3~dt_both,col='Blue')})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))




###############plot4---------
plot(data1$Global_reactive_power~data1$dt_both, type="l", xlab="datetime", ylab="Global_reactive_power", ylim=c(0,.5))






dev.copy(png, 
             file = "plot4.png",
             width=480, 
             height=480)

dev.off()



