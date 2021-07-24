f <- function(x) {
  return (floor(2*x) + floor(4*x) + floor(6*x) + floor(8*x))
}

x <- seq(0.0, 2.0, by=0.001)
plot(x,f(x),type='l', col="red", lwd=2)
grid()



