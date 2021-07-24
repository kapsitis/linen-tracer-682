ff <- function(x) {
  y <- (2 - 21*x)/14
  return(y)
}

xx <- seq(-2.1,2.1,by=0.1)

plot(xx,ff(xx), type="l", col="red")
grid(col="black")