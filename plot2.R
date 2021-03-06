#Downloading dataset
if(!file.exists("data")){dir.create("data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = ".\\data\\household_power_consumption.txt")
##Unzipping dataset to data directory
unzip(".\\data\\household_power_consumption.txt")
##Saving dataset as HPC object
HPC <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
##Uploading dplyr package
library(dplyr)
##subsetting 
HPC_SUB <- filter(HPC, Date == "1/2/2007" | Date == "2/2/2007")
##Open PNG device; Create "plot2.png" in my working directory
png(filename = "plot2.png", width = 480, height = 480)
##Changing HPC$Date format
HPC_SUB$Date <- gsub("\\/", "\\-", HPC_SUB$Date)
##Changing HPC_SUB$Date format to the assignment's recommended one
HPC_SUB$Date <- format(strptime(HPC_SUB$Date, "%d-%m-%Y"), "%Y-%m-%d")
##Uploading 'anytime' package
library(anytime)
##Integrating Date and Time variables into DateTime variable
HPC_SUB$DateTime <- paste(HPC_SUB$Date, HPC_SUB$Time)
##Converting DateTime variable into POSIXct and POSIXt class
HPC_SUB$DateTime <- anytime(HPC_SUB$DateTime)
##Validating the class of DateTime variable
class(HPC_SUB$DateTime)
##Plotting Global_active_power and DateTime
with(HPC_SUB, plot(DateTime, Global_active_power, type = "l", xlab = '', ylab = "Global Active Power (kilowatts)"))
dev.off()
