#Downloading dataset
if(!file.exists("data")){dir.create("data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = ".\\data\\household_power_consumption.txt")
##Unzipping dataset to data directory
unzip(".\\data\\household_power_consumption.txt")
##Saving dataset as HPC object
HPC <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
##Uploading 'dplyr' package
library(dplyr)
##subsetting
HPC_SUB <- filter(HPC, Date == "1/2/2007" | Date == "2/2/2007")
##Open PNG device; Create "plot1.png" in my working directory
png(filename = "plot1.png", width = 480, height = 480)
##Transform Global_active_power into numeric variable
HPC_SUB$Global_active_power <- as.numeric(HPC_SUB$Global_active_power)
##Validating
class(HPC_SUB$Global_active_power)
##Ploting Global_active_power 
with(HPC_SUB, hist(Global_active_power, col = "red"))
dev.off()