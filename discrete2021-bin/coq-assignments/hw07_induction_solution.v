(** 
#<a href="../../discrete2021/assignments.html">Back to Discrete Assignments</a>#
*)

(** ** The solution of H7.P5 *)

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


(**
Search rel_prime.
Lemma rel_prime_mult:
  forall a b c:Z, rel_prime a b -> rel_prime a c -> rel_prime a (b * c).
*)

(** If 'a' is mutual prime to 'b' and 'c', then it is mutual prime to 'b*c' *)
Lemma sample7_5_1: forall a b c: Z, 
    (Zis_gcd a b 1) -> (Zis_gcd a c 1) -> (Zis_gcd a (b*c) 1).
Proof.
  intros a b c. 
  intros H1. 
  intros H2.
  assert (rel_prime a b) as H3.
  unfold rel_prime.
  exact H1.
  assert (rel_prime a c) as H4.
  exact H2.
  pose (rel_prime_mult a b c H3 H4) as H5.
  exact H5.
Qed.


(** GCD is defined in a way that even 0 can be the GCD of 0 and 0. *)
Lemma helper00: forall a b:Z, Zis_gcd a b 0 <-> (a = 0 /\ b=0).
Proof.
  intros a b.
  split. 
  intros H0.
  destruct H0 as [[k H1] [m H2] H3].
  lia.
  intros [H1 H2].
  apply Zis_gcd_intro.
  exists 0.
  lia.
  exists 0.
  lia.
  intros x H3 H4.
  rewrite H1 in H3.
  exact H3.
Qed.


Print Z_ge_lt_dec.


(**
This result would be helpful to sort everything into three cases.

<<
Lemma zero_pos_neg_dec: forall n:Z, {n = 0} + {n > 0} + {n < 0}.
Proof. 
  Admitted.
>>
*)

Lemma sample2_20_helperZZ: forall a b: Z,
  (Zis_gcd a b 1) -> (Zis_gcd a (b*b) 1).
Proof. 
  intros a b H0.
  pose (rel_prime_mult a b b) as H1.
  apply H1.
  exact H0.
  exact H0.
Qed. 



Lemma sample2_20: forall a b: Z,
  (Zis_gcd a b 1) -> (Zis_gcd (a*a) (b*b) 1).
Proof.
  intros a b H0.
  apply sample2_20_helperZZ.
  apply Zis_gcd_sym.
  apply Zis_gcd_sym in H0.
  apply sample2_20_helperZZ.
  exact H0.
Qed.



Lemma sample7_5_2_hh: forall a c: Z, c>0 -> (c | a) -> (c * c * (a / c * (a / c)) = a*a).
Proof.
  intros a c H0 H1.
  destruct H1 as [k H1].
  rewrite H1.
  assert (k * c / c = k) as H2.
  apply Z_div_mult.
  exact H0.
  rewrite H2.
  lia.
Qed.


Lemma sample7_5_2_helper: forall a b c: Z, (c > 0) ->
  (Zis_gcd a b c) -> (Zis_gcd (a*a) (b*b) (c*c)). 
Proof. 
  intros a b c.
  intros H H0.
  assert (Z.gcd a b = c) as H3.
  apply (Zis_gcd_gcd).
  lia.
  exact H0.
  assert ((Z.gcd (a/c) (b/c)) = 1) as H4.
  apply (Z.gcd_div_gcd a b c).
  lia.
  rewrite H3.
  reflexivity.
  assert (rel_prime (a / c) (b / c)) as H5.
  unfold rel_prime.
  pose (Zgcd_is_gcd (a/c) (b/c)) as H6.
  rewrite H4 in H6.
  exact H6.
  assert (rel_prime ((a/c)*(a/c)) ((b/c)*(b/c))) as H7.  
  apply sample2_20.
  exact H5.
  assert (Zis_gcd (a / c * (a / c)) (b / c * (b / c)) 1) as H8.
  unfold rel_prime in H7.
  exact H7.
  pose (Zis_gcd_mult (a / c * (a / c)) (b / c * (b / c)) (c*c) 1) as H9.
  pose (H9 H8) as H10.
  destruct H0 as [H0A H0B H0C].
  pose (sample7_5_2_hh a c H H0A) as H11.
  rewrite H11 in H10.
  pose (sample7_5_2_hh b c H H0B) as H12.
  rewrite H12 in H10.
  assert (c*c*1 = c*c) as H14.
  lia.
  rewrite H14 in H10.
  exact H10.
Qed.





(** If c=gcd(a,b), then c*c=gcd(a*a,b*b). *)
Lemma sample7_5_2: forall a b c: Z, 
  (Zis_gcd a b c) -> (Zis_gcd (a*a) (b*b) (c*c)). 
Proof. 
  intros a b c H0.
  elim (Z_ge_lt_dec c 0).  
  intros H1.
  elim (Z_zerop c).
  intros H2.
  assert (a = 0 /\ b=0) as [H3 H4].
  apply helper00.
  rewrite H2 in H0.
  exact H0.
  rewrite H2.
  apply helper00.
  lia.
  intros H2.
  assert (c > 0).
  lia.
  apply sample7_5_2_helper.
  exact H.
  exact H0.
  pose (Zis_gcd_opp a b c H0) as H1.
  apply Zis_gcd_sym in H1.
  intros H2.
  pose (sample7_5_2_helper a b (-c)) as H3.
  assert (-c * -c = c*c) as H4.
  lia.
  rewrite H4 in H3.
  apply H3.
  lia.
  exact H1.
Qed.



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
  induction n.
  simpl.
  reflexivity.
  assert (sumBy3 (S n) = sumBy3 n + (n+1)*(n+2)*(n+3)) as H1.
  simpl.
  reflexivity.
  rewrite H1.
  lia.
Qed.


(**
Find and use some results from Coq libraries.
<<
Search (_*_ = _*_).
Search ((_+_)*_).
Nat.mul_comm: forall n m : nat, n * m = m * n
Nat.mul_add_distr_r: forall n m p : nat, (n + m) * p = n * p + m * p
>>
*)

(** 
This illustrates the 'repeat' tactic. We keep rewriting (distributivity law for two variables) until we get a longer one.
*)
Lemma long_distr: forall k a b c d e:nat, (a+b+c+d+e)*k = k*a+k*b+k*c+k*d+k*e.
Proof.
  intros k a b c d e.
  repeat rewrite Nat.mul_add_distr_r.
  lia.
Qed.


Lemma Rosen2019_p351_p33_helper5: forall (n:nat), n <= n ^ 5.
Proof.
  intros n.
  destruct n.
  simpl.
  lia.
  unfold pow.
  lia.
Qed.


(** Prove by induction that n^5-n is always divisible by 5 
    (Little Fermat theorem for p=5 *)
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


(**
Locate  "<".
Print lt. 
Search (_<_).
Search (_ < _ <-> _>_).
*)


(** 
Perhaps, can use this result directly in the proof (with lia); no need for this lemma.
*)
Lemma flip_ineq: forall a b:nat, a<b <-> b>a. 
Proof.
  intros a b.
  split.
  lia.
  lia.
Qed.


(** This result is true for all naturals (unlike the next lemma). *)
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
  apply flip_ineq.
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


(** Prove by induction that for n>4 we have 2^n > n^2. *)
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

