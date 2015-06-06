############reading data

setwd("C:\\gnain\\data_science_project\\4_ex_data\\projects")
data<-read.table(file=
                "exdata-data-household_power_consumption\\household_power_consumption.txt",
                header=TRUE,
                na.string="?",
                sep=";") 
str(data)
class(data$Date)        #####checking class of date from data table
data$Date<-as.Date(data$Date, "%m/%d/%Y") ####converting date column values to date format 


#####subsetting data

data1 <- subset(data,data$Date=="2007-02-01"| data$Date=="2007-02-02") ##subsetting values which have required date 

datetime <- paste(as.Date(data1$Date), data1$Time)
data1$dt_both <-as.POSIXct(datetime)

################plot 3------------------------------

with(data1, {
  plot(Sub_metering_1~dt_both, type="l",
       ylab="Global Active Power (kilowatts)", xlab="", ylim=c(0,37), col="Black")
  lines(Sub_metering_2~dt_both,col='Red')
  lines(Sub_metering_3~dt_both,col='Blue')})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.copy(png, 
             file = "plot3.png",
             width=480, 
             height=480)

dev.off()



