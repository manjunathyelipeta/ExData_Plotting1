ass_eda1 = read.table("household_power_consumption.txt",header = TRUE,sep = ';',stringsAsFactors = FALSE,colClasses = c(rep("character",2),rep("numeric",7)),na.strings = "?")


ass_eda1$Date = as.Date(ass_eda1$Date,"%d/%m/%Y")

filtered_df = ass_eda1[ass_eda1$Date >= as.Date("2007-02-01") & ass_eda1$Date <= as.Date("2007-02-02"),]

filtered_df$timestamp = strptime(paste(filtered_df$Date,filtered_df$Time),"%Y-%m-%d %H:%M:%S")
dropnames = c("Date","Time")
filtered_df = filtered_df[,!(names(filtered_df) %in% dropnames)]

plot(filtered_df$timestamp,filtered_df$Sub_metering_1,type = "n",ylab = "Energy Sub Metering" ,xlab = "", mar = c(4,3,2,4))
lines(filtered_df$timestamp,filtered_df$Sub_metering_2,col = "red")
lines(filtered_df$timestamp,filtered_df$Sub_metering_3,col = "blue")
lines(filtered_df$timestamp,filtered_df$Sub_metering_1,col = "black")
legend("topright", col = c("black", "red","blue"), legend = c("Sub_metering1", "Sub_metering2","Sub_metering3"),lty = c(1,1))
dev.copy(png,file = "plot3.png")
dev.off()