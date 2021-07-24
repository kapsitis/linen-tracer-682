require(gmp)

for (i in 1:100000) {
  an = 500 + i*i
  an1 = 500 + (i+1)*(i+1)
  g = gcd(an,an1)
  if (g > 1000) {
    print(sprintf("(%d,%d)", i, g))
  }
}


