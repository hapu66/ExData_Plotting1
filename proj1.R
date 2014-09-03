
cn <- read.csv("household_power_consumption.txt",header=TRUE,sep=";", nrows=1)
colns <- names(cn)

# Rene Shiou-Ling Wang
fh <- file("household_power_consumption.txt","r");
data <- read.csv(header=FALSE, sep=";", col.names=colns,
 text = grep("^[1,2]/2/2007", readLines(con=fh), value=TRUE))
close(fh)


png(filename="plot1.png",width=480,height=480)
hist(data$Global_active_power, main="Global Active Power",
xlab="Global Active Power (kilowatts)",col="red")
dev.off()
