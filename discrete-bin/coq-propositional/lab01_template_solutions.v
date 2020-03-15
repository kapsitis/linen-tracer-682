(** #<a href="../../discrete/coq.html">Back to Discrete Assignments</a># *)

(** ** This is a training file to try out some proofs similar to Coq Assignment 1. 
In this task replace all stubs "tauto" and "Admitted" with meaningful proofs.
*)

(** ** Do not modify this line: training1_0 *)

Lemma training1_0: forall a:Prop, a -> ~~a.
Proof. 
  intros a.
  unfold not.
  intros aTrue.
  intros aFalse.
  apply aFalse.
  exact aTrue.
Qed.

(** ** Do not modify this line: training1_1 *)

Require Import Classical.

Lemma training1_1: forall a:Prop, ~~a -> a.
Proof.
  intros a. 
  unfold not.
  intros.
  elim (classic a).
  intros aTrue.
  exact aTrue.
  intros aFalse.
  pose (H aFalse) as CONTRA.
  contradiction CONTRA.
Qed.

(** ** Do not modify this line: training1_2 *)

Lemma training1_2: forall a:Prop, ~~~a -> ~a.
Proof.
  intros a.
  intros NNNa.
  apply training1_1 with (a:=~a).
  exact NNNa.
Qed.

(** #<b>Tricky Question:</b># Can you prove training1_2 
without using either the ExcludedMiddle/classic axiom or
indirectly - 'training1_1' lemma?
*)

(** ** Do not modify this line: training1_3 *)

Lemma training1_3: forall a:Prop, ~~(~~a -> a).
Proof.
  intros a. 
  unfold not.
  apply training1_0 with (a:=(~~a -> a)).
  apply training1_1.
Qed.

(** ** Do not modify this line: training1_4 *)

Lemma training1_4: forall a b:Prop, a -> (b -> a).
Proof.
  intros a b. 
  intros aTrue.
  intros bTrue.
  exact aTrue.
Qed.

(** ** Do not modify this line: training1_5 *)

Lemma training1_5: forall a b:Prop, a /\ b -> a.
Proof.
  intros a b.
  intros aANDb.
  destruct aANDb as [aTrue bTrue].
  exact aTrue.
Qed.

(** ** Do not modify this line: training1_6 *)

Lemma training1_6: forall a b:Prop, a -> (a \/ b).
Proof.
  intros a b.
  intros aTrue.
  left; exact aTrue.
Qed.

(** ** Do not modify this line: training1_7 *)

Require Import Classical_Prop.

Lemma training1_7: forall a b:Prop, (~b -> ~a) -> (a -> b).
Proof.
  intros a b. 
  unfold not.
  intros H.
  intros aTrue.
  pose (classic b) as ExclMiddle.
  destruct ExclMiddle as [bTrue | bFalse].
  exact bTrue.
  pose (H bFalse) as aFalse.
  pose (aFalse aTrue) as CONTRA.
  contradiction CONTRA.
Qed.



(** ** Do not modify this line: training1_8 *)

Lemma training1_8: forall a b:Prop, (a -> b) -> (~b -> ~a).
Proof.
  intros a b.
  intros H.
  unfold not.
  intros bFalse.
  intros aTrue.
  apply bFalse.
  apply H.
  exact aTrue.
Qed.

(** ** Do not modify this line: training1_9 *)

Lemma training1_9: forall a b:Prop, a -> (b -> (a /\ b)).
Proof.
  intros a b.
  intros aTrue.
  intros bTrue.
  split.
  exact aTrue.
  exact bTrue.
Qed.



(** ** Do not modify this line: training1_10 *)

Lemma training1_10: forall a b:Prop, a -> (~a -> b).
Proof.
  intros a b. 
  intros aTrue.
  unfold not.
  intros aFalse.
  pose (aFalse aTrue) as CONTRA.
  contradiction CONTRA.
Qed.


Lemma ExFalsoQuodlibet: forall a b: Prop, a -> ~a -> b. 
Proof. 
  intros a b.
  intros aTrue.
  unfold not.
  intros aFalse.
  pose (aFalse aTrue) as CONTRA.
  contradiction CONTRA.
Qed.


Lemma ImplTransitive: forall a b c: Prop, (a->b)->(b->c)->a->c.
Proof.
  intros a b c.
  intros H1.
  intros H2.
  intros aTrue.
  apply H2.
  apply H1.
  exact aTrue.
Qed.


Lemma ModusTollens: forall a b: Prop, (a -> b) -> ~b -> ~a.
Proof.
  intros a b. 
  intros H.
  intros bFalse.
  unfold not.
  intros aTrue.
  pose (H aTrue) as bTrue.
  pose (bFalse bTrue) as CONTRA.
  contradiction CONTRA.
Qed.

Lemma LongerTollens: 
    forall a b c: Prop, 
    (a -> (b\/c)) -> ~(b\/c) -> ~a.
Proof. 
  intros a b c. 
  pose (ModusTollens a (b \/ c)) as H.
  exact H.
Qed.



Lemma DisjunctiveSyllogism: 
    forall a b: Prop, (a \/ b) -> ~a -> b.
Proof.
  intros a b.
  intros aORb.
  unfold not.
  intros aFalse.
  destruct aORb as [aTrue | bTrue].
  (* Case 1: a is true *)
  pose (aFalse aTrue) as CONTRA.
  contradiction CONTRA.
  (* Case 2: b is true *)
  exact bTrue.
Qed.


Lemma AdditionSyllogism: 
    forall a b: Prop, a -> a \/ b.
Proof.
  intros a b.
  intros aTrue.
  left; exact aTrue.
Qed.


Lemma ConjunctionSyllogism: 
    forall a b: Prop, a -> b -> a /\ b.
Proof.
  intros a b.
  intros aTrue.
  intros bTrue.
  split.
  exact aTrue.
  exact bTrue.
Qed.


Lemma ResolutionSyllogism: 
    forall a b c: Prop, a \/ b -> ~a \/ c -> b \/ c.
Proof.
  intros a b c.
  intros H1.
  intros H2.
  destruct H1 as [aTrue | bTrue].
  destruct H2 as [aFalse | cTrue].
  pose (aFalse aTrue) as CONTRA.
  contradiction CONTRA.
  right; exact cTrue.
  destruct H2 as [aFalse | cTrue].
  left; exact bTrue.
  right; exact cTrue.
Qed.





