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
