
setwd("C:/Users/Pang/Documents/EDA in R/Wk 1")  # set working directory

#Read in and subset data
power<-read.csv2("household_power_consumption.txt")
tab1(power$Date)

powersub<-subset(power,Date=="1/2/2007"|Date=="2/2/2007")

#Combine Date and time into one numeric "time" variable
x<-as.factor(paste(powersub$Date,powersub$Time))
time<-strptime(x,"%d/%m/%Y %H:%M:%S")

#Plot 1

par(mar=c(5.1,5.1,4.1,1.1)) 
globalactive<-as.numeric(as.character(powersub$Global_active_power))

png(filename="plot1.png",width=480,height=480,units='px')
hist(globalactive,col="Red",main="Global Active Power",xlab="Global Active Power(kilowatts)",ylab="Frequency")
