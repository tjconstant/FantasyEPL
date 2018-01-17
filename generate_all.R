source("generate_html.R")
source("generate_feed.R")

count <- read.table("counter.txt")
count <- count + 1
write.table(count, file = "counter.txt")