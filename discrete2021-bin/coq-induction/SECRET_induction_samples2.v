Require Import Nat.
Require Import PeanoNat.
Require Import Arith Psatz.
Require Import ZArith.
Require Import Znumtheory.
Require Import BinInt.
Section Homework7_Problems.
Open Scope Z_scope.

Locate "|".

Print Zis_gcd.

Search (Zis_gcd _ _ 1).

Print Bezout.

Print rel_prime.




(** If 'a' is mutual prime to 'b' and 'c', then it is mutual prime to 'b*c' *)
Lemma sample7_5_1: forall a b c: Z,
(Zis_gcd a b 1) -> (Zis_gcd a c 1) -> (Zis_gcd a (b*c) 1).
Proof. 
  intros a b c.
  intros H1 H2.
  pose (rel_prime_mult a b c) as H3.
  assert (rel_prime a b) as H4.
  unfold rel_prime.
  apply H1.
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
Eval compute in (sumBy3 2).
Eval compute in (sumBy3 3).
Eval compute in (sumBy3 4).
Eval compute in (sumBy3 5).
Eval compute in (17 / 4).

Search (_*(_+_)).

Lemma Rosen2019_p351_p16: forall (n:nat), 4 * sumBy3 n = n*(n+1)*(n+2)*(n+3).
Proof.
  intros n. 
  induction n.
  simpl.
  reflexivity.
  assert (sumBy3 (S n)  =  (sumBy3 n) + (n+1)*(n+2)*(n+3)) as H1.
  simpl.
  reflexivity.
  rewrite H1.
  rewrite Nat.mul_add_distr_l.
  rewrite IHn.
  lia.
Qed.

  





Close Scope nat_scope. 
