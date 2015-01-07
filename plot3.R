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

## Plot 3
with(plotData, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Energy Sub Metering", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()