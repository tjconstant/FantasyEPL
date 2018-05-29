require(XML)

theurl <- "http://fantasy.premierleague.com/entry/1527373/history/"
table.hungover <- readHTMLTable(theurl,header=T,which=1,colClasses=c("character","numeric","numeric","numeric","numeric","character","FormattedNumber","FormattedNumber"))
plot(1:length(table.leopards$OP),table.hungover$OP)
x<-1:length(table.leopards$OP)

fit.hungover<-lm(table.hungover$OP ~ x+0)