ass_eda1 = read.table("household_power_consumption.txt",header = TRUE,sep = ';',stringsAsFactors = FALSE,colClasses = c(rep("character",2),rep("numeric",7)),na.strings = "?")


ass_eda1$Date = as.Date(ass_eda1$Date,"%d/%m/%Y")

filtered_df = ass_eda1[ass_eda1$Date >= as.Date("2007-02-01") & ass_eda1$Date <= as.Date("2007-02-02"),]

filtered_df$timestamp = strptime(paste(filtered_df$Date,filtered_df$Time),"%Y-%m-%d %H:%M:%S")
dropnames = c("Date","Time")
filtered_df = filtered_df[,!(names(filtered_df) %in% dropnames)]
par(mar = c(4,6,4,2))
hist(filtered_df$Global_active_power,main = "Global Active Power",xlab = "Global Active Power(kilowatts)",col = "red")
#plot(filtered_df$timestamp,filtered_df$Global_active_power,type = "s")
title(main = "Global Active Power")
dev.copy(png,file = "plot1.png")
dev.off()


