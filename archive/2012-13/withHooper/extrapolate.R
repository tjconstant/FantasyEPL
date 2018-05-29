#source("main.R")

for(plotRun in 1:2){
  
if(plotRun == 2){ cairo_pdf(filename=paste("withHooper/plots/extrapgraphGW",max(x),".pdf",sep=""),width=6,height=6)
}

x.extrap<-1:38
gameweek<-max(x)

max.extrap.points<-max(c(fit.breast$coefficients[1]*x.extrap,
                         fit.chrisfc$coefficients[1]*x.extrap,
                         fit.constormfc$coefficients[1]+fit.constormfc$coefficients[2]*x.extrap,
                         fit.hubbins$coefficients[1]*x.extrap,
                         fit.hungover$coefficients[1]*x.extrap,
                         fit.leopards$coefficients[1]*x.extrap,
                         fit.panda$coefficients[1]*x.extrap,
                         fit.pubbandits$coefficients[1]*x.extrap,
                         fit.thales$coefficients[1]*x.extrap,
                         fit.hooper$coefficients[1]*x.extrap))

plot(NA,NA,
     xlim=range(x.extrap),
     ylim=c(0,max.extrap.points),
     #xlim=c(30,38),ylim=c(1400,2000),
     xaxs="i",yaxs="i",
     xlab="Gameweek",ylab="Points")
grid()

par(cex=0.5)
points(x,table.breast$OP,pch=16,col=1)
points(x,table.chrisfc$OP,pch=16,col=2)
points(x.tom,table.constormfc$OP,pch=16,col=3)
points(x,table.hubbins$OP,pch=16,col=4)
points(x,table.hungover$OP,pch=16,col=5)
points(x,table.leopards$OP,pch=16,col=6)
points(x,table.panda$OP,pch=16,col=7)
points(x,table.pubbandits$OP,pch=16,col=8)
points(x,table.thales$OP,pch=16,col=9)
points(x,table.hooper$OP,pch=16,col=10)
par(cex=1)
  
lines(x.extrap,fit.breast$coefficients[1]*x.extrap,col=1,lwd=2)
lines(x.extrap,fit.chrisfc$coefficients[1]*x.extrap,col=2,lwd=2)
lines(x.extrap,fit.constormfc$coefficients[1]+fit.constormfc$coefficients[2]*x.extrap,col=3,lwd=2)
lines(x.extrap,fit.hubbins$coefficients[1]*x.extrap,col=4,lwd=2)
lines(x.extrap,fit.hungover$coefficients[1]*x.extrap,col=5,lwd=2)
lines(x.extrap,fit.leopards$coefficients[1]*x.extrap,col=6,lwd=2)
lines(x.extrap,fit.panda$coefficients[1]*x.extrap,col=7,lwd=2)
lines(x.extrap,fit.pubbandits$coefficients[1]*x.extrap,col=8,lwd=2)
lines(x.extrap,fit.thales$coefficients[1]*x.extrap,col=9,lwd=2)
lines(x.extrap,fit.hooper$coefficients[1]*x.extrap,col=10,lwd=2)
legend(2,1850,
       c("Breast Homage FC","Chris FC","Constorm FC","Hubbins","Hungover","Leopards","Panda","Pub Bandits","Thales","Hooper"),
       lty=1,lwd=2,col=1:10,ce=0.75)

#lines(rep(length(table.leopards$OP,2)),c(0,max.extrap.points))

alpha=0.2

errorbands<-function(table,fit,gameweek,...){
  sd.table<-sd(table$GP)
  polygon(c(gameweek,38,38),c(fit$coefficients[1]*gameweek,((38-gameweek)*(sd.table))+(38*fit$coefficients[1]),-((38-gameweek)*(sd.table))+38*fit$coefficients[1]),...)
}
errorbands(table.breast,fit.breast,gameweek,col=rgb(0,0,0,alpha),border=NA)
errorbands(table.chrisfc,fit.chrisfc,gameweek,col=rgb(1,0,0,alpha),border=NA)

#errorbands(table.constormfc,fit.constormfc,gameweek,col=rgb(0,1,0,alpha),border=NA)
polygon(c(gameweek,38,38),c((fit.constormfc$coefficients[1]+fit.constormfc$coefficients[2]*gameweek),((38-gameweek)*(sd(table.constormfc$GP)))+((fit.constormfc$coefficients[1]+fit.constormfc$coefficients[2]*38)),-((38-gameweek)*(sd(table.constormfc$GP)))+(fit.constormfc$coefficients[1]+fit.constormfc$coefficients[2]*38)),col=rgb(0,1,0,alpha),border=NA)

errorbands(table.hubbins,fit.hubbins,gameweek,col=rgb(0,0,1,alpha),border=NA)
errorbands(table.hungover,fit.hungover,gameweek,col=rgb(0,1,1,alpha),border=NA)
errorbands(table.leopards,fit.leopards,gameweek,col=rgb(1,0,1,alpha),border=NA)
errorbands(table.panda,fit.panda,gameweek,col=rgb(1,1,0,alpha),border=NA)
errorbands(table.pubbandits,fit.pubbandits,gameweek,col=rgb(0.84,0.84,0.84,alpha),border=NA)
errorbands(table.thales,fit.thales,gameweek,col=rgb(0,0,0,alpha),border=NA)
errorbands(table.hooper,fit.hooper,gameweek,col=rgb(1,0,0,alpha),border=NA)

#title("Fantasy Football 2012/13")
lines(c(gameweek,gameweek),c(0,4000),lty=2)
text(gameweek,250,"Current Gameweek",pos=2);points(gameweek,250,pch=16)

if(plotRun == 2){ dev.off()}
}
