setwd("C:/Users/amurphy/Documents/Customer Intelligence/R-Practice/ExpDataAnalysis/CP1")

data <- read.table("./exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

ndata <- data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

ndata$Date <- as.Date(ndata$Date,"%d/%m/%Y")

with(ndata,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))

dev.copy(png,file="./ExData_Plotting1/apm_figure/plot1.png",width=480,height=480)
dev.off()