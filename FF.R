library(jsonlite)
library(ggplot2)
theme_set(theme_bw())

players <- c(378067,2938617,1309360,386429,376149) # Tom C, Tom G, Ben, Ian, Gareth

all <- data.frame()

for(id in players){
  
  history <- read_json(paste0("https://fantasy.premierleague.com/drf/entry/",id,"/history"), simplifyVector = T)
  
  team_info <- data.frame(as.list(unlist(history[['entry']])))
  team_info <- team_info[,!names(team_info) %in% "kit"] # not everyone designs a kit
  
  all <- rbind(all,
               data.frame(team_info, 
                          manager = paste(team_info$player_first_name, team_info$player_last_name), 
                          history[['history']])
  )
}

rank <- function(x){
  position <- numeric(length(unique(x$id)))
  position[(order(-x$total_points))] <- 1:(length(unique(x$id)))
  return(position)
}

temp <- data.frame()
for(i in 1:length(unique(all$event))){
  temp <- rbind(temp, rank(subset(all, event == i)))
}
temp <- unlist(temp)
all <- cbind(all, league_rank = temp)

ggplot(all, aes(event, total_points, colour = name, group = name))  + geom_point() + geom_line()

ggplot(all, aes(event, total_points, colour = name, group = name))  + geom_point() + geom_smooth(method = "lm", fullrange = TRUE, se = F) + xlim(NA, 38)

ggplot(all, aes(event, value.1, colour = name, group = name))  + geom_point() + geom_smooth()

ggplot(all, aes(points, fill = manager, group = manager))  + geom_density() + facet_grid(manager~.) + coord_cartesian(expand = c(0,0))

ggplot(all, aes(event, league_rank, colour = name)) + geom_step(lwd = 1.25) + scale_y_reverse() + geom_point(size = 3) + facet_grid(manager ~ .)
