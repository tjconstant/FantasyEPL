library(jsonlite)

write_json(
data.frame(
  uid = 1,
  updateDate = Sys.time(),
  titleText = "FF",
  mainText = "Hello World!",
  redirectionUrl = "github.com/tjconstant"),
path = "feed.json")
