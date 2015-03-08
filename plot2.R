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

#Create line chart
plot(x=data$Datetime, y=data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Copy and create png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()