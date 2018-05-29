library(XML)

reload.data<-T

team.names<-data.frame(name=c("Breast Homage Albion","The Leopards","The St Hubbins XI",
                              "Pandamonium FC","Hungover 96","Chris FC","Pub Bandits","Constorm FC","Wooden Spoon Fc"),
                       number=c(740255,1397575,614791,1314463,1527373,1457665,1568010,2259832,1395231))

if(reload.data){
  
  players <- data.frame(t(rep(NA,7)))
  names(players) <- c("team","week","players","MP","GS","A","TP")
  players <- players[-1,]

  for(j in 1:length(team.names$number)){
   for(i in 1:37){
      if(!(i<3 & j==8)){
        theurl <- paste("http://fantasy.premierleague.com/entry/",as.character(team.names$number[j]),"/event-history/",i,"/",sep="")
        team.week <- readHTMLTable(theurl,header=T,which=1)
    
        players.week<-data.frame(team=rep(team.names$name[j],15),
                                 week=rep(i,15),
                                 players=as.character(team.week[,1]),
                                 MP=as.numeric(as.character(team.week[,3])),
                                 GS=as.numeric(as.character(team.week[,4])),
                                 A=as.numeric(as.character(team.week[,5])),
                                 TP=as.numeric(as.character(team.week[,16]))
                                 #POS=player.info(as.character(team.week[,1]))$position,
                                 #TEAM=player.info(as.character(team.week[,1]))$team
                                 )
        players<-rbind(players,players.week)
      }
    }
  }
  
}


playercount <- data.frame(t(rep(NA,2)))
names(playercount) <- c("week","unique_players")
playercount <- playercount[-1,]

for(i in 3:37){
playercount<-rbind(playercount,data.frame(week=i,unique_players=length(unique(subset(players,week==i)$players))))
}

library(ggplot2)
p<-ggplot(playercount,aes(week,unique_players))
p+geom_point()+geom_smooth()+theme_bw()


p<-ggplot(subset(players,team=="Constorm FC"),aes(week,players,color=team,size=TP,alpha=MP))
p+geom_point()+scale_alpha(limits=c(0,90),breaks=seq(0,90,30))+theme_bw()+scale_size_continuous()+facet_grid(.~team)


