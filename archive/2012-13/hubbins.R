require(XML)

theurl <- "http://fantasy.premierleague.com/entry/614791/history/"
table.hubbins <- readHTMLTable(theurl,header=T,which=1,colClasses=c("character","numeric","numeric","numeric","numeric","character","FormattedNumber","FormattedNumber"))
plot(1:length(table.leopards$OP),table.hubbins$OP)
x<-1:length(table.leopards$OP)

fit.hubbins<-lm(table.hubbins$OP ~ x +0)
