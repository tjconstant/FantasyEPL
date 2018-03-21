library(tidyverse)
library(jsonlite)

tbl_player_names <- read_json( "https://fantasy.premierleague.com/drf/bootstrap-static", simplifyVector = T)$elements

tbl_history <- tibble()
for(i in 1:length(tbl_player_names$id)){
  tbl_history <- rbind(tbl_history, 
                       {read_json(paste0("https://fantasy.premierleague.com/drf/element-summary/",i), simplifyVector = T)$history %>% 
  mutate(player_id = i)})
}

tbl_team_ids <- 
  tibble(
    team_name = c(
      "Arsenal",
      "Bournemouth",
      "Brighton",
      "Burnley",
      "Chelsea",
      "Crystal Palace",
      "Everton",
      "Huddersfield",
      "Leicester",
      "Liverpool",
      "Man City",
      "Man Utd",
      "Newcastle",
      "Southampton",
      "Spurs",
      "Stoke",
      "Swansea",
      "Watford",
      "West Brom",
      "West Ham"),
    team = 1:20
  )

tbl <- 
  tbl_history %>%
  full_join(tbl_player_names, by = c("player_id" = "id")) %>%
  full_join(tbl_team_ids)

a <- rep('red2', 90)
a[45:60] <- 'orange'
a[60:90] <- 'green3'

tbl$element_type <- factor(tbl$element_type, labels = c("Keeper", "Defender" ,"Midfielder", "Forward"))

for(team_id in 1:20){
  
  tbl_team <- subset(tbl, team == team_id)
  
  p<-
    tbl_team %>%
    filter(minutes.x > 0) %>%
    mutate(web_name = fct_reorder(web_name, minutes.x)) %>%
    ggplot(aes(round, web_name, fill = minutes.x)) +
    geom_tile(colour = 'black') + 
    facet_grid(element_type~., space = "free", scales = "free") + 
    scale_fill_gradientn(colours = a, name = "Minutes Played") + 
    coord_cartesian(expand = F) +
    theme_bw() + 
    geom_text(data = subset(tbl_team, goals_scored.x > 0), aes(label = goals_scored.x), nudge_x = 0.2, nudge_y = -0.2, size = 2.5) + 
    geom_text(data = subset(tbl_team, total_points.x != 0), aes(label = total_points.x), nudge_x = -0.2, nudge_y = 0.2, size = 2.5) +
    ylab("") + xlab("Gameweek") + 
    scale_x_continuous(breaks = function(x) (x[1]:x[2])+0.5) +
    ggtitle(unique(tbl_team$team_name))
  
  fig.width <- 1100/100
  fig.height <- 700/100
  
  svg(filename = paste0("./player_history/",unique(tbl_team$team_name),".svg"), width = fig.width, height = fig.height)
  print(p)
  dev.off()
}
