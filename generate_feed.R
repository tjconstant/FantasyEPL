library(jsonlite)

league <- read_json("https://fantasy.premierleague.com/drf/leagues-classic-standings/682443")

movement <- function(move){
  
  if(move = "same") response <- "Still in"
  if(move = "up") response <- "moving up this week"
  if(move = "down") response <- "falling this week"
  
  return(response)
}

words <- 
paste("In first place,", league$standings$results[[1]]$player_name, ", scoring", league$standings$results[[1]]$event_total, "points this week.", 
      "followed in second place by,", league$standings$results[[2]]$player_name, "with", league$standings$results[[2]]$event_total, "points this week.", 
      ". In third place,", league$standings$results[[3]]$player_name, "with", league$standings$results[[3]]$event_total, "points this week.", 
      "whilst in fourth place,", league$standings$results[[4]]$player_name, "with", league$standings$results[[4]]$event_total, "points this week.", 
      "and finally, in last place,", league$standings$results[[5]]$player_name, "with", league$standings$results[[5]]$event_total, "points this week.") 

write_json(
data.frame(
  uid = 1,
  updateDate = paste0(Sys.Date(),"T20:00:00.0Z"),
  titleText = "FF",
  mainText = words,
  redirectionUrl = "github.com/tjconstant"),
path = "feed.json")
