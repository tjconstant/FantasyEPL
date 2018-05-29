require(XML)

theurl <- "http://fantasy.premierleague.com/entry/1395231/history/"
table.thales <- readHTMLTable(theurl,header=T,which=1,colClasses=c("character","numeric","numeric","numeric","numeric","character","FormattedNumber","FormattedNumber"))
plot(1:length(table.leopards$OP),table.thales$OP)
x<-1:length(table.leopards$OP)

fit.thales<-lm(table.thales$OP ~ x+0)
