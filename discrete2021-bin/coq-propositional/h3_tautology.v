Require Import Classical_Prop.


Lemma Sample5A: forall P Q: Prop, ~(~P /\ ~Q) -> P \/ Q.
Proof.
  intros P Q.
  intros H.
  apply NNPP.
  unfold not. 
  intros H2.
  unfold not in H.
  apply H. 
  split.
  intros H3.
  apply H2.
  left; exact H3.
  intros H4. 
  apply H2. 
  right; exact H4.
Qed.


Lemma Sample5B: forall P Q: Prop, (P -> Q) -> (~P \/ Q).
Proof.
  intros P Q. 
  intros H. 
  destruct (classic P) as [H2|H3].
  right. 
  apply (H H2).
  left. 
  exact H3.
Qed.


Lemma Sample5C: forall P Q: Prop, (P -> Q) <-> (~Q -> ~P).
Proof.
  intros P Q. 
  split. 
  - intros H. 
    intros H2.
    intros H3.
    contradiction (H2 (H H3)).
  - intros H4. 
    intros H5.
    apply NNPP. 
    intros H6.
    contradiction ((H4 H6) H5).
Qed.

