library(jsonlite)

write_json(
data.frame(
  uid = 1,
  updateDate = "2016-05-23T00:00:00.0Z",
  titleText = "FF",
  mainText = "Hello World!",
  redirectionUrl = "github.com/tjconstant"),
path = "feed.json")
