

dream_team<-data.frame()
for(j in 1:current_gameweek){
  for(i in name_table[,1]){
    
    expt<-player_history[player_history$Team == i & player_history$GW==j,]
    
    
    dt<-arrange(expt,-TP)
    
    dt[1,19]<-dt[1,19]*2 #Extra Points for Captain
    
    tempdf<-data.frame(Team=i,GW=j,TP=sum(dt$TP[1:11]))
    dream_team<-rbind(dream_team,tempdf)
  }
}

p<-ggplot(dream_team,aes(GW,TP,color=Team))
p+geom_point()+theme_bw()+ggtitle("Dream Team Results: Cumalative Score")