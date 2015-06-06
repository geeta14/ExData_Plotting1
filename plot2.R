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

################plot 2-------------------------------
final<-data.frame(power=data1$Global_active_power, datetime=data1$dt_both)

plot(final$power~final$datetime, type="l",xlab="", ylab="Global Active Power (killowatts)")

dev.copy(png, 
             file = "plot2.png",
             width=480, 
             height=480)

dev.off()



