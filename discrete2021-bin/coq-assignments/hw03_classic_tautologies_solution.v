(** 
#<a href="../../discrete2021/assignments.html">Back to Discrete Assignments</a>#
*)

(** ** The solution of H3.P5 *) 

Require Import Classical_Prop.

Lemma ImplToDisjClassic: forall a b: Prop, (a -> b) -> (~a \/ b).
Proof.
  intros a b.
  intros H.
  pose (classic a) as H2.
  destruct H2 as [aTrue|aFalse].
  right. 
  apply H.
  exact aTrue.
  left. 
  exact aFalse.
Qed.

(** Pierce Law Using Classic axiom *)
Lemma PeirceLaw1: 
    forall a b: Prop, ((a -> b) -> a) -> a.
Proof. 
  intros a b.
  intros H.
  pose (classic a) as H4.
  destruct H4 as [aTrue|aFalse].
  exact aTrue.
  unfold not in aFalse.
  apply H.
  intros H5.
  contradiction (aFalse H5).
Qed.


(** Pierce Law Using NNPP *)
Lemma Peirce_Law2: 
    forall a b: Prop, ((a -> b) -> a) -> a.
Proof.
  intros a b.
  intros H1.
  apply NNPP.
  unfold not.
  intros aFalse.
  apply aFalse.
  apply H1.
  intros aTrue.
  contradiction (aFalse aTrue).
Qed.


(** NNPP using Classic *)
Lemma NNPPUsingClassic:
    forall a: Prop, ~~a -> a.
Proof.
  intros a. 
  intros H.
  unfold not in H.
  pose (classic a) as H2.
  destruct H2 as [aTrue|aFalse].
  exact aTrue.
  pose (H aFalse) as H3.
  contradiction H3.
Qed.


