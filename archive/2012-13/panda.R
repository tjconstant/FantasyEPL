require(XML)

theurl <- "http://fantasy.premierleague.com/entry/1314463/history/"
table.panda <- readHTMLTable(theurl,header=T,which=1,colClasses=c("character","numeric","numeric","numeric","numeric","character","FormattedNumber","FormattedNumber"))
plot(1:length(table.leopards$OP),table.panda$OP)
x<-1:length(table.leopards$OP)

fit.panda<-lm(table.panda$OP ~ x+0)
