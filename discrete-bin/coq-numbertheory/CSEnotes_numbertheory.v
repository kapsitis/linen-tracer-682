(** #<a href="../../discrete/coq.html">Back to Coq Main Page</a>#  *)

(** * Proving Theorems about Integers *) 

(**
Date: 2020-01-02. Tested with Coq version 8.8.1.
------------------------
The following examples are based on the 
#<a href="http://www.cse.buffalo.edu/~knepley/classes/cse191/ClassNotes.pdf">Class Notes</a>#; 
Pages 110-137.
#<a href="https://cse.buffalo.edu/~knepley/classes/cse191/Syllabus.html">CSE 191 "Discrete Structures"</a>#.
*)

Require Import ZArith.
Open Scope Z_scope.


Lemma divide_refl: forall n, (n | n).
Proof.
  intro n. 
  unfold Z.divide.
  exists 1.
  ring.
Qed. 

Lemma divide_trans : forall n m p, (n | m) -> (m | p) -> (n | p).
Proof.
  intros n m p.
  unfold Z.divide.
  intros H1 H2.
  destruct H1.
  destruct H2.
  exists (x0*x).
  rewrite H0.
  rewrite H.
  ring.
Qed.

Lemma div_conj : forall m n d x y : Z, 
  (d | x) /\ (d | y) -> (d | m*x + n*y).
Proof. 
  intros m n d x y.
  intro H.
  destruct H as [Dx Dy].
  unfold Z.divide.
  destruct Dx as [K Dx].
  destruct Dy as [L Dy].
  exists (m*K + n*L).
  rewrite Dx.
  rewrite Dy.
  ring.
Qed.


Require Import Znumtheory.
Print Zis_gcd.

(*
See 
https://coq.inria.fr/library/Coq.ZArith.BinInt.html
Definition divide x y := exists z, y = z*x.
Notation "( x | y )" := (divide x y) (at level 0).
*)


Lemma Zis_gcd_sym : forall a b d, Zis_gcd a b d -> Zis_gcd b a d.
Proof.
  intros a b d.
  intro H.
  apply Zis_gcd_intro.
  destruct H as [H1 H2 H3].
  exact H2.
  destruct H as [H1 H2 H3].
  exact H1.
  intros x divB divA.
  apply H.
  exact divA.
  exact divB.
Qed.

Lemma Zis_gcd_for_euclid : forall a b d q:Z, 
  Zis_gcd b (a - q * b) d -> Zis_gcd a b d.
Proof. 
  intros a b d q.  (*r introduce the variables; s *)
  intro H.  (*r assume that the condition is true *)
  apply Zis_gcd_intro.  (*r Use the isGCD(a,b,d) definition *)
  destruct H as [H1 H2 H3].
  unfold Z.divide.
  destruct H1.
  destruct H2.
  rewrite H in H0.
  apply Z.sub_move_r in H0.
  rewrite H0.
  exists (x0 + q*x).
  ring. 

  destruct H.
  exact H. 

  intros y divA divB.
  destruct H.
  apply H1.
  exact divB.
  unfold Z.divide.
  destruct divA.
  destruct divB. 
  rewrite H2.
  rewrite H3.
  exists (x - q*x0).
  ring.
Qed. 



(** #<b>Theorem:</b># If a and b are both divisors of some number c 
(and a,b are mutually prime), then their product ab also divides c 
*)
Lemma div_a_perp_b : forall a b c : Z, c <> 0 -> (a | c) -> (b | c) -> Zis_gcd a b 1 -> (a * b | c).
Proof.
  intros a b c CnotZero AdivC BdivC AperpB.
  apply rel_prime_bezout in AperpB.
  destruct AdivC as [m H1].
  destruct BdivC as [n H2].
  unfold Zdivide.
  destruct AperpB as [r q H3].
  apply Z.mul_cancel_r with (p:=c) in H3.
  rewrite Z.mul_1_l in H3.
  rewrite Z.mul_add_distr_r in H3.
  rewrite H2 in H3 at 1.
  rewrite H1 in H3 at 1.
  rewrite <- H3.
  exists (q*m + r*n).
  ring.
  exact CnotZero.
Qed.



