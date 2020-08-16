(** #<a href="../../discrete/coq.html">Back to Coq Main Page</a>#  *)

(** * LV.NO.2020.11.1 *)

(** See #<a href='https://bit.ly/2VLBCH8'>LV Regional 
Olympiad Problems</a>#. *)

(** #<b>Problem:</b># Show that for all positive integers n, 
6^(2n) + 19^n - 2^(n+1) is divisible by 17.
*)

(**
This example shows a traditional problem on modular arithmetic: 
it is about the divisibility. 
We use integer arithmetic that has lots of 'helper' lemmas already available, 
so the proof is rather short.
*)


Require Import Nat.
Require Import PeanoNat.

Require Import ZArith.
Require Import Znumtheory.
Require Import BinInt.

Require Import Arith Psatz.
Require Import Zpow_facts.


(** Show that 19^n is congruent to 2^n modulo 17. *)
Lemma helper1: forall n:Z, 19^n mod 17 = 2^n mod 17. 
Proof.
  intros n. 
  pose (Zpower_mod 19 n 17) as H1.
  assert ((19 mod 17) = 2) as H2.
  reflexivity.
  rewrite H2 in H1.
  assert (0 < 17) as H3.
  lia.
  apply H1 in H3.
  exact H3.
Qed.


(** Show that 2^(n+1) is twice as large as 2^n for all non-negative n. *)
Lemma helper2: forall n:Z, 0 <= n -> 2^(n+1) = 2 * 2^n.
Proof.
  intros n. 
  intros H1.
  pose (Z.pow_succ_r 2 n) as H2.
  apply H2 in H1.
  assert (Z.succ n = n+1) as H3.
  lia.
  rewrite H3 in H1.
  exact H1.
Qed.


(** Show that 6^(2n) = 36^n is congruent to 2^n modulo 17. *)
Lemma helper3: forall n:Z, 6^(2*n) mod 17 = 2^n mod 17. 
Proof. 
  intros n. 
  pose (Z.pow_twice_r 6 n) as H1.
  pose (Z.pow_mul_l 6 6 n) as H2.
  rewrite <- H2 in H1.
  pose (Zpower_mod (6*6) n 17) as H3.
  assert ((6*6 mod 17) = 2) as H4.
  reflexivity.
  rewrite H4 in H3.
  assert (0 < 17) as H5.
  lia.
  apply H3 in H5.
  rewrite H1.
  exact H5.
Qed.


(** Define the sequence used in this problem *)
Definition SeqC (n: Z):Z := 6^(2*n) + 19^n - 2^(n+1).

(** Prove the statement of the problem itself. *)
Theorem lv_no_2020_11_1: forall n: Z, 0 <= n -> (SeqC n) mod 17 = 0.
Proof.
  intros n. 
  unfold SeqC.
  intros H1.
  pose (Zminus_mod (6 ^ (2 * n) + 19 ^ n) (2 ^ (n + 1)) 17) as H2.
  rewrite H2.
  pose (Zplus_mod (6^(2*n)) (19^n) 17) as H3.
  rewrite H3.
  pose (helper3 n) as H4.
  rewrite H4.
  pose (helper1 n) as H5.
  rewrite H5.
  pose (helper2 n) as H6.
  apply H6 in H1 as H7.
  rewrite H7.
  assert (2 = 1+1) as H8.
  reflexivity.
  rewrite H8 at 3.
  pose (Z.mul_add_distr_r 1 1 (2^n)) as H9.
  rewrite H9.
  assert (1 * 2 ^ n  = 2^n) as H10.
  lia.
  rewrite H10.
  pose (Zplus_mod (2^n) (2^n) 17) as H11.
  rewrite H11.
  assert (((2 ^ n mod 17 + 2 ^ n mod 17) mod 17) - 
      ((2 ^ n mod 17 + 2 ^ n mod 17) mod 17) = 0) as H12.
  ring.
  rewrite H12.
  reflexivity.
Qed.




