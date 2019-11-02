f <- function(x) {
  return ((x-1)*(x-5)*(x-9)*(x-13))
}

g <- function(x) {
  return (2*(x-1)*(x-5)*(x-9)*(x-13))
}

xx <- seq(-0.5,13.5,by=0.01)

plot(xx,g(xx),type="l", col="blue", xlab="x (arguments)", ylab="y (v\u0113rt\u012Bba)")
points(xx,f(xx),type="l", col="green")
points(0:13,c(f(0),f(1),g(2),f(3),g(4),f(5),f(6),g(7),f(8),f(9),g(10),f(11),g(12),g(13)), pch=16, col="red")

grid()



