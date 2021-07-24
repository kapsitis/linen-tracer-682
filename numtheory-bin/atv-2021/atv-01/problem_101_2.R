## m^2 - 2 dalas ar p. 
## Ja dalas a^2+m-2 ar p
## Tad atrodas taads, ka b^2-m-2 dalas ar p. 

require(gmp)

for (p in 2:1000) {
  if (isprime(p) == 2) {
    for (m in 1:p) {
      if (((m^2-2) %% p) == 0) {
        print(sprintf("p = %d (p mod 8 = %d), m = %d", p, (p%%8) , m))
      }
    }
  }
}
