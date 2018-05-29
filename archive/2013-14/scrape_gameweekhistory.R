library(XML)

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
  
  table<-data.frame(Team=team_name(id),temp)
  
  return(table)

}


