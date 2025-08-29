
library(DBI)
library(RMySQL)
library(ggplot2)
library(dplyr)
library(magrittr)
library(scales)


republican_party_primary_polling <- read.csv("Republican_Primary_Polling.csv") 
republican_party_primary_polling$DMY <- as.Date(republican_party_primary_polling$DMY, format="%Y-%m-%d")
republican_party_primary_polling$Sample_Size <- as.numeric(republican_party_primary_polling$Sample_Size,na.rm=TRUE)

democratic_party_primary_polling <- read.csv("Democratic_Primary_Polling.csv")
democratic_party_primary_polling$DMY <- as.Date(democratic_party_primary_polling$DMY, format="%Y-%m-%d")
democratic_party_primary_polling$Sample_Size <- as.numeric(democratic_party_primary_polling$Sample_Size,na.rm=TRUE)

##error in data
democratic_party_primary_polling[73,"Polling"]<-9

democratic_party_primary_polling[78,"Candidate"]<-"Alexandria Ocasio-Cortez"
republican_party_primary_polling[48,"Polling"]<-8
republican_party_primary_polling[86,"Polling"]<-6
republican_party_primary_polling[141,"Polling"]<-31





republican_party_primary_polling<-republican_party_primary_polling[-194,]
republican_party_primary_polling[129,"Polling"]<-3


democratic_party_primary_polling<-democratic_party_primary_polling[-c(227,228,229,230,231,232,233,234),]

democratic_party_primary_polling[299,"Polling"]<-1


democratic_party_primary_polling[262,"Polling"]<-3

tail(democratic_party_primary_polling,10)
tail(republican_party_primary_polling,10)

