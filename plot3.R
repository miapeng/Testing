setwd("C:/Users/Pang/Documents/EDA in R/Wk 1")  # set working directory

#Read in and subset data
power<-read.csv2("household_power_consumption.txt")
tab1(power$Date)

powersub<-subset(power,Date=="1/2/2007"|Date=="2/2/2007")

#Combine Date and time into one numeric "time" variable
x<-as.factor(paste(powersub$Date,powersub$Time))
time<-strptime(x,"%d/%m/%Y %H:%M:%S")

#Plot3
sub1<-as.numeric(as.character(powersub$Sub_metering_1))
sub2<-as.numeric(as.character(powersub$Sub_metering_2))
sub3<-as.numeric(as.character(powersub$Sub_metering_3))


par(mar=c(4.1,5.1,4.1,1.1))

png(filename="plot3.png",width=480,height=480,units='px')
plot(time,sub1,type='n',ylab=" ",xlab=" ")
lines(time,sub1,col='Black')
lines(time,sub2,col='Red')
lines(time,sub3,col='Blue')
legend("topright",lty=1,col=c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),text.font=1)
title(ylab="Energy sub metering")
dev.off()
