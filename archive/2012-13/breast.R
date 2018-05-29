require(XML)

theurl <- "http://fantasy.premierleague.com/entry/740255/history/"
table.breast <- readHTMLTable(theurl,header=T,which=1,colClasses=c("character","numeric","numeric","numeric","numeric","character","FormattedNumber","FormattedNumber"))
plot(1:length(table.leopards$OP),table.breast$OP)
x<-1:length(table.leopards$OP)

fit.breast<-lm(table.breast$OP ~ x+0)
