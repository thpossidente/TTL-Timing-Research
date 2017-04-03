
data.original <- read.table("C:/Users/research/Desktop/BBTKTestData/TTLandAudio30min.txt", header=F, fill = T, col.names = c("TTL Onset", "TTL Offset", "TTL Duration", "Mic Onset", "Mic Offset", "Mic Duration"), dec='.', skip=1)
data <- data.original[-c(34,35,41,42,60,61),]
data$TTL.Onset <- as.numeric(gsub(',', '', data$TTL.Onset))
data$TTL.Offset <- as.numeric(gsub(',', '', data$TTL.Offset))
data$TTL.Duration <- as.numeric(gsub(',', '', data$TTL.Duration))
data$Mic.Onset <- as.numeric(gsub(',', '', data$Mic.Onset))
data$Mic.Offset <- as.numeric(gsub(',', '', data$Mic.Offset))
data$TMic.Duration <- as.numeric(gsub(',', '', data$Mic.Duration))

if(data$TTL.Onset[1] - data$Mic.Onset[1] > 0){
  for(i in 1:nrow(data)){
    data$Delay[i] <- data$Mic.Onset[i + 1] - data$TTL.Onset[i]
  }
} else{
  for(h in 1:nrow(data)){
    data$Delay[h] <- data$Mic.Onset[h] - data$TTL.Onset[h]
  }
}

hist(data$Delay, main = "Frequency Distribution of Time Offset Between TTL and Mic Sensor", xlab = "Offest Times (ms)", breaks = 15, xlim=c(45,75))
hist(data$Delay, main = "Porbability Density of Time Offset Between TTL and Mic Sensor", xlab = "Offest Times (ms)", breaks = 15, prob = T, xlim=c(45,75))
lines(density(data$Delay, na.rm=T))


