g <- function(n) {
  return (100*(log2(n)))
}

f <- function(n) {
  return ((log2(n))^2)
}

x <- seq(1,5e30,by=1e27)
y <- g(x)
plot(x,y,type="l", col="red")
grid()
points(x,f(x),type="l", col="blue")

