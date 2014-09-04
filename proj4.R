
cn <- read.csv("household_power_consumption.txt",header=TRUE,sep=";", nrows=1)
colns <- names(cn)

# Rene Shiou-Ling Wang
fh <- file("household_power_consumption.txt","r");
data <- read.csv(header=FALSE, sep=";", col.names=colns,
 text = grep("^[1,2]/2/2007", readLines(con=fh), value=TRUE))
close(fh)

dts <- as.Date(data$Date, format="%d/%m/%Y")
tms <- strptime(data$Time, format="%H:%M:S")
L = length(dts)
 wdays = format(seq(dts[1], by="days", length=3),format="%a")


png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2))

plot(data$Global_active_power, type="l", xlab="",
ylab="Global Active Power", axes=FALSE)
axis(1, at=c(1,L/2,L), labels=wdays)
axis(2)
box()

plot(data$Voltage, type="l", xlab="datetime",
ylab="Voltage", axes=FALSE)
axis(1, at=c(1,L/2,L), labels=wdays)
axis(2)
box()

plot(data$Sub_metering_1, type="l", xlab="",
ylab="Energy sub metering", axes=FALSE)
points(data$Sub_metering_2, type="l",col="red")
points(data$Sub_metering_3, type="l",col="blue")
axis(1, at=c(1,L/2,L), labels=wdays)
axis(2)
legend("topright",
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
           lty =c(1,1,1), col = c("black", "red", "blue"), bty="n")
box()

plot(data$Global_reactive_power, type="l", xlab="datetime",
ylab="Global_reactive_power",axes=FALSE)
axis(1, at=c(1,L/2,L), labels=wdays)
axis(2)
box()

dev.off()
