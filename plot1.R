library(dplyr)

# The file household_power_consumption.txt -> Assumed to be available in Working Directory

# Reading the data only for dates 2020-02-01 & 2020-02-02
df <- read.table("household_power_consumption.txt", sep=";", na.strings="?", skip=66637, nrows=2880)

# Changing the Date/Time formats
df <- mutate(df, V2 = strptime(paste(df$V1,df$V2,sep=" "), "%d/%m/%Y %H:%M:%S", tz="Europe/Paris"))
df <- mutate(df, V1 = as.Date(V1,"%d/%m/%y"))

# Assigning names
names(df) <- read.table("household_power_consumption.txt", sep=";", na.strings="?", nrows=1)

# Plot 1
png(file="plot1.png", width = 480, height = 480, units = "px")
par(mfrow=c(1,1))
with(df, hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power"))
dev.off()