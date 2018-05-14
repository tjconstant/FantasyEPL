season_model$manager <- factor(season_model$manager, 
                               levels = result$manager[order(result$pct[result$place == 1])])
season_model %>%
  ggplot(aes(manager, final_score, fill = manager)) + geom_violin() + coord_flip()

season_model %>%
  ggplot(aes(manager, final_score, fill = manager)) + geom_boxplot() + coord_flip()


season_model$manager <- factor(season_model$manager, 
                               levels = result$manager[order(result$pct[result$place == 1])])
season_model %>% 
  group_by(itr) %>% 
  mutate(rank = rank(-final_score)) %>%
  ggplot(aes(manager, rank, fill = manager)) + 
  geom_violin(adjust = 3, alpha= 0.5) +
  geom_boxplot(width = 0.1) +
  coord_flip()
