## Read the full data set into usable format
fullDataSet <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
## Format the date as suggested in assignment
fullDataSet$Date <- as.Date(fullDataSet$Date, format="%d/%m/%Y")

## Retrieve the data we are interested in plotting and clear mem used from full dataset
plotData <- subset(fullDataSet, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(fullDataSet)

## Convert the dates as suggested in assignment
datetime <- paste(as.Date(plotData$Date), plotData$Time)
plotData$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(plotData$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()