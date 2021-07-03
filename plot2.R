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

## Open PNG graphics device
png("plot2.png", width=480, height=480)

## Plot it
plot(wanted_rows$dateTime, wanted_rows$Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)")

## Close the GD
dev.off()
