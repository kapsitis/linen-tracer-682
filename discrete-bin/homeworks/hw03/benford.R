f <- function(xx) {
  result <- character(0)
  for (x in xx) {
    val <- abs(x^2* tan(x))
    valStr <- paste0("",val)
    result <- c(result,
    strsplit(valStr,"")[[1]][1])
  }
  return(result)
}

uu <- f(1:100000)
empirical <- as.vector(table(uu))/100000

benford <- log10(2:10) - log10(1:9)

library(reshape2)
df <- melt(data.frame(Emp=empirical, Benf=benford, 
           digits=sprintf("%d",1:9)), variable.name="Type")

library(ggplot2)
ggplot(df, aes(digits, value, fill=Type)) + 
  geom_bar(position="dodge",stat="identity")



