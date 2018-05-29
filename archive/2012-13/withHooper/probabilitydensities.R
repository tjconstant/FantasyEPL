for(plotRun in 1:2){
  
  if(plotRun == 2){cairo_pdf(filename=paste("withHooper/plots/ProbabilityDensityGW",max(x),".pdf",sep=""),width=6,height=4,pointsize=11)}

x.norm<-seq(0,5000,,5000)
plot(NA,NA,xlim=range(1000,2500),ylim=c(0,0.005),xaxs="i",yaxs="i",
     xlab="Predicted total points on gameweek 38",ylab="Probability Density")

gauss.plot<-function(table,fit,...){
polygon(x.norm,dnorm(x.norm,mean=fit$coefficients[1]*38,(38-gameweek)*sd(table$GP)),...)
}

gauss.plot(table.thales,fit.thales,col=rgb(0,0,0,alpha),border=9)
gauss.plot(table.breast,fit.breast,col=rgb(0,0,0,alpha),border=1)
gauss.plot(table.chrisfc,fit.chrisfc,col=rgb(1,0,0,alpha),border=2)

table<-table.constormfc
fit<-fit.constormfc
polygon(x.norm,dnorm(x.norm,mean=fit$coefficients[1]+fit$coefficients[2]*38,(38-gameweek)*sd(table$GP)),col=rgb(0,1,0,alpha),border=3)

gauss.plot(table.hubbins,fit.hubbins,col=rgb(0,0,1,alpha),border=4)
gauss.plot(table.hungover,fit.hungover,col=rgb(0,1,1,alpha),border=5)
gauss.plot(table.leopards,fit.leopards,col=rgb(1,0,1,alpha),border=6)
gauss.plot(table.panda,fit.panda,col=rgb(1,1,0,alpha),border=7)
gauss.plot(table.pubbandits,fit.pubbandits,col=rgb(0.84,0.84,0.84,alpha),border=8)
gauss.plot(table.hooper,fit.hooper,col=rgb(1,0,0,alpha),border=10)


legend(2150,0.00410,
       c("Breast Homage FC","Chris FC","Constorm FC","Hubbins","Hungover","Leopards","Panda","Pub Bandits","Thales","Hooper"),
       lty=1,lwd=2,col=1:10,ce=0.6)
  box()

  if(plotRun == 2){ dev.off()}
}








