x.form<-c((max(x)-4):max(x))

form.breast<-table.breast$OP[(length(table.breast$OP)-4):length(table.breast$OP)]
form.sd.breast<-sd(table.breast$GP[(length(table.breast$GP)-4):length(table.breast$GP)])
form.fit.breast<-lm(form.breast ~ x.form)

form.chrisfc<-table.chrisfc$OP[(length(table.chrisfc$OP)-4):length(table.chrisfc$OP)]
form.sd.chrisfc<-sd(table.chrisfc$GP[(length(table.chrisfc$GP)-4):length(table.chrisfc$GP)])
form.fit.chrisfc<-lm(form.chrisfc ~ x.form)

form.constormfc<-table.constormfc$OP[(length(table.constormfc$OP)-4):length(table.constormfc$OP)]
form.sd.constormfc<-sd(table.constormfc$GP[(length(table.constormfc$GP)-4):length(table.constormfc$GP)])
form.fit.constormfc<-lm(form.constormfc ~ x.form)

form.hubbins<-table.hubbins$OP[(length(table.hubbins$OP)-4):length(table.hubbins$OP)]
form.sd.hubbins<-sd(table.hubbins$GP[(length(table.hubbins$GP)-4):length(table.hubbins$GP)])
form.fit.hubbins<-lm(form.hubbins ~ x.form)

form.hungover<-table.hungover$OP[(length(table.hungover$OP)-4):length(table.hungover$OP)]
form.sd.hungover<-sd(table.hungover$GP[(length(table.hungover$GP)-4):length(table.hungover$GP)])
form.fit.hungover<-lm(form.hungover ~ x.form)

form.leopards<-table.leopards$OP[(length(table.leopards$OP)-4):length(table.leopards$OP)]
form.sd.leopards<-sd(table.leopards$GP[(length(table.leopards$GP)-4):length(table.leopards$GP)])
form.fit.leopards<-lm(form.leopards ~ x.form)

form.panda<-table.panda$OP[(length(table.panda$OP)-4):length(table.panda$OP)]
form.sd.panda<-sd(table.panda$GP[(length(table.panda$GP)-4):length(table.panda$GP)])
form.fit.panda<-lm(form.panda ~ x.form)

form.pubbandits<-table.pubbandits$OP[(length(table.pubbandits$OP)-4):length(table.pubbandits$OP)]
form.sd.pubbandits<-sd(table.pubbandits$GP[(length(table.pubbandits$GP)-4):length(table.pubbandits$GP)])
form.fit.pubbandits<-lm(form.pubbandits ~ x.form)

form.thales<-table.thales$OP[(length(table.thales$OP)-4):length(table.thales$OP)]
form.sd.thales<-sd(table.thales$GP[(length(table.thales$GP)-4):length(table.thales$GP)])
form.fit.thales<-lm(form.thales ~ x.form)

#source("main.R")

#for(plotRun in 1:2){

plotRun<-1
  
  if(plotRun == 1){ cairo_pdf(filename=paste("plots/currentform-extrapgraphGW",max(x),".pdf",sep=""),width=6,height=6)}
#  }
  
  
  gameweek<-max(x)
  x.extrap<-gameweek:38
  
