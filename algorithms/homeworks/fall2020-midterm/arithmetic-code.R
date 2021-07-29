options(digits=15)
#pp <- c(0.1,0.3,0.1,0.1,0.1,0.2,0.1)
probs <- list("$" = 0.1, "A" = 0.3, 
           "C" = 0.1, "L" = 0.1,
           "M" = 0.1, "N" = 0.2, "P" = 0.1)
shifts <- list("$" = 0.0, "A" = 0.1, 
              "C" = 0.4, "L" = 0.5,
              "M" = 0.6, "N" = 0.8, "P" = 0.9)
uu[['$']] <- 0.1
left <- c(0)
size <- c(1)
word <- c("P","A","N","A","M","A","C","A","N","A","L","$")
for (i in 1:length(word)) {
  prob <- probs[[word[i]]]
  shift <- shifts[[word[i]]]
  newLeft <- left[i] + size[i]*shift
  newSize <- size[i]*prob 
  left <- c(left,newLeft)
  size <- c(size,newSize)
}



