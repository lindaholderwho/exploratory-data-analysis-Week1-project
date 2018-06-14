#导入数据
data<-read.csv("G:\\data science\\course 4\\week1\\assignment\\exdata\\data\\household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#调整时间格式
data$Date<-as.Date(data$Date,format = "%d/%m/%Y")
#筛选出时间在2007-02-01至2007-02-02
wanting<-subset(data,Date>="2007-02-01"&Date<="2007-02-02")
#tidy time
datetime<-paste(as.Date(wanting$Date), wanting$Time)
wanting$Datetime <- as.POSIXct(datetime)
#plot 1

#插曲：显示global active power不是数值，转换为数值：
as.numeric(as.character(wanting$Global_active_power))
wanting$Globalactivepower<-as.numeric(wanting$Global_active_power)

hist(wanting$Globalactivepower, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

#plot 2
plot(Globalactivepower~Datetime,data = wanting,type="l",xlab = "", ylab =" Global Active Power (kilowatts))")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()


#plot3
#转换数据：
wanting$Energysubmetering1<-as.numeric(wanting$Sub_metering_1)
wanting$Energysubmetering2<-as.numeric(wanting$Sub_metering_2)
wanting$Energysubmetering3<-as.numeric(wanting$Sub_metering_3)

with(wanting,{
      plot(Energysubmetering1~Datetime,type="l",xlab = "", ylab =" Global sub metering") 
      lines(Energysubmetering2~Datetime, col="red") 
      lines(Energysubmetering3~Datetime,col="blue")
})

#图标
legend("topright",legend=c("Sub_metering 1","Sub_metering 2","Sub_metering 3"), col=c("black","red","blue"),lty=1, lwd=2)
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

#plot 4
wanting$voltage<-as.numeric(wanting$Voltage)
wanting$Globalreactivepower<-as.numeric(wanting$Global_reactive_power)
wanting$Globalintensity<-as.numeric(wanting$Global_intersity)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(Globalactivepower~Datetime,data = wanting,type="l",xlab = "", ylab =" Global Active Power")
plot(voltage~Datetime,data = wanting,type="l",xlab = "datetime", ylab ="Voltage")
with(wanting,{
    plot(Energysubmetering1~Datetime,type="l",xlab = "", ylab =" Global sub metering") 
    lines(Energysubmetering2~Datetime, col="red") 
    lines(Energysubmetering3~Datetime,col="blue")
})
legend("topright",legend=c("Sub_metering 1","Sub_metering 2","Sub_metering 3"), col=c("black","red","blue"),lty=1, lwd=2, cex=0.6, bty="n")
plot(Globalreactivepower~Datetime,data = wanting,type="l",xlab = "datetime", ylab ="Global reactive power")
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()