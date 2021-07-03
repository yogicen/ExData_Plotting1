## Extract the data
raw_data <- read.delim("household_power_consumption.txt", sep = ";")

## Took the wanted rows and combine them
wanted_rows1 <- raw_data[which(raw_data$Date == "1/2/2007"),]
wanted_rows2 <- raw_data[which(raw_data$Date == "2/2/2007"),]
wanted_rows <- rbind(wanted_rows1, wanted_rows2)

## Make new column consist of date and time
wanted_rows$dateTime <- format(paste(wanted_rows$Date, wanted_rows$Time))

## Convert the data to date data type
wanted_rows$dateTime <- strptime(wanted_rows$dateTime, "%d/%m/%Y %H:%M:%S")

## Convert Global_active_power column into numeric
wanted_rows$Global_active_power <- as.numeric(wanted_rows$Global_active_power)

## Convert the whole sub_metering to numeric
wanted_rows$Sub_metering_1 <- as.numeric(wanted_rows$Sub_metering_1)
wanted_rows$Sub_metering_2 <- as.numeric(wanted_rows$Sub_metering_2)
wanted_rows$Sub_metering_3 <- as.numeric(wanted_rows$Sub_metering_3)

## Open PNG graphics device
png("plot3.png", width=480, height=480)

## Do the plot
plot(wanted_rows$dateTime, wanted_rows$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(wanted_rows$dateTime, wanted_rows$Sub_metering_2, col = "red")
lines(wanted_rows$dateTime, wanted_rows$Sub_metering_3, col = "blue")
legend("topright", lty = 1, lwd = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"))

## Close the GD
dev.off()
