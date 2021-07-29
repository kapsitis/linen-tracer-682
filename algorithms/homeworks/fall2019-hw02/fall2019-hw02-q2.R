lambda <- function(arg) {
  res <- numeric(0)
  for (a in arg) {
    if (a == 0) { res <- c(res,(1/sqrt(2))) }
    else { res <- c(res,1) }
  }
  return(res)
}

N <- 8
f <- function(x) {
  return((N-1)-x)
}


FF <- function(vv) {
  res <- numeric(0)
  for (u in 0:(N-1)) {
    xx <- (0:(N-1))
    ss <- 0
    for (x in xx) {
      ss <- ss + sqrt(2/N)*(lambda(u) * cos((pi*u)/N*(x+0.5)) * vv[x+1])
    }
    res <- c(res,ss)
  }
  return(res)
}

ff <- function(vv) {
  res <- numeric(0)
  for (x in 0:(N-1)) {
    uu <- (0:(N-1))
    ss <- 0
    for (u in uu) {
      ss <- ss + sqrt(2/N)*(lambda(u) * cos((pi*u)/N*(x+0.5)) * vv[u+1])
    }
    res <- c(res,ss)
  }
  return(res)
}

## temp <- FF(17 + 0:7)
## round(temp,digits=4)
## ff(c(57.9828,-6.4423,0,-0.6735,0,-0.2009,0,-0.0507))

