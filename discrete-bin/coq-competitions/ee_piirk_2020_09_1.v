(** #<a href="../../discrete/coq.html">Back to Coq Main Page</a>#  *)

(** * EE.PIIRK.2020.9.1 *)

(** #<b>Problem:</b> Find all positive integers a,b, such that
a^2 - b^2 = 2020
*)

(** See #<a href='https://bit.ly/32OWgHH'>Piirkonnavoor 2020</a>#, 
page p.10, p.22.
*)

Require Import Nat.
Require Import PeanoNat.

Require Import ZArith.
Require Import Znumtheory.
Require Import BinInt.

Require Import Arith Psatz.

Open Scope Z_scope.

Lemma isPrime2: prime 2.
Proof.
  apply prime_intro.
  red; auto.
  intros n (H,H'); Z.le_elim H; auto with zarith.
  contradict H'; auto with zarith.
  rewrite <- H. apply rel_prime_1.
Qed.


(** The difficult part: 
How n > 1 and n < 5 
converts into 3 separate integers 2,3,4
*)

Lemma isPrime5: prime 5.
Proof. 
  apply prime_intro.
  red; auto.
  intros n (H,H'); Z.le_elim H; auto with zarith.

  assert (3*2 + (-1)*5 = 1) as H0. reflexivity.
  pose (Bezout_intro 2 5 1 3 (-1)) as H1.
  pose (bezout_rel_prime 2 5 (H1 H0)) as H2.

  assert (2*3 + (-1)*5 = 1) as H3. reflexivity.
  pose (Bezout_intro 3 5 1 2 (-1)) as H4.
  pose (bezout_rel_prime 3 5 (H4 H3)) as H5.

  assert ((-1)*4 + 1*5 = 1) as H6. reflexivity.
  pose (Bezout_intro 4 5 1 (-1) 1) as H7.
  pose (bezout_rel_prime 4 5 (H7 H6)) as H8.

  assert (n <= 4) as H9. lia.
  destruct (Zle_lt_or_eq n 4 H9) as [H10A | H10B].

  assert (n <= 3) as H11. lia.
  destruct (Zle_lt_or_eq n 3 H11) as [H12A | H12B].

  assert (n <= 2) as H13. lia.
  destruct (Zle_lt_or_eq n 2 H13) as [H14A | H14B].

  assert (n <= 1) as H14. lia.
  pose (Zlt_not_le 1 n H) as H15. contradiction (H15 H14).

  rewrite H14B. exact H2.
  rewrite H12B. exact H5.
  rewrite H10B. exact H8.
  
  rewrite <- H. apply rel_prime_1.
Qed.



(** The product of two odd numbers is odd. *)
Lemma nat_mul_odd_by_odd: forall a b: nat, 
  Nat.Odd a -> Nat.Odd b -> Nat.Odd (a*b).
Proof. 
  intros a b H1 H2.
  destruct (Nat.odd_spec a) as [_ H3].
  pose (H3 H1) as H4.
  destruct (Nat.odd_spec b) as [_ H5].
  pose (H5 H2) as H6.
  pose (Nat.odd_mul a b) as H7.
  rewrite H4 in H7.
  rewrite H6 in H7.
  assert ((true && true)%bool = true) as H8. simpl. reflexivity.
  rewrite H8 in H7.
  destruct (Nat.odd_spec (a*b)) as [H9 _].
  apply (H9 H7).
Qed.

Lemma Zmul_odd_by_odd: forall a b: Z, 
  Z.even(a*b) = orb (Z.even a) (Z.even b).
Proof. 
  Admitted.


Print Z.even.
Print Z.Even.

Search Z.Even.


Lemma sum_diff_evenness: forall a b: Z, 
  Z.even (a - b) = Z.even (a + b).
Proof.
  Admitted.



Print Z.pow_pos.
Search Z.Even.

(*
Z.even_spec: forall n : Z, Z.even n = true <-> Z.Even n
*)

Lemma even_andor_even: forall x y: Z, 
  Z.even x = Z.even y -> (Z.Even x \/ Z.Even y) -> 
    (Z.Even x /\ Z.Even y).
Proof. 
  intros x y H1 H2.
  destruct H2 as [H2X | H2Y].
  destruct (Z.even_spec x) as [_ H3].
  pose (H3 H2X) as H4.
  rewrite H1 in H4. 
  destruct (Z.even_spec y) as [H5 _].
  pose (H5 H4) as H6.
  split. exact H2X. exact H6.

  destruct (Z.even_spec y) as [_ H7].
  pose (H7 H2Y) as H8.
  rewrite <- H1 in H8.
  destruct (Z.even_spec x) as [H9 _].
  pose (H9 H8) as H10.
  split. exact H10. exact H2Y.
Qed.

(*
1; 2020
2: 1010 *
4; 505
5; 404
10; 202 *
20; 101
*)

Lemma ee_2020_09_1_helper: forall a b: Z, 
  a*b = 2020 -> Z.Even a \/ Z.Even b.
Proof. 
  Admitted.


Theorem ee_piirk_2020_09_1: forall a b:Z, 
  a>0 -> b>0 -> a^2 - b^2 = 2020 -> 
    ((a,b) = (506,504) \/ (a,b) = (106,96)).
Proof.
  intros a b H1 H2 H3.
  assert ((a - b)*(a + b) = a^2 - b^2) as H4.
  unfold Z.pow.
  unfold Z.pow_pos.
  simpl.
  ring.
  rewrite <- H4 in H3.
  pose (ee_2020_09_1_helper (a-b) (a+b) H3) as H5.
  pose (sum_diff_evenness a b) as H6.
  destruct (even_andor_even (a-b) (a+b) H6 H5) as [H7A H7B].




Close Scope Z_scope.

