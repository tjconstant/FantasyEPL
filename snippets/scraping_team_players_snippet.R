library(jsonlite)
library(tidyverse)

managers <- c(378067,2938617,1309360,386429,376149)

player_details <- fromJSON("https://fantasy.premierleague.com/drf/bootstrap-static")$elements


get_team <- function(id, gw = 1) {

  out <- c()
for(id in id){  
  for (gw.n in gw) {
    temp <- read_json(
      paste0(
        "https://fantasy.premierleague.com/drf/entry/",
        id,
        "/event/",
        gw.n,
        "/picks"
      ),
      simplifyVector = T
    )$picks
    
    names(temp)[1] <- "id"
    
    temp <- temp %>% left_join(., player_details, by = "id")
    out <- rbind(out, cbind(gw = gw.n, manager = get_manager(id), temp))
  }
}
  out
}


get_manager <- function(id) {
  data <-
    read_json(paste0("https://fantasy.premierleague.com/drf/entry/", id),
              simplifyVector = T)
  
  return(paste(data$entry$player_first_name, data$entry$player_last_name))
  
}

a <- get_team(managers,1:25)

a %>% 
  filter(is_captain == TRUE) %>%
  group_by(manager) %>%
  count(web_name) %>%
  ggplot(aes(x = web_name, y=n, fill = manager)) + 
  geom_histogram(stat = "identity") + coord_flip() + xlab("Captain Choice") + ylab("Count")

a %>% 
  filter(is_vice_captain == TRUE) %>%
  group_by(manager) %>%
  count(web_name) %>%
  ggplot(aes(x = web_name, y=n, fill = manager)) + 
  geom_histogram(stat = "identity") + coord_flip() + xlab("Captain Choice") + ylab("Count")
