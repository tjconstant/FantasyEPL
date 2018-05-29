#player_history<-scrape_playerhistory(1)


total_cards<-data.frame()

for(n in name_table[1:9,1]){
  temp.df<-data.frame(Team=n,cards=sum(subset(player_history,Team==n)$YC)+3*sum(subset(player_history,Team==n)$RC))
  total_cards<-rbind(total_cards,temp.df)
}

p<-ggplot(total_cards,aes(factor(1),cards,fill=Team))
p+geom_bar()+coord_polar(theta="y")+
  theme_minimal()+
  xlab('')+
  ylab('')+
  labs(fill='Team')+ theme(axis.ticks = element_blank(), 
                           axis.text.y = element_blank(),
                           axis.text.x = element_blank()) +ggtitle("Dirty Bastard Chart (Card Deductions)")

total_cards<-data.frame()

for(n in name_table[c(5,10:13),1]){
  temp.df<-data.frame(Team=n,cards=sum(subset(player_history,Team==n)$YC)+3*sum(subset(player_history,Team==n)$RC))
  total_cards<-rbind(total_cards,temp.df)
}

p<-ggplot(total_cards,aes(factor(1),cards,fill=Team))
p+geom_bar()+coord_polar(theta="y")+
  theme_minimal()+
  xlab('')+
  ylab('')+
  labs(fill='Team')+ theme(axis.ticks = element_blank(), 
                           axis.text.y = element_blank(),
                           axis.text.x = element_blank()) +ggtitle("Dirty Bastard Chart (Card Deductions)")