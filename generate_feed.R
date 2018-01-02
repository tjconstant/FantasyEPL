library(jsonlite)

league <- read_json("https://fantasy.premierleague.com/drf/leagues-classic-standings/682443")

words <- 
paste("In first place,", league$standings$results[[1]]$player_name,
      "followed in second place by,", league$standings$results[[2]]$player_name,
      ". In third place,", league$standings$results[[3]]$player_name,
      "whilst in fourth place,", league$standings$results[[4]]$player_name,
      "and finally, in last place,", league$standings$results[[5]]$player_name)

write_json(
data.frame(
  uid = 1,
  updateDate = paste0(Sys.Date(),"T20:00:00.0Z"),
  titleText = "FF",
  mainText = words,
  redirectionUrl = "github.com/tjconstant"),
path = "feed.json")
