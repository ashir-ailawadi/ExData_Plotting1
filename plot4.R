library(dplyr)

# The file household_power_consumption.txt -> Assumed to be available in Working Directory

# Reading the data only for dates 2020-02-01 & 2020-02-02
df <- read.table("household_power_consumption.txt", sep=";", na.strings="?", skip=66637, nrows=2880)

# Changing the Date/Time formats
df <- mutate(df, V2 = strptime(paste(df$V1,df$V2,sep=" "), "%d/%m/%Y %H:%M:%S", tz="Europe/Paris"))
df <- mutate(df, V1 = as.Date(V1,"%d/%m/%y"))

# Assigning names
names(df) <- read.table("household_power_consumption.txt", sep=";", na.strings="?", nrows=1)

# Plot 4
png(file="plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
# First Plot
with(df, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
# Second Plot
with(df, plot(Time, Voltage, type="l", xlab="datetime", ylab="Voltage"))
# Third Plot
with(df, plot(Time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(df$Time, df$Sub_metering_2, col= "red")
lines(df$Time, df$Sub_metering_3, col= "blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# Fourth Plot
with(df, plot(Time, Global_reactive_power, type="l", xlab="datetime"))

dev.off()