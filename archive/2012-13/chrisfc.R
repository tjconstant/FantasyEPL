require(XML)

theurl <- "http://fantasy.premierleague.com/entry/1457665/history/"
table.chrisfc <- readHTMLTable(theurl,header=T,which=1,colClasses=c("character","numeric","numeric","numeric","numeric","character","FormattedNumber","FormattedNumber"))
plot(1:length(table.leopards$OP),table.chrisfc$OP)
x<-1:length(table.leopards$OP)

fit.chrisfc<-lm(table.chrisfc$OP ~ x+0)
