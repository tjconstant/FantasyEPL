require(XML)

theurl <- "http://fantasy.premierleague.com/entry/1397575/history/"
table.leopards <- readHTMLTable(theurl,header=T,which=1,colClasses=c("character","numeric","numeric","numeric","numeric","character","FormattedNumber","FormattedNumber"))
plot(1:length(table.leopards$OP),table.leopards$OP)
x<-1:length(table.leopards$OP)

fit.leopards<-lm(table.leopards$OP ~ x+0)
