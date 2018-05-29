library(ggplot2)

#cairo_pdf(filename="plots/betterplots.pdf",onefile=T)
cump<-ggplot(ggmain,aes(week,cumpoints,colour=names,fill=names))+theme_bw()

cump+geom_point()+geom_line()+ggtitle("Cumalative Points")

cump+geom_point()+stat_smooth()+ggtitle("Cumalative Points") #cumalative point graph

cump+geom_point()+stat_smooth(method='lm',fullrange=TRUE)+
  xlim(0,38)+ggtitle("Extrapolation (Full Season)") #exptrapolation

cump+geom_point()+stat_smooth(method='lm',fullrange=TRUE)+
  xlim(max(x)-5,38)+ylim(1000,2100)+ggtitle("Extrapolation (Last 5 Games)") #exptrap - rectn form

dens<-ggplot(ggmain,aes(gwpoints,colour=names,fill=names))+theme_bw()
dens+geom_density(alpha=0.5)+facet_grid(names~.)+ggtitle("Probability Density  (Full Season)")

dens<-ggplot(subset(ggmain,week>max(x)-7),aes(gwpoints,colour=names,fill=names))+theme_bw()
dens+geom_density(alpha=0.5)+facet_grid(names~.)+ggtitle("Probability Density (Last 5 Games)")

highest<-c()
for(i in 1:max(x)){
  highest<-c(highest,(as.character((subset(ggmain,week==i)$names[
    which(subset(ggmain,week==i)$gwpoints==max(subset(ggmain,week==i)$gwpoints))]))))
}
qplot(highest,xlab="name",ylab="gameweek wins")+theme_bw()+ggtitle("Golden Boot")

lowest<-c()
for(i in 1:max(x)){
  lowest<-c(lowest,(as.character((subset(ggmain,week==i)$names[
    which(subset(ggmain,week==i)$gwpoints==min(subset(ggmain,week==i)$gwpoints))]))))
}
qplot(lowest,xlab="name",ylab="gameweek losses")+theme_bw()+ggtitle("Wooden Boot")

q<-ggplot(ggmain,mapping=aes(week,totalvalue,color=names,group=names,size=transfersmade))
q+geom_point()+
  geom_smooth(alpha=0.2)+
  theme_classic()+
  scale_y_continuous(breaks=seq(90,200,1)*1e6,labels=seq(90,200,1))+
  xlab("Gameweek")+ylab("Total Value, £ (millions)")+
  scale_x_continuous(expand=c(0,0.5),breaks=seq(0,38,2))+
  geom_hline(yintercept=100*1e6)

#dev.off()