(** 
#<a href="../../discrete2021/assignments.html">Back to Discrete Assignments</a>#
*)

Require Import Classical.
Require Import Classical_Prop.

Section Homework5_Problems.


Variables A : Set.
Variables something: A.
Variables P Q : A->Prop. 


(** ** Warmup Exercises *)

Lemma ex_dist_or_for : (exists x:A, P x \/ Q x) -> (ex P) \/ (ex Q).
Proof. 
  Admitted.


Lemma demorgan_forall : (forall x : A, P x) -> ~ (exists y : A, ~P y).
Proof. 
  Admitted.
  

Lemma distribute_forall: 
    (forall (x:A), (P x) /\ (Q x)) <-> (forall (x:A),(P x)) /\ (forall (x:A), (Q x)).
Proof. 
  Admitted.


Lemma allIMPL_exIMPL: ((forall (x:A), (P x)) -> (forall (x:A), (Q x))) -> (exists (x:A), (P x) -> (Q x)).
Proof. 
  Admitted.
  


(** ** Problems in H5.Q5 *)


(** #<b>H5.Q5.Lemma1:</b># Can distribute 'exists' quantifier over a disjunction *)
Lemma sample5_1: 
    (exists (y:A), (P y)) \/ (exists (y:A), (Q y)) <-> 
    exists (x:A), (P x) \/ (Q x).
Proof. 
  Admitted.




(** #<b>H5.Q5.Lemma2:</b># Some variant of De Morgans law *)
Lemma sample5_2: (exists (x:A), ~~(P x)) <-> ~(forall (y:A), ~(P y)).
Proof. 
  Admitted.



(** #<b>H5.Q5.Lemma3:</b># If #<tt>(P x)</tt># always implies #<tt>(Q x)</tt>#, then the existence 
   of some #<tt>(P x0)</tt># leads to existence of some #<tt>(Q x1)</tt># *)
Lemma sample5_3: (forall (x:A), P x -> Q x) -> ((exists (x:A), (P x)) -> exists (x:A), (Q x)).
Proof. 
  Admitted.



(** #<b>H5.Q5.Lemma4:</b>#  If P being true sometimes implies that also Q is true sometimes, 
   then there is some x0 for which (P x) implies (Q x) *)
(** #<b>Note:</b> This result would not be true, if set A is empty. It is the reason why 
element #<tt>something</tt># was introduced. *)

Lemma sample5_4: ((exists (x:A), (P x)) -> (exists (x:A), (Q x))) -> (exists (x:A), ((P x) -> (Q x))).
Proof.
  Admitted.



(** #<b>H5.Q5.Lemma5:</b>#  If P(x) always implies Q(x), and P(x) is always true, then Q(x) is always true. *)
Lemma sample5_5: (forall (x:A), ((P x) -> (Q x))) -> ((forall (x:A), (P x)) -> forall (x:A), (Q x)).
Proof. 
  Admitted.

End Homework5_Problems.

