library(XML)

setwd("C:/Users/Tom/Dropbox/Fantasy Football 14-15/")

scrape_gameweekhistory<-function(id){
  
  temp<-readHTMLTable(doc=paste("http://fantasy.premierleague.com/entry/",id,"/history/",sep=""),as.data.frame=T,
                      header=T,which=1,
                      colClasses=c("character",
                                   "numeric",
                                   "FormattedNumber",
                                   "numeric",
                                   "numeric",
                                   "character",
                                   "FormattedNumber",
                                   "FormattedNumber"),
                      stringsAsFactors = FALSE)
  
  temp$TV<-(substr(temp$TV,2,nchar(temp$TV)-1))
  temp$TV<-as.numeric(temp$TV)
  
  temp$GW<-substr(temp$GW,9,stop=nchar(temp$GW))
  temp$GW<-as.numeric(temp$GW)
  
  gameweek.html<-htmlTreeParse(paste("http://fantasy.premierleague.com/entry/",id,"/history/",sep=""),useInternal = TRUE)
  
  table<-data.frame(Team=xmlValue(xpathApply(doc = gameweek.html, path = '//h2')[[8]]),Manager=xmlValue(xpathApply(doc = gameweek.html, path = '//h1')[[4]]),temp)
  
  return(table[,1:9])
  
}

ids<-read.table("champions_league.txt")$V1

master<-data.frame()

for( i in 1:length(ids)){
  print(i)
  Sys.sleep(time = 10)
  master<-rbind(master,scrape_gameweekhistory(ids[i]))
}

write.csv(master, "master.csv",row.names=F)

library(RCurl)

ftpUpload("master.csv",to="ftp://people.ex.ac.uk/master.csv", userpwd="tc340:maXwell1864")
