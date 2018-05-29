team_name<-function(id){
  
  name_table<-rbind(
    c("St Hubbins XI",371350),
    c("Runners Up...",82854),
    c("Your Mum's Athletic",196787),
    c("Moves Like Agger",698380),
    c("Constorm FC",1040007),
    c("Shakhtar Senseless",81231),
    c("ShayGivenNotStirred",879441),
    c("Mutant Ninja Skrtls",699021),
    c("Gareth's Grandslam",1104694),
    c("HaleStorm United",2039083),
    c("DaleStorm's troopers",1290767),
    c("Hubbard Hammers",1281464),
    c("Holmestorm",2039283),
    c("......... (Graham)",2083679)
  )
  
  return(name_table[id==as.numeric(name_table[,2])][1])

}

name_table<-rbind(
  c("St Hubbins XI",371350),
  c("Runners Up...",82854),
  c("Your Mum's Athletic",196787),
  c("Moves Like Agger",698380),
  c("Constorm FC",1040007),
  c("Shakhtar Senseless",81231),
  c("ShayGivenNotStirred",879441),
  c("Mutant Ninja Skrtls",699021),
  c("Gareth's Grandslam",1104694),
  c("HaleStorm United",2039083),
  c("DaleStorm's troopers",1290767),
  c("Hubbard Hammers",1281464),
  c("Holmestorm",2039283),
  c("......... (Graham)",2083679)
)

