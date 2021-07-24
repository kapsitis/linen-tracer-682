Require Import Nat.
Require Import PeanoNat.

Require Import ZArith.
Require Import Znumtheory.
Require Import BinInt.

Require Import Arith Psatz.

Section Homework7_Problems.

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

Lemma Rosen2019_p351_p16: forall (n:nat), 4 * sumBy3 n = n*(n+1)*(n+2)*(n+3).
Proof. 
  induction n.
  simpl.
  reflexivity.
  assert (sumBy3 (S n) = sumBy3 n + (n+1)*(n+2)*(n+3)) as H1.
  simpl.
  reflexivity.
  rewrite H1.
  lia.
Qed.



(*
https://math.stackexchange.com/questions/2358838/use-mathematical-induction-to-prove-7n2-82n1-is-divisible-by-57-for

There are many similar results in the textbook.
All of them can be proven in a similar way.

Problem 36 (Rosen2019, p.351)
----------------------------------
Prove that 21 divides 4^(n+1) + 5^(2n-1) 
whenever n is an odd positive integer.

Problem 37 (Rosen2019, p.351)
----------------------------------
Prove that, if n is a positive integer, 
then 133 divides 11^(n+1) +12^(2n-1).

Problem 11 (Rosen2019, p.400). 
----------------------------------
Use mathematical induction to prove that 43 divides 
6^(n+1) + 7^(2n-1) for every positive integer n
*)
Lemma hw7_prob4: forall (n:nat), (57 | (7^(n+2) + 8^(2*n+1))).
Proof. 
  intros n. 
  induction n.
  simpl.
  unfold divide.
  exists 1.
  reflexivity.
  assert (2 * S n + 1 = S(S(2*n+1))) as H1.
  lia.
  rewrite H1.
  assert (S n + 2 = S (n+2)) as H2.
  reflexivity.
  rewrite H2.
  rewrite (Nat.pow_succ_r' 7 (n+2)).
  rewrite (Nat.pow_succ_r' 8 (S (2 * n + 1))).
  rewrite (Nat.pow_succ_r' 8 (2 * n + 1)).
  rewrite <- mult_assoc_reverse.
  assert (8*8 = 7+57) as H3.
  reflexivity.
  rewrite H3.
  rewrite Nat.mul_add_distr_r.
  rewrite <- plus_assoc_reverse.
  rewrite <- Nat.mul_add_distr_l.
  unfold divide in IHn.
  destruct IHn as [z IHn].
  rewrite IHn.
  unfold divide.
  exists (7*z +  8 ^ (2 * n + 1)).
  lia.
Qed.





Lemma Rosen2019_p351_p33_helper2: forall (n:nat), n <= n ^ 2.
Proof.
  intros n.
  unfold pow.
  destruct n.
  simpl.
  omega.
  pose (mult_le_compat_r 1 (S n) (S n)) as H1. 
  assert (1 * S n = S n) as H2.
  lia.
  rewrite H2 in H1.
  rewrite Nat.mul_comm in H2.
  rewrite H2.
  apply H1.
  lia.
Qed.


(*
Nat.mul_le_mono_l: forall n m p : nat, n <= m -> p * n <= p * m
*)

Lemma Rosen2019_p351_p33_helper5: forall (n:nat), n <= n ^ 5.
Proof.
  intros n.
  destruct n.
  simpl.
  lia.
  unfold pow.
  lia.
Qed.


Lemma Rosen2019_p351_p33: forall (n:nat), (5 | n^5 - n).
Proof.
  intros n.
  unfold divide.
  induction n.
  exists 0.
  simpl.
  reflexivity.
  assert (S n ^ 5 - S n = n^5 + 5*n^4+ 10*n^3 + 10*n^2 + 4*n ) as h.
  unfold pow.
  lia.
  rewrite h.
  destruct IHn as [m IHn].
  exists (m + n ^ 4 + 2 * n ^ 3 + 2 * n ^ 2 + n).
  assert (n ^ 5 = m * 5 + n) as h1.
  rewrite <- IHn.
  rewrite Nat.sub_add.
  lia.
  apply Rosen2019_p351_p33_helper5.
  lia.
Qed.




Fixpoint factorial (n : nat) := match n with
  0 => 1
  | S k => (S k)*(factorial k)
end.

Compute (factorial 0).
Compute (factorial 1).
Compute (factorial 5).
Compute (factorial 8).



Search (~(_ > _)).
Search (S _ + _).


Compute (log2 4096).
Search (_*_ < _*_).

Search (_<_ -> _<=_).
Search (S _ <= _).




(*
mult_lt_compat_l: forall n m p : nat, n < m -> 0 < p -> p * n < p * m
Nat.lt_le_incl: forall n m : nat, n < m -> n <= m
Nat.lt_le_trans: forall n m p : nat, n < m -> m <= p -> n < p
*)
Print le_lt_dec.


(*
https://stackoverflow.com/questions/64929788/induction-with-other-base-case-in-coq
*)
Lemma Rosen2019_p351_p20_helper: forall (n:nat), 3^(n+7) < (factorial (n+7)).
Proof. 
  intros n. 
  induction n.
  simpl.
  lia.
  rewrite Nat.add_succ_l.
  rewrite (Nat.pow_succ_r' 3 (n + 7)).
  assert (factorial (S (n + 7)) = (S (n+7))*(factorial (n+7))) as H1.
  simpl.
  reflexivity.
  rewrite H1.
  assert (0<3) as H2. 
  lia. 
  pose (mult_lt_compat_l (3 ^ (n + 7)) (factorial (n + 7)) 3 IHn H2) as H3.
  assert (3 < S(n+7)) as H4.
  lia.
  assert (0 < factorial (n + 7)) as H5.
  lia.
  pose (mult_lt_compat_r 3 (S (n + 7))  (factorial (n + 7)) H4 H5) as H6.
  apply Nat.lt_le_incl in H6.
  pose (Nat.lt_le_trans 
    (3 * 3 ^ (n + 7)) 
    (3 * factorial (n + 7)) 
    (S (n + 7) * factorial (n + 7)) H3 H6) as H7.
  exact H7.
Qed.

(*
Nat.add_succ_l: forall n m : nat, S n + m = S (n + m)
not_gt: forall n m : nat, ~ n > m -> n <= m
le_not_gt: forall n m : nat, n <= m -> ~ n > m
gt_le_S: forall n m : nat, m > n -> S n <= m
*)

Search (_ < _ <-> _).
Locate "<".
Search (lt _ _).
Print lt.
Print gt.



(*
Inspiration how to write inductive proofs with some other base cases (such as starting
with base case n=7). 
https://stackoverflow.com/questions/64929788/induction-with-other-base-case-in-coq
https://math.stackexchange.com/questions/910741/constructive-proof-of-pigeonhole-principle
*)


Lemma Rosen2019_p351_p20: forall (n:nat), n>6 -> 3^n < (factorial n).
Proof. 
  intros n.
  intros H0.
  destruct n. 
  omega.
  destruct n. 
  omega.
  destruct n. 
  omega.
  destruct n. 
  omega.
  destruct n. 
  omega.
  destruct n. 
  omega.
  destruct n. 
  omega.
  assert (S (S (S (S (S (S (S n)))))) = n+7) as H1.
  lia.
  rewrite H1.
  apply Rosen2019_p351_p20_helper.
Qed. 


Search (_ < _ <-> _>_).
Lemma flip_lt: forall a b:nat, a<b -> b>a. 
Proof.
  intros a b.
  lia.
Qed.

Lemma flip_gt: forall a b:nat, a>b -> b<a. 
Proof.
  intros a b.
  lia.
Qed.

Compute (S (1 + 5) ^ 2).

(*
mult_lt_compat_l: forall n m p : nat, n < m -> 0 < p -> p * n < p * m
Nat.lt_le_incl: forall n m : nat, n < m -> n <= m
Nat.lt_le_trans: forall n m p : nat, n < m -> m <= p -> n < p
*)

Lemma Rosen2019_p351_p21_helper: forall (n:nat), 2^(n+5) > (n+5)^2.
Proof.
  induction n. 
  simpl.
  lia.
  assert ((n + 5) ^ 2 < 2 ^ (n + 5)) as IHn'.
  lia.
  assert (S n + 5 = S (n+5)) as H2.
  reflexivity.
  rewrite H2.
  rewrite (Nat.pow_succ_r' 2 (n + 5)).
  assert (0 < 2) as H3. 
  lia.
  pose (mult_lt_compat_l ((n + 5) ^ 2) (2 ^ (n + 5)) 2 IHn' H3) as H4.
  apply flip_lt.
  assert(S (n + 5) ^ 2 = (n+5)^2 + 2*(n+5)+1) as H5.
  unfold pow.
  lia.
  assert (S (n + 5) ^ 2 < 2 * (n + 5) ^ 2) as H6.
  rewrite H5.
  unfold pow.
  lia.
  apply Nat.lt_le_incl in H4.
  pose (Nat.lt_le_trans (S (n + 5) ^ 2) (2 * (n + 5) ^ 2) (2 * 2 ^ (n + 5)) H6 H4) as H7.
  exact H7.
Qed.


Lemma Rosen2019_p351_p21: forall (n:nat), n>4 -> 2^n > n^2. 
Proof. 
  intros n.
  intros H0.
  destruct n. 
  omega.
  destruct n. 
  omega.
  destruct n. 
  omega.
  destruct n. 
  omega.
  destruct n. 
  omega.
  assert (S (S (S (S (S n)))) = n+5) as H1.
  lia.
  rewrite H1.
  apply Rosen2019_p351_p21_helper. 
Qed.


Close Scope nat_scope.



End Homework7_Problems.



