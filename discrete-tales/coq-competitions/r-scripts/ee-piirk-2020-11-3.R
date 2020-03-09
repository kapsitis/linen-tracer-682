#xx <- rep(365,times=50)
#yy <- 365:(365-50+1)
#zz <- yy/xx
#tt <- cumprod(zz)
#plot(tt)
#grid()



for (a in 10:99) {
  for (b in 10:99) {
    if (a*b < 1000) {
      s <- a+b
      p <- sprintf("%d",a*b)
      pinv <- sprintf("%s%s%s",
                      substring(p,1,1),
                      substring(p,2,2),
                      substring(p,3,3))
      pinv2 <- as.numeric(pinv)
      if (abs(s - pinv2) ==119) {
        print(sprintf("(a,b)=(%d,%d)",a,b))
      }
    }
  }
}

