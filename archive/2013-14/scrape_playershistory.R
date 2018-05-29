scrape_playerhistory<-function(GW){

player_history<-data.frame()

for(i in as.numeric(name_table[,2])){
  for(j in GW){
    
temp<-data.frame(Team=team_name(i), GW=j,
                 readHTMLTable(paste("http://fantasy.premierleague.com/entry/",i,"/event-history/",j,sep=""),
                               which=1,stringsAsFactors = FALSE, 
                               colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
                           ))
 names(temp)<-c("Team","GW","Player","Icon","MP","GS","A","CS","GC","OG","PS","PM","YC","RC","S","B","ESP","BPS","TP")

 player_history<-rbind(player_history,temp)

  }
}

return(player_history)
}



