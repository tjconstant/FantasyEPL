
ag.result <- data.frame()
N <- 1000

for (gw in 2:max(all$event)) {
  
  season_model <- data.frame()
  
  gw.sim <- gw  # gameweek to simulate from
  gw.pdf <- gw.sim # gameweek to calc prob from
  
  #pb <- txtProgressBar(min = 0, max = N, initial = 0)
  
  for (m in unique(all$manager)) {
    a <- subset(all, manager == m & event <= gw.pdf)
    pdf_of_data <- density(a$points)
    
    for (n in 1:N) {
      random.points <- approx(cumsum(pdf_of_data$y) / sum(pdf_of_data$y),
                              pdf_of_data$x,
                              runif(38 - gw.sim))$y
      
      season_model <-
        rbind(season_model,
              data.frame(
                itr = n ,
                manager = m,
                final_score = (max(a$total_points) + sum(random.points))
              ))
      #setTxtProgressBar(pb, n)
    }
  }
  
  result <-
    season_model %>%
    group_by(itr) %>%
    slice(which.max(final_score)) %>%
    group_by(manager) %>%
    summarise(
      n = n(),
      mean = mean(final_score),
      pct = round(100 * n() / N, 2),
      label = paste0(round(100 * n() / N, 2), "%")
    )
  
  if (any(!(unique(all$manager) %in% result$manager))) {
    result <- rbind(result,
                    data.frame(
                      manager = unique(all$manager)[!(unique(all$manager) %in% result$manager)],
                      n = 0,
                      mean = NA,
                      pct = 0,
                      label = "<0.01%"
                    ))
  }
  
  result$manager <-
    factor(result$manager, levels = result$manager[order(result$pct)])

  ag.result <- rbind(ag.result, data.frame(result, gw))
  
  }


ggplot(result, aes(x=manager, y=1, fill = pct, colour = pct)) + 
  geom_point(size = 25) + 
  geom_text(aes(label = label), colour = 1) +
  theme_minimal() + 
  theme(legend.position = "none",line = element_blank(),
        axis.line = element_blank(),
        axis.text.y = element_blank(),
        axis.title = element_blank()
        ) + 
  scale_fill_gradientn(colours = c('red2', 'transparent', 'chartreuse3')) + 
  scale_colour_gradientn(colours = c('red2', 'transparent', 'chartreuse3'))

ggplot(ag.result, aes(gw,pct, colour = manager)) + geom_point(size=2) + geom_line(size=1.2) + xlab("gameweek") + ylab("% seasons won") +theme_bw()
