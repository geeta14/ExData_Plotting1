############reading data-----------

setwd("C:\\gnain\\data_science_project\\4_ex_data\\projects")

data<-read.table(file=
                "exdata-data-household_power_consumption\\household_power_consumption.txt",
                header=TRUE,
                na.string="?",
                sep=";") 


#####subsetting data
class(data$Date)        #####checking class of date from data table

data$Date<-as.Date(data$Date, "%m/%d/%Y") ####converting date column values to date format 

data1 <- subset(data,data$Date=="2007-02-01"| data$Date=="2007-02-02") ##subsetting values which have required date 


################plot 1---------------------------------
hist(data1$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power(kilowatts)")


dev.copy(png, 
             file = "plot1.png",
             width=480, 
             height=480)

dev.off()



