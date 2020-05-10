mm <- matrix(c(0,0,0,1/2,1/2,0,1,1/2,0,1/2,0,0,1/2,1/2,0,0), nrow=4, byrow=TRUE)
vv <- c(1/4,1/4,1/4,1/4)

vv1 <- mm %*% vv
vv2 <- mm %*% vv1
vv3 <- mm %*% vv2
vv4 <- mm %*% vv3
