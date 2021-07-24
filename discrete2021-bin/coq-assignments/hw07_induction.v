(** 
#<a href="../../discrete2021/assignments.html">Back to Discrete Assignments</a>#
*)

(** ** Problems in H7.P5 *)

Require Import Nat.
Require Import PeanoNat.
Require Import Arith Psatz.

Require Import ZArith.
Require Import Znumtheory.
Require Import BinInt.
Require Import Int.
Require Import ZArith_dec.

Section Homework7_Problems.

Open Scope Z_scope.


Search rel_prime.


(** If 'a' is mutual prime to 'b' and 'c', then it is mutual prime to 'b*c' *)
Lemma sample7_5_1: forall a b c: Z, 
    (Zis_gcd a b 1) -> (Zis_gcd a c 1) -> (Zis_gcd a (b*c) 1).
Proof.
  Admitted.


(** If c=gcd(a,b), then c*c=gcd(a*a,b*b). *)
Lemma sample7_5_2: forall a b c: Z, 
  (Zis_gcd a b c) -> (Zis_gcd (a*a) (b*b) (c*c)). 
Proof. 
  Admitted.


Close Scope Z_scope.


Open Scope nat_scope. 

Definition divide x y := exists z, y=z*x.
Notation "( x | y )" := (divide x y) (at level 0) : nat_scope.

Fixpoint sumBy3 n := match n with
  0 => 0
  | S k => (sumBy3 k) + (k+1)*(k+2)*(k+3)
end.

Eval compute in (sumBy3 0).
Eval compute in (sumBy3 1).
Eval compute in (sumBy3 5).

(** Prove by induction that 1*2*3 + 2*3*4 + ... + n*(n+1)*(n+2) = 
    n*(n+1)*(n+2)*(n+3)/4 *)
Lemma Rosen2019_p351_p16: forall (n:nat), 4 * sumBy3 n = n*(n+1)*(n+2)*(n+3).
Proof. 
  Admitted.


(** Prove by induction that n^5-n is always divisible by 5 
    (Little Fermat theorem for p=5 *)
Lemma Rosen2019_p351_p33: forall (n:nat), (5 | n^5 - n).
Proof.
  Admitted.

(** Prove by induction that for n>4 we have 2^n > n^2. *)
Lemma Rosen2019_p351_p21: forall (n:nat), n>4 -> 2^n > n^2. 
Proof. 
  Admitted.
  
  
Close Scope nat_scope.


End Homework7_Problems.

