setwd("C:/Users/Pang/Documents/EDA in R/Wk 1")  # set working directory

#Read in and subset data
power<-read.csv2("household_power_consumption.txt")
tab1(power$Date)

powersub<-subset(power,Date=="1/2/2007"|Date=="2/2/2007")

#Combine Date and time into one numeric "time" variable
x<-as.factor(paste(powersub$Date,powersub$Time))
time<-strptime(x,"%d/%m/%Y %H:%M:%S")

globalactive<-as.numeric(as.character(powersub$Global_active_power))

#Plot2
par(mar=c(4.1,6.1,4.1,1.1)) 
png(filename="plot2.png",width=480,height=480,units='px')
plot(time,globalactive,type="l",ylab='Global Active Power(kilowatts)',xlab=' ')
dev.off()
