(** 
#<a href="../../discrete2021/assignments.html">Back to Discrete Assignments</a>#
*)

(**
This file contains all proofs taken from
SUNY Buffalo CSE 191 Course (by Knepley):
https://cse.buffalo.edu/~knepley/classes/cse191/ClassNotes.pdf
Pages 91-105
*) 

Open Scope nat_scope.

Require Import Arith.
Inductive even : nat -> Prop :=
  even0 : even 0
  | evenS : forall x:nat, even x -> even (S (S x)).


Lemma not_even_1 : ~even 1.
Proof.
  intros even1.
  inversion even1.
Qed.


Lemma even_double_p: forall n, even(2*n).
Proof.
  induction n.
  simpl.
  apply even0.
  simpl.
  rewrite Nat.add_succ_r.
  apply evenS.
  assumption.
Qed.


Lemma even_plus10_p : forall n, even n -> even (n + 10).
Proof.
  induction n.
  intro H0.
  apply evenS.
  apply evenS; apply evenS; apply evenS; apply evenS.
  assumption.
  intro H1.
  inversion H1.
  repeat rewrite Nat.add_succ_r.
  rewrite Nat.add_0_r.
  repeat apply evenS.
  exact H0.
Qed.


Lemma odd_notdouble_p : forall n, ~even(2*n+1).
Proof.
  induction n.
  simpl.
  intros H1even.
  inversion H1even.
  simpl.
  rewrite Nat.add_succ_r.
  rewrite plus_0_r.
  rewrite plus_0_r.
  intro HSneven.
  inversion HSneven.
  destruct IHn.
  simpl.
  rewrite plus_0_r.
  rewrite Nat.add_1_r.
  rewrite <- Nat.add_succ_r.
  assumption.
Qed.



Lemma even_mult : forall x, even x -> exists y, x = 2*y.
Proof. 
  intros x H.
  elim H.
  exists 0.
  ring.
  intros x0 Hx0even IHx0.
  destruct IHx0 as [y Heq].
  rewrite Heq.
  exists (S y).
  ring.
Qed.


Lemma even_cp_p : forall n, even n -> ~even(n*n + 2*n + 7).
Proof.
  induction n.
  intro H0even.
  simpl.
  intro H7even.
  inversion H7even.
  inversion H0.
  inversion H2.
  inversion H4.
  intro HSneven.
  apply even_mult in HSneven.
  destruct HSneven.
  rewrite H.
  assert (HOdd : exists m, 2 * x * (2 * x) + 2 * (2 * x) + 7 = 2*m + 1).
  exists (2*x*x + 2*x + 3).
  ring.
  destruct HOdd.
  rewrite H0.
  apply odd_notdouble_p.
Qed.

Close Scope nat_scope.



