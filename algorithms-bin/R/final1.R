f1 <- function(x) {
  return ((30 - 2*x)/3)
}

f2 <- function(x) {
  return ((24 - 3*x)/2)
}

f3 <- function(x) {
  return (3 - x)
}

f4 <- function(x) {
  return ((49 - 6*x)/4)
}

xx <- seq(0,10,by=0.1)

plot(xx,f1(xx),type="l", lwd=2, col="red", ylim=c(0,10))
points(xx,f2(xx), type="l", lwd=2 ,col="blue")
points(xx,f3(xx), type="l", lwd=2 ,col="darkgreen")

points(xx,f4(xx), type="l", lwd=1 ,col="black")
grid()

