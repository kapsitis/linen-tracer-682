(** #<a href="../../discrete/assignments.html">Back to Discrete Assignments</a># *)

(** * Predicates and Quantifiers *) 

(**
Date: 2020-01-02. Tested with Coq version 8.8.1.
------------------------
The following examples are based on the 
#<a href="http://www.cse.buffalo.edu/~knepley/classes/cse191/ClassNotes.pdf">Class Notes</a>#
from SUNY Buffalo 
#<a href="https://cse.buffalo.edu/~knepley/classes/cse191/Syllabus.html">CSE 191 
"Discrete Structures"</a>#, Pages 30-49. 
*)

(** ** General Predicate Logic *) 

Section Pred_Examples.

Variables A : Set.

Variables P Q : A->Prop.

Lemma ex_dist_or_for : (exists x:A, P x \/ Q x) -> (ex P) \/ (ex Q).
Proof. 
  intro H.
  destruct H.
  destruct H.
  left. 
  exists x.
  exact H.
  right.
  exists x.
  exact H.
Qed.

Lemma demorgan_forall : (forall x : A, P x) -> ~ (exists y : A, ~P y).
Proof.
  intro H.
  unfold not.
  intro H0. 
  destruct H0.
  apply H0. 
  apply H.
Qed. 


Lemma demorgan_forall_another: (forall x : A, P x) -> ~ (exists y : A, ~P y).
Proof. 
  intro H. 
  intro H1.
  destruct H1.
  destruct H0.
  apply H.
Qed. 



(** ** Odd and Even Natural Numbers *) 

(** Define even natural numbers inductively with two subcases:
#<ul>#
#<li>"even0" states that 0 is an even number.</li>#
#<li>"evenS" states that a successor to a successor 
#of an even number is even: In regular algebra 
#<tt>(S (S x))</tt># would be written as #<tt>(x+1)+1</tt>.</li>#
#</ul>#
*)

Require Import Arith.
Inductive even : nat -> Prop :=
  even0 : even 0
  | evenS : forall x:nat, even x -> even (S (S x)).


(** Prove that 1 is not an even number. 
Tactic "inversion" tries to find all cases 
how we could get number "1" (defined as
#<tt>(S 0)</tt>#) from the cases defining
even numbers. No cases match it, so the
proof is complete.
*)

Lemma not_even_1 : ~even 1.
Proof.
  intros even1.
  inversion even1.
Qed. 


(** Prove that 2*n is always even. *)
Lemma even_double_p : forall n, even(2*n).
Proof.
  induction n.
  simpl.
  apply even0.
  simpl.
  rewrite Nat.add_succ_r.
  apply evenS.
  exact IHn.
Qed.

(** Prove that adding 10 to an even number is also even. *)
Lemma even_plus10_p : forall n, even n -> even (n + 10).
Proof. 
  induction n.
  intro H0.
  apply evenS.
  apply evenS; apply evenS; apply evenS; apply evenS.
  exact H0.
  intro H1.
  inversion H1.
  repeat rewrite -> Nat.add_succ_r.
  apply evenS; apply evenS; apply evenS; apply evenS; apply evenS.
  simpl.
  apply evenS.
  rewrite plus_0_r.
  exact H0.
Qed.


(** Prove that 2*n+1 is never even. *)
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
  exact H0.
Qed.

(** Every even number can be expressed as 2*y. *)
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

(** Square function that is never even. *)
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


















