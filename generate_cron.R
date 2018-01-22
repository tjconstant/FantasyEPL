dates <- c()
date <- read_json(paste0("https://fantasy.premierleague.com/drf/fixtures/", 1), simplifyVector = T)

dates <- date$kickoff_time

library(lubridate)

dates <- as_datetime(
  sub(sub(dates, pattern = "T", replacement = ""),
      pattern = "Z", replacement = "GMT")
)


dates <- c(dates, dates+3601, dates + 3600*2)

command <- "cd /var/www/html/FantasyEPL/ && R CMD BATCH generate_all.R"

crons <- 
  unique(
    c(
      paste(minute(dates),hour(dates),day(dates),month(dates),"*",year(dates),command),
      paste("1 0 ",day(dates)+1,month(dates),"*",year(dates),command),
      paste("1 4 ",day(dates)+1,month(dates),"*",year(dates),command)
    )
  )

write.table(x = crons, file = "crons.txt", row.names =  FALSE, quote = FALSE, col.names = FALSE)
