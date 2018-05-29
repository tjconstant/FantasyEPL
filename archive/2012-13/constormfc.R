require(XML)

theurl <- "http://fantasy.premierleague.com/entry/2259832/history"
table.constormfc <- readHTMLTable(theurl,header=T,which=1,colClasses=c("character","numeric","numeric","numeric","numeric","character","FormattedNumber","FormattedNumber"))
plot(3:length(table.leopards$OP),table.constormfc$OP)
x.tom<-3:length(table.leopards$OP)

fit.constormfc<-lm(table.constormfc$OP ~ x.tom)
sd.constorm<-sd(table.constormfc$GP)
