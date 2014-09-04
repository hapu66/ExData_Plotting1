
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

png(filename="plot2.png",width=480,height=480)
plot(data$Global_active_power, type="l", xlab="",
ylab="Global Active Power (kilowatts)", axes=FALSE)
axis(1, at=c(1,L/2,L), labels=wdays)
axis(2)
box()
dev.off()
