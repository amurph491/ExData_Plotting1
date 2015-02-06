setwd("C:/Users/amurphy/Documents/Customer Intelligence/R-Practice/ExpDataAnalysis/CP1")

data <- read.table("./exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

ndata <- data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

ndata$Date <- as.Date(ndata$Date,"%d/%m/%Y")

ndata$DT<-strptime(paste(ndata$Date,ndata$Time),format="%Y-%m-%d %H:%M:%S")
plot.new()
plot(ndata$DT,ndata$Global_active_power,col="black",main="Global Active Power",xlab="",ylab="Global Active Power (kilowatts)", type='n')
lines(ndata$DT,ndata$Global_active_power)

dev.copy(png,file="./ExData_Plotting1/apm_figure/plot2.png",width=480,height=480)
dev.off()