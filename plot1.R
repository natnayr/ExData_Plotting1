data_all <- read.table(file="exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", header=TRUE,na.strings="?", 
                   nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#format Date
data_all$Date <- as.Date(data_all$Date, format = "%d/%m/%Y")

#subset Data for 2007-02-01 and 2007-02-02 period only
data <- subset(data_all, subset =(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_all)

data$Datetime <- as.POSIXct(paste(as.Date(data$Date), data$Time))