extrap.points<-(c(form.fit.breast$coefficients[1]+form.fit.breast$coefficients[2]*x.extrap,
                           form.fit.chrisfc$coefficients[1]+form.fit.chrisfc$coefficients[2]*x.extrap,
                           form.fit.constormfc$coefficients[1]+form.fit.constormfc$coefficients[2]*x.extrap,
                           form.fit.hubbins$coefficients[1]+form.fit.hubbins$coefficients[2]*x.extrap,
                           form.fit.hungover$coefficients[1]+form.fit.hungover$coefficients[2]*x.extrap,
                           form.fit.leopards$coefficients[1]+form.fit.leopards$coefficients[2]*x.extrap,
                           form.fit.panda$coefficients[1]+form.fit.panda$coefficients[2]*x.extrap,
                           form.fit.pubbandits$coefficients[1]+form.fit.pubbandits$coefficients[2]*x.extrap,
                           form.fit.thales$coefficients[1]+form.fit.thales$coefficients[2]*x.extrap))
  
  plot(NA,NA,
       xlim=range(x.extrap),
       ylim=range(extrap.points),
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
  par(cex=1)
  
  lines(x.extrap,form.fit.breast$coefficients[1]+form.fit.breast$coefficients[2]*x.extrap,col=1,lwd=2)
  lines(x.extrap,form.fit.chrisfc$coefficients[1]+form.fit.chrisfc$coefficients[2]*x.extrap,col=2,lwd=2)
  lines(x.extrap,form.fit.constormfc$coefficients[1]+form.fit.constormfc$coefficients[2]*x.extrap,col=3,lwd=2)
  lines(x.extrap,form.fit.hubbins$coefficients[1]+form.fit.hubbins$coefficients[2]*x.extrap,col=4,lwd=2)
  lines(x.extrap,form.fit.hungover$coefficients[1]+form.fit.hungover$coefficients[2]*x.extrap,col=5,lwd=2)
  lines(x.extrap,form.fit.leopards$coefficients[1]+form.fit.leopards$coefficients[2]*x.extrap,col=6,lwd=2)
  lines(x.extrap,form.fit.panda$coefficients[1]+form.fit.panda$coefficients[2]*x.extrap,col=7,lwd=2)
  lines(x.extrap,form.fit.pubbandits$coefficients[1]+form.fit.pubbandits$coefficients[2]*x.extrap,col=8,lwd=2)
  lines(x.extrap,form.fit.thales$coefficients[1]+form.fit.thales$coefficients[2]*x.extrap,col=9,lwd=2)
  legend(gameweek+gameweek*0.04,max(extrap.points)-max(extrap.points)*0.04,
         c("Breast Homage FC","Chris FC","Constorm FC","Hubbins","Hungover","Leopards","Panda","Pub Bandits","Thales"),
         lty=1,lwd=2,col=1:9,ce=0.75)
  
  #lines(rep(length(table.leopards$OP,2)),c(0,max.extrap.points))
  
  alpha=0.2
  
  errorbands<-function(table,fit,gameweek,...){
    sd.table<-sd(table$GP[(length(table$GP)-4):length(table$GP)])
    polygon(c(gameweek,38,38),c(fit$coefficients[1]+fit$coefficients[2]*gameweek,((38-gameweek)*(sd.table))+(fit$coefficients[1]+38*(fit$coefficients[2])),-((38-gameweek)*(sd.table))+fit$coefficients[1]+38*fit$coefficients[2]),...)
  }
  errorbands(table.breast,form.fit.breast,gameweek,col=rgb(0,0,0,alpha),border=NA)
  errorbands(table.chrisfc,form.fit.chrisfc,gameweek,col=rgb(1,0,0,alpha),border=NA)
  
  #errorbands(table.constormfc,fit.constormfc,gameweek,col=rgb(0,1,0,alpha),border=NA)
  polygon(c(gameweek,38,38),c((form.fit.constormfc$coefficients[1]+form.fit.constormfc$coefficients[2]*gameweek),((38-gameweek)*(sd(table.constormfc$GP)))+((form.fit.constormfc$coefficients[1]+form.fit.constormfc$coefficients[2]*38)),-((38-gameweek)*(sd(table.constormfc$GP)))+(fit.constormfc$coefficients[1]+fit.constormfc$coefficients[2]*38)),col=rgb(0,1,0,alpha),border=NA)
  
  errorbands(table.hubbins,form.fit.hubbins,gameweek,col=rgb(0,0,1,alpha),border=NA)
  errorbands(table.hungover,form.fit.hungover,gameweek,col=rgb(0,1,1,alpha),border=NA)
  errorbands(table.leopards,form.fit.leopards,gameweek,col=rgb(1,0,1,alpha),border=NA)
  errorbands(table.panda,form.fit.panda,gameweek,col=rgb(1,1,0,alpha),border=NA)
  errorbands(table.pubbandits,form.fit.pubbandits,gameweek,col=rgb(0.84,0.84,0.84,alpha),border=NA)
  errorbands(table.thales,form.fit.thales,gameweek,col=rgb(0,0,0,alpha),border=NA)
  
  title("Current Form (Last 5 Games) Extrapolation")
  lines(c(gameweek,gameweek),c(0,4000),lty=2)
  text(gameweek,250,"Current Gameweek",pos=4);points(gameweek,250,pch=16)
  
  if(plotRun == 1){ dev.off()}


#for(plotRun in 1:2){

plotRun<-1
  
  if(plotRun == 1){cairo_pdf(filename=paste("plots/current-form-ProbabilityDensityGW",max(x),".pdf",sep=""),width=6,height=4,pointsize=11)}
  
  x.norm<-seq(0,5000,,5000)
  plot(NA,NA,xlim=range(900,3000),ylim=c(0,0.050),xaxs="i",yaxs="i",
       xlab="Predicted total points on gameweek 38",ylab="Probability Density")
  
  gauss.plot<-function(table,fit,...){
    polygon(x.norm,dnorm(x.norm,mean=fit$coefficients[1]+fit$coefficients[2]*38,(38-gameweek)*sd(table$GP[(length(table$GP)-4):length(table$GP)])),...)
  }
  
  gauss.plot(table.thales,form.fit.thales,col=rgb(0,0,0,alpha),border=9)
  gauss.plot(table.breast,form.fit.breast,col=rgb(0,0,0,alpha),border=1)
  gauss.plot(table.chrisfc,form.fit.chrisfc,col=rgb(1,0,0,alpha),border=2)
  
  table<-table.constormfc
  fit<-form.fit.constormfc
  polygon(x.norm,dnorm(x.norm,mean=fit$coefficients[1]+fit$coefficients[2]*38,(38-gameweek)*sd(table$GP[(length(table$GP)-4):length(table$GP)])),col=rgb(0,1,0,alpha),border=3)
  gauss.plot(table.hubbins,form.fit.hubbins,col=rgb(0,0,1,alpha),border=4)
  gauss.plot(table.hungover,form.fit.hungover,col=rgb(0,1,1,alpha),border=5)
  gauss.plot(table.leopards,form.fit.leopards,col=rgb(1,0,1,alpha),border=6)
  gauss.plot(table.panda,form.fit.panda,col=rgb(1,1,0,alpha),border=7)
  gauss.plot(table.pubbandits,form.fit.pubbandits,col=rgb(0.84,0.84,0.84,alpha),border=8)
  
  
  legend(2450,0.02995+0.001,
         c("Breast Homage FC","Chris FC","Constorm FC","Hubbins","Hungover","Leopards","Panda","Pub Bandits","Thales"),
         lty=1,lwd=2,col=1:9,ce=0.6)
  
  title("Current Form (Last 5 Games) Probability Densities")
  
  if(plotRun == 1){ dev.off()}

