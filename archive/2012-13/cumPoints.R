
#for(plotRun in 1:2){

plotRun<-2
  
  if(plotRun == 2){
cairo_pdf(filename=paste("plots/cumGraphGW",max(x),".pdf",sep=""),width=6,height=6)
  }

maximum.points<-max(c(table.breast$OP,table.chrisfc$OP,table.constormfc$OP,table.hubbins$OP,table.hungover$OP,table.leopards$OP,table.panda$OP,table.pubbandits$OP,table.thales$OP),na.rm=T)
minimum.points<-min(c(table.breast$OP,table.chrisfc$OP,table.constormfc$OP,table.hubbins$OP,table.hungover$OP,table.leopards$OP,table.panda$OP,table.pubbandits$OP,table.thales$OP),na.rm=T)

plot(NA,NA,xlim=range(x),ylim=c(minimum.points,maximum.points),
     xlab="Gameweek",
     ylab="Points")
grid()


points(x,table.chrisfc$OP,pch=16,col=2);lines(x,table.chrisfc$OP,col=2)
points(x.tom,table.constormfc$OP,pch=16,col=3);lines(x.tom,table.constormfc$OP,col=3)
points(x,table.hubbins$OP,pch=16,col=4);lines(x,table.hubbins$OP,col=4)
points(x,table.hungover$OP,pch=16,col=5);lines(x,table.hungover$OP,col=5)
points(x,table.leopards$OP,pch=16,col=6);lines(x,table.leopards$OP,col=6)
points(x,table.panda$OP,pch=16,col=7);lines(x,table.panda$OP,col=7)
points(x,table.pubbandits$OP,pch=16,col=8);lines(x,table.pubbandits$OP,col=8)
points(x,table.thales$OP,pch=16,col=9);lines(x,table.thales$OP,col=9)
points(x,table.breast$OP,pch=16,col=1);lines(x,table.breast$OP,col=1)

legend(1,maximum.points,
       c("Breast Homage FC","Chris FC","Constorm FC","Hubbins","Hungover","Leopards","Panda","Pub Bandits","Thales"),
       lty=1,lwd=2,col=1:9,ce=0.75)

  if(plotRun == 2){ dev.off()}
  
#}