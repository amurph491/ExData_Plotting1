setwd("C:/Users/amurphy/Documents/Customer Intelligence/R-Practice/ExpDataAnalysis/CP1")

data <- read.table("./exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

ndata <- data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

ndata$Date <- as.Date(ndata$Date,"%d/%m/%Y")

ndata$DT<-strptime(paste(ndata$Date,ndata$Time),format="%Y-%m-%d %H:%M:%S")

plot.new()
plot(ndata$DT,ndata$Sub_metering_1,col="black",main="Global Active Power",xlab="",ylab="Energy sub metering", type='n')
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
lines(ndata$DT,ndata$Sub_metering_1,col="black")
lines(ndata$DT,ndata$Sub_metering_2,col="red")
lines(ndata$DT,ndata$Sub_metering_3,col="blue")

dev.copy(png,file="./ExData_Plotting1/apm_figure/plot3.png",width=480,height=480)
dev.off()