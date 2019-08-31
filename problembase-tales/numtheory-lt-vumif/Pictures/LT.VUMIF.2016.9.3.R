ff <- function(n) {
  return (n + (-7*n + 3)/(n^2 + 7))
}

xx <- seq(0, 12, by=0.1)
yy <- ff(xx)

df <- data.frame(xx = xx, yy = yy)

#plot(xx,yy, type="l", col="red")
#points(xx,xx, type="l", col="blue")
#grid()

library(ggplot2)
p <- ggplot(data=df) + 
  geom_line(aes(x=xx, y=yy, color="red")) + 
  theme_minimal() +
  theme(legend.position = "none") +
  scale_x_discrete(
    name ="n", breaks = seq(0,12,by=2), minor_breaks = NULL,
    labels=sprintf("%d",seq(0,12,by=2))
    )
p
ggsave(p, filename = "LT.VUMIF.2016.9.3.png", dpi = 300, type = "cairo",
       width = 3, height = 3, units = "in")
