(** #<a href="../../discrete/coq.html">Back to Coq Main Page</a>#  *)

(** * EE.PIIRK.2020.10.3 *)

(** #<b>Problem: (A)</b> Are there different positive numbers 'a', 'b' and 'c', 
where LCM(GCD(a,b),c) = LCM(GCD(b,c),a) = LCM(GCD(c,a),b)? #<br/>#
(B) Do there exist (not necessarily different) positive integers 'a', 'b' and 'c'
where LCM(GCD(a,b),c) = LCM(GCD(b,c),a) = LCM(GCD(c,a),b)?, 
where m does not equal LCM(a,b,c).
*)

(** See #<a href='https://bit.ly/32OWgHH'>Piirkonnavoor 2020</a>#, 
page p.10, p.22.
*)

(*
(Part A)
a = 2^2 * 3^2 * 5^1 = 180
b = 2^2 * 3^1 * 5^2 = 300
c = 2^1 * 3^2 * 5^2 = 450

lcm(gcd(a,b),c) = lcm(60,450) = 900
lcm(gcd(b,c),a) = lcm(150,180) = 900
lcm(gcd(c,a),b) = lcm(90,300) = 900
-----------------
(Part B) Assume that they are not ALL equal...
Then there is a prime: p^x, p^y, p^z (such that
x,y,z are not ALL equal).

x < y < z  (1) p^z = p^y  (impossible)
x = y < z  (2) p^z = p^y  (impossible)
x < y = z  (3) p^z = p^z = p^z (possible)
*)

Require Import Nat.
Require Import PeanoNat.

Require Import ZArith.
Require Import Znumtheory.
Require Import BinInt.

Require Import Arith Psatz.




(*
https://math-comp.github.io/htmldoc/mathcomp.ssreflect.prime.html#divisors_correct
https://www.researchgate.net/publication/334654683_Hilbert's_Tenth_Problem_in_Coq
*)


(** Define only for nonzero nn; for prime p; 
invalid values return some InvalidArgument value *)



Open Scope Z_scope.


(** ** Probably do not need this definition *)
Inductive Zis_lcm (a b g:Z) : Prop :=
 Zis_lcm_intro :
  (a | g) ->
  (b | g) ->
  (forall x, (a | x) -> (b | x) -> (g | x)) ->
  Zis_lcm a b g.


Definition valuation (p:Z) (n:Z): Z := 4.



(* If a, b, c is divisible by p^x, p^y, p^z respectively, 
then either all x,y,z are equal or two are equal, and the 
third one is smaller.
*)
Lemma ee_piirk_2020_10_3A: forall a b c m p:Z, 
  Z.lcm (Z.gcd a b) c = m -> 
  Z.lcm (Z.gcd b c) a = m -> 
  Z.lcm (Z.gcd c a) b = m -> 
  (prime p) -> 
  ((valuation p a) < (valuation p b)) -> 
  ((valuation p c) = (valuation p b)).
Proof. 
  Admitted.


Theorem ee_piirk_2020_10_3B: forall a b c m:Z, 
  Z.lcm (Z.gcd a b) c = m -> 
  Z.lcm (Z.gcd b c) a = m -> 
  Z.lcm (Z.gcd c a) b = m -> 
  Z.lcm (Z.lcm a b) c = m.
Proof. 
  Admitted.




Close Scope Z_scope.

