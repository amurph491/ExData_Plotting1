data <- read.table("./exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

ndata <- data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

ndata$Date <- as.Date(ndata$Date,"%d/%m/%Y")

ndata$DT<-strptime(paste(ndata$Date,ndata$Time),format="%Y-%m-%d %H:%M:%S")

plot.new()
par(mfrow=c(2,2))

#Plot 1
plot(ndata$DT,ndata$Global_active_power,col="black",main="",xlab="",ylab="Global Active Power (kilowatts)", type='n')
lines(ndata$DT,ndata$Global_active_power)

#Plot 2
plot(ndata$DT,ndata$Voltage,col="black",main="",xlab="",ylab="Voltage", type='n')
lines(ndata$DT,ndata$Voltage)

#Plot 3
plot(ndata$DT,ndata$Sub_metering_1,col="black",main="",xlab="",ylab="Energy sub metering", type='n')
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
lines(ndata$DT,ndata$Sub_metering_1,col="black")
lines(ndata$DT,ndata$Sub_metering_2,col="red")
lines(ndata$DT,ndata$Sub_metering_3,col="blue")

#Plot 4
plot(ndata$DT,ndata$Global_reactive_power,col="black",main="",xlab="",ylab="Global_reactive_power", type='n')
lines(ndata$DT,ndata$Global_reactive_power)

dev.copy(png,file="./ExData_Plotting1/apm_figure/plot4.png",width=480,height=480)
dev.off()