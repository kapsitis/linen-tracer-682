f <- function(a) {
   total <- 0
   total <- total + floor(a/5) 
   total <- total + floor(a/25) 
   total <- total + floor(a/125)
   total <- total + floor(a/625) 
   total <- total + floor(a/3125) 
   return(total)
}

