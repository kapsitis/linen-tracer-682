cone <- function(x, y){
  sqrt(x^2+y^2)
}

ff <- function(x,y) {
  (7*x^2 - 13*x*y + 7*y^2)^(1/3)
}

x <- y <- seq(-2, 2, by=0.05)
z <- outer(x, y, ff)

persp(x, y, z,
      main="Perspective Plot of a Cone",
      zlab = "Height",
      theta = 30, phi = 15,
      col = "springgreen", shade = 0.5)





library(lattice) #for filled.contour()
library(RColorBrewer) #for brewer.pal()
z.lattice<-outer(x,y,ff)
filled.contour(x,y,z.lattice,nlevels=6,col=brewer.pal(6,"YlOrRd"))

