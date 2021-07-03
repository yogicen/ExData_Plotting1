## Extract the data
raw_data <- read.delim("household_power_consumption.txt", sep = ";")

## Took the wanted rows and combine them
wanted_rows1 <- raw_data[which(raw_data$Date == "1/2/2007"),]
wanted_rows2 <- raw_data[which(raw_data$Date == "2/2/2007"),]
wanted_rows <- rbind(wanted_rows1, wanted_rows2)

## Convert the Date column into date data type
wanted_rows$Date <- strptime(wanted_rows$Date, "%d/%m/%Y")

## Convert Global_active_power column into numeric
wanted_rows$Global_active_power <- as.numeric(wanted_rows$Global_active_power)

## Open PNG graphics device
png("plot1.png", width=480, height=480)

## Do the plot
hist(wanted_rows$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", 
              ylab = "Frequency", main = "Global Active Power")

## Close the GD
dev.off()