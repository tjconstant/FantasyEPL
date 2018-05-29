ggx<-c(rep(x,2),x.tom,rep(x,6))

ggpoints<-c(table.breast$OP,
  table.chrisfc$OP,
  table.constormfc$OP,
  table.hubbins$OP,
  table.hungover$OP,
  table.leopards$OP,
  table.panda$OP,
  table.pubbandits$OP,
  table.thales$OP)

gggwpoints<-c(table.breast$GP,
            table.chrisfc$GP,
            table.constormfc$GP,
            table.hubbins$GP,
            table.hungover$GP,
            table.leopards$GP,
            table.panda$GP,
            table.pubbandits$GP,
            table.thales$GP)

ggtvalue_extract<-function(table){
  as.numeric(substr(table$TV,start=3,stop=nchar(as.character(table$TV))-1))
}

ggtv<-c(      ggtvalue_extract(table.breast),
              ggtvalue_extract(table.chrisfc),
              ggtvalue_extract(table.constormfc),
              ggtvalue_extract(table.hubbins),
              ggtvalue_extract(table.hungover),
              ggtvalue_extract(table.leopards),
              ggtvalue_extract(table.panda),
              ggtvalue_extract(table.pubbandits),
              ggtvalue_extract(table.thales))

ggnames<-c(rep("breast fc",length(table.breast$OP)),
rep("chris fc",length(table.breast$OP)),
rep("constorm fc",length(table.constormfc$OP)),
rep("hubbins fc",length(table.breast$OP)),
rep("hungover fc",length(table.breast$OP)),
rep("leopards fc",length(table.breast$OP)),
rep("panda fc",length(table.breast$OP)),
rep("pub fc",length(table.breast$OP)),
rep("thales fc",length(table.breast$OP)))

ggtrmade<-c(table.breast$TM,
              table.chrisfc$TM,
              table.constormfc$TM,
              table.hubbins$TM,
              table.hungover$TM,
              table.leopards$TM,
              table.panda$TM,
              table.pubbandits$TM,
              table.thales$TM)

ggmain<-data.frame(week=ggx,names=ggnames,cumpoints=ggpoints,gwpoints=gggwpoints, totalvalue=ggtv*1000000,transfersmade=ggtrmade)

library(ggplot2)
#p<-ggplot(data=ggmain,mapping=aes(x=week,y=cumpoints,color=names,group=names))
#p+geom_point()+stat_smooth(method="glm",fullrange=TRUE)+theme_bw()+xlim(0,38)

q<-ggplot(ggmain,mapping=aes(week,totalvalue,color=names,group=names,size=transfersmade))

filename_string<-paste("plots/TotalValueGW",max(x),".pdf",sep="")
cairo_pdf(filename=filename_string,width=6,pointsize=11,height=4)

q+geom_point()+
  geom_smooth(alpha=0.2)+
  theme_classic()+
  scale_y_continuous(breaks=seq(90,200,1)*1e6,labels=seq(90,200,1))+
  xlab("Gameweek")+ylab("Total Value, £ (millions)")+
  scale_x_continuous(expand=c(0,0.5),breaks=seq(0,38,2))+
  geom_hline(yintercept=100*1e6)

dev.off()

#q<-ggplot(data=ggmain,mapping=aes(x=gwpoints,color=names,group=names))
#q+geom_density(lwd=1.1)+theme_bw()
