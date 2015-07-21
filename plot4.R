setwd("C:/Users/Pang/Documents/EDA in R/Wk 1")  # set working directory

#Read in and subset data
power<-read.csv2("household_power_consumption.txt")
tab1(power$Date)

powersub<-subset(power,Date=="1/2/2007"|Date=="2/2/2007")

#Combine Date and time into one numeric "time" variable
x<-as.factor(paste(powersub$Date,powersub$Time))
time<-strptime(x,"%d/%m/%Y %H:%M:%S")

globalactive<-as.numeric(as.character(powersub$Global_active_power))#Re-scale the data to match sample

sub1<-as.numeric(as.character(powersub$Sub_metering_1))
sub2<-as.numeric(as.character(powersub$Sub_metering_2))
sub3<-as.numeric(as.character(powersub$Sub_metering_3))


#Plot4
volt<-as.numeric(as.character(powersub$Voltage))
globalreactive<-as.numeric(as.character(powersub$Global_reactive_power)) #Re-scale data to match sample

png(filename="plot4.png",width=480,height=480,units='px')
par(mfrow=c(2,2))
plot(time,globalactive,type="l",ylab='Global Active Power(kilowatts)',xlab=' ')
plot(time,volt,type="l",ylab='Voltage',xlab=' ')
plot(time,sub1,type='n',ylab=" ",xlab=" ")
lines(time,sub1,col='Black')
lines(time,sub2,col='Red')
lines(time,sub3,col='Blue')
legend("topright",lty=1,col=c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),text.font=1,bty='n',cex=0.75)
title(ylab="Energy sub metering")
plot(time,globalreactive,type="l",ylab='Global Reactive Power(kilowatts)',xlab=' ')
dev.off()
