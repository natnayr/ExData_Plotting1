#Read FIles
data_all <- read.table(file="exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", header=TRUE,na.strings="?", 
                       check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#Format Date
data_all$Date <- as.Date(data_all$Date, format = "%d/%m/%Y")

#Subset Data for 2007-02-01 and 2007-02-02 period only
data <- subset(data_all, subset =(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_all)

#Join DateTime columns
data$Datetime <- as.POSIXct(paste(as.Date(data$Date), data$Time))

#Make Plot
with(data, {
  plot(Sub_metering_1~Datetime, type="l", xlab="", ylab="Energy sub metering")
  lines(Sub_metering_2~Datetime, col="red")
  lines(Sub_metering_3~Datetime, col="blue")
})

#add legend
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"),lty=1, lwd=2)


#Copy and create png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()