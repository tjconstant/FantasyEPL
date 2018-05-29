
  
require(XML)

theurl <- "http://fantasy.premierleague.com/entry/195231/history/"
table.hooper <- readHTMLTable(theurl,header=T,which=1,colClasses=c("character","numeric","numeric","numeric","numeric","character","FormattedNumber","FormattedNumber"))


fit.hooper<-lm(table.hooper$OP ~ x+0)