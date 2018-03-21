library(tidyverse)
library(jsonlite)

tbl_player_names <- read_json( "https://fantasy.premierleague.com/drf/bootstrap-static", simplifyVector = T)$elements

tbl_history <- tibble()
for(i in 1:length(tbl_player_names$id)){
  tbl_history <- rbind(tbl_history, 
                       {read_json(paste0("https://fantasy.premierleague.com/drf/element-summary/",i), simplifyVector = T)$history %>% 
  mutate(player_id = i)})
}

tbl <- 
  tbl_history %>%
  full_join(tbl_player_names, by = c("player_id" = "id"))

a <- rep('red2', 90)
a[45:60] <- 'orange'
a[60:90] <- 'green3'

team_id <- 5

tbl %>%
  subset(team == team_id) %>%
  filter(minutes.x > 0) %>%
  ggplot(aes(round, web_name, fill = minutes.x)) + 
  geom_tile(colour = 'black') + 
  facet_grid(element_type~., space = "free", scales = "free") + 
  scale_fill_gradientn(colours = a) + coord_cartesian(expand = F) +
  theme_bw() + 
  geom_point(data = subset(tbl, team == team_id & goals_scored.x > 0), aes(colour = goals_scored.x))


