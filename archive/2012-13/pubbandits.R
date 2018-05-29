require(XML)

theurl <- "http://fantasy.premierleague.com/entry/1568010/history/"
table.pubbandits <- readHTMLTable(theurl,header=T,which=1,colClasses=c("character","numeric","numeric","numeric","numeric","character","FormattedNumber","FormattedNumber"))
plot(1:length(table.leopards$OP),table.pubbandits$OP)
x<-1:length(table.leopards$OP)

fit.pubbandits<-lm(table.pubbandits$OP ~ x+0)
