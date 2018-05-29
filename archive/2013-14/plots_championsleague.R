library(ggplot2)

# Cumalative Graph
cum_points<-ggplot(master_cl,aes(GW,OP,colour=Team,size=TM))
cum_points+geom_point()+geom_line()+theme_bw()+xlab("Gameweek")+ylab("Total Points")

# Cumalative Graph
cum_points<-ggplot(master_sgc,aes(GW,OP,colour=Team,size=TM))
cum_points+geom_point()+geom_line()+theme_bw()+xlab("Gameweek")+ylab("Total Points")