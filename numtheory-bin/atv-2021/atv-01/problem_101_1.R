digitsum = function (x) {sum(as.numeric(unlist(strsplit(as.character(x), split="")))) }



## This finds 949; 99499, ... 
for (n in 1:999) {
  dsn <- digitsum(n)
  dsnn <- digitsum(n^2)
  if (dsnn < dsn) {
    print(sprintf("Number %d is quite good; square is %d", n,n^2))
  }
}

