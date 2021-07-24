Require Import Classical_Prop.

Lemma PeirceLaw1: 
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

Lemma PeirceLaw2: 
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
