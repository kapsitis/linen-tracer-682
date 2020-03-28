(** #<a href="../../discrete/coq.html">Back to Discrete Assignments</a>#  *)

(** * Lab01: Proving Propositional Statements in Coq: Solutions *)

(** ** Do not modify this line: sample1_1 *)

Lemma sample1_1: forall a b: Prop, ~a -> (a -> b).
Proof.
  intros a b.
  unfold not.
  intros aFalse.
  intros aTrue.
  pose (aFalse aTrue) as CONTRA.
  contradiction CONTRA.
Qed.

(** ** Do not modify this line: sample1_2 *)

Lemma sample1_2: forall a b: Prop, a -> (~b -> ~(a -> b)).
Proof.
  intros a b.
  unfold not.
  intros aTrue bFalse.
  intros H.
  pose (H aTrue) as bTrue.
  pose (bFalse bTrue) as CONTRA.
  contradiction CONTRA.
Qed.


(** ** Do not modify this line: sample1_3 *)

Require Import Classical_Prop.

(*
https://coq.inria.fr/library/Coq.Logic.Classical_Prop.html
https://coq.inria.fr/tutorial/1-basic-predicate-calculus#sec11
*)




Lemma double_negation_elimination: forall a:Prop,
  ~~a -> a.
Proof. 
  intros a.
  unfold not.
  intros H1.
  pose (classic a) as H2.
  destruct H2 as [aTrue | aFalse].
  exact aTrue.
  absurd (~a); trivial.
Qed.


(*
Lemma not_imply_elim : forall P Q:Prop, ~ (P -> Q) -> P.
Proof.
intros; apply NNPP; red.
intro; apply H; intro; absurd P; trivial.
Qed.
*)



Lemma sample1_3_helper: forall a b: Prop, ~(a -> b) -> a.
Proof.
  intros a b.
  intros H1.
  apply double_negation_elimination.
  unfold not.
  intro H2.
  apply H1.
  intro aTrue.
  pose (H2 aTrue) as CONTRA.
  contradiction CONTRA.
Qed.


Lemma sample1_3: forall a b: Prop, ((a -> b) -> a) -> a.
Proof.
  intros a b.
  intros H1.
  pose (classic (a -> b)) as H2. 
  destruct H2 as [H3 | H4].
  apply H1.
  exact H3.
  pose (sample1_3_helper a b) as H5.
  apply H5.
  exact H4.
Qed. 



(** ** Do not modify this line: sample1_4 *)

Lemma sample1_4: forall a b: Prop, ~a -> (~b -> ~(a \/ b)).
Proof.
  intros a b.
  unfold not.
  intros aFalse.
  intros bFalse.
  intros aORb.
  destruct aORb as [aTrue | bTrue].
  pose (aFalse aTrue) as CONTRA1.
  exact CONTRA1.
  pose (bFalse bTrue) as CONTRA2.
  exact CONTRA2.
Qed.



(** ** Do not modify this line: sample1_5 *)

Lemma sample1_5: forall a b: Prop, ~(a /\ b) -> (b -> ~a).
Proof.
  intros a b.
  unfold not.
  intros H.
  intros bTrue.
  intros aTrue.
  apply H.
  split.
  exact aTrue.
  exact bTrue.
Qed.



(** ** Do not modify this line: sample1_6 *)

Lemma sample1_6: forall a b: Prop, (~b -> ~a) -> ((~b -> a) -> b).
Proof.
  intros a b.
  unfold not.
  intros H1.
  intros H2.
  pose (classic b) as H3.
  destruct H3 as [bTrue | bFalse].
  exact bTrue.
  pose (H1 bFalse) as aFalse.
  pose (H2 bFalse) as aTrue.
  pose (aFalse aTrue) as CONTRA.
  contradiction CONTRA.
Qed.



(** ** Do not modify this line: sample1_7 *)

Lemma sample1_7: forall a b: Prop, (a -> b) -> ((~a -> b) -> b).
Proof.
  intros a b.
  intros H1.
  intros H2.
  pose (classic a) as H3.
  destruct H3 as [aTrue | aFalse].
  apply H1.
  exact aTrue.
  apply H2.
  exact aFalse.
Qed.


(** ** Do not modify this line: sample1_8 *)

Lemma sample1_8: forall a b: Prop, (a -> b) -> ((a -> ~b) -> ~a).
Proof.
  intros a b.
  intros H1.
  intros H2.
  pose (classic a) as H3.
  destruct H3 as [aTrue | aFalse].
  pose (H1 aTrue) as bTrue.
  pose (H2 aTrue) as bFalse.
  pose (bFalse bTrue) as CONTRA.
  contradiction CONTRA.
  exact aFalse.
Qed.

(** ** Do not modify this line: sample1_9 *)

Lemma sample1_9: forall a b: Prop, (~b -> a) -> ((b -> a) -> a).
Proof.
  intros a b.
  unfold not.
  intros H1.
  intros H2.
  pose (classic b) as H3.
  destruct H3 as [bTrue | bFalse].
  pose (H2 bTrue) as aTrue.
  exact aTrue.
  pose (H1 bFalse) as aTrue.
  exact aTrue.
Qed.


(** ** Do not modify this line: sample1_10 *)
(* Difficult *)
Lemma sample1_10: forall a b: Prop, (a <-> b) -> (~a \/ b).
Proof.
  intros a b.
  intros H1.
(*
  unfold "<->" in H1.
  destruct H1 as [H2 H3]
*)
  destruct H1 as [H2 H3].
  pose (classic a) as H4.
  destruct H4 as [aTrue | aFalse].
  pose (H2 aTrue) as bTrue.
  right.
  exact bTrue.
  left.
  exact aFalse.
Qed.

(** ** Do not modify this line: sample1_11 *)

Lemma sample1_11: forall a b c: Prop, (a -> (b -> c)) -> ((a -> b) -> (a -> c)). 
Proof.
  intros a b c.
  intros H1.
  intros H2.
  intros aTrue.
  pose (H1 aTrue) as H3.
  pose (H2 aTrue) as bTrue.
  pose (H3 bTrue) as cTrue.
  exact cTrue.
Qed.


(** ** Do not modify this line: sample1_12 *)

Lemma sample1_12: forall a b c: Prop, (a -> (b -> c)) <-> ((a /\ b) -> c).
Proof.
  intros a b c.
  split.
  intros H1.
  intros [aTrue bTrue].
  pose (H1 aTrue bTrue) as cTrue.
  exact cTrue.
  intros H2.
  intros aTrue bTrue.
  assert (a /\ b) as H3.
  split.
  exact aTrue.
  exact bTrue.
  pose (H2 H3) as cTrue.
  exact cTrue.
Qed.

(** ** Do not modify this line: sample1_13 *)

Lemma sample1_13: forall a b c: Prop, (a -> c) -> ((b -> c) -> ((a \/ b) -> c)). 
Proof.
  intros a b c.
  intros H1.
  intros H2.
  intros aORb.
  destruct aORb as [aTrue | bTrue].
  pose (H1 aTrue) as cTrue.
  exact cTrue.
  pose (H2 bTrue) as cTrue.
  exact cTrue.
Qed.


(** ** Do not modify this line: sample1_14 *)

Lemma sample1_14: forall a b c: Prop, (a -> b) -> ((c -> a) -> (c -> b)).
Proof.
  intros a b c.
  intros H1.
  intros H2.
  intros cTrue.
  pose (H2 cTrue) as aTrue.
  pose (H1 aTrue) as bTrue.
  exact bTrue.
Qed.



(** ** Do not modify this line: sample1_15 *)

Lemma sample1_15: forall a b c: Prop, a \/ (b \/ c) -> ((b \/ (a \/ c)) \/ a).
Proof.
  intros a b c.
  intros H1.
  destruct H1 as [H2 | H3].
  right; exact H2.
  destruct H3 as [H4 | H5].
  left; left; exact H4.
  left; right; right; exact H5.
Qed.


(** ** Do not modify this line: sample1_16 *)

Lemma sample1_16: forall a b c: Prop, (a -> (b -> c)) -> (b -> (a -> c)).
Proof.
  intros a b c. 
  intros H.
  intros bTrue.
  intros aTrue.
  pose (H aTrue) as H2.
  pose (H2 bTrue) as cTrue.
  exact cTrue.
Qed.

(** ** Do not modify this line: sample1_17 *)

Lemma sample1_17: forall a b c: Prop, (c -> a) -> ((a -> b) -> (c -> b)).
Proof.
  intros a b c.
  intros H1.
  intros H2.
  intros cTrue.
  apply H2.
  apply H1.
  exact cTrue.
Qed.

(** ** Do not modify this line: sample1_18 *)

Lemma sample1_18: forall a b c: Prop, ((a /\ b) -> c) -> (a -> (b -> c)).
Proof.
  intros a b c.
  intros H1.
  intros aTrue.
  intros bTrue.
  assert (a /\ b) as aANDb.
  split.
  exact aTrue.
  exact bTrue.
  apply H1.
  exact aANDb.
Qed.

(** ** Do not modify this line: sample1_19 *)

Lemma sample1_19: forall a b c: Prop, (a -> b /\ c) <-> (a -> b) /\ (a -> c).
Proof.
  intros a b c.
  split.
  intros H.
  split.
  intros aTrue.
  pose (H aTrue) as bANDc.
  destruct bANDc as [bTrue cTrue].
  exact bTrue.
  intros aTrue.
  pose (H aTrue) as bANDc.
  destruct bANDc as [bTrue cTrue].
  exact cTrue.
  intros H2.
  destruct H2 as [H3 H4].
  intros aTrue.
  pose (H3 aTrue) as bTrue.
  pose (H4 aTrue) as cTrue.
  split. 
  exact bTrue.
  exact cTrue.
Qed.



(** ** Do not modify this line: sample1_20 *)
(* Difficult *)

Theorem hard_contrapos: forall a b:Prop, (~b -> ~a) -> (a->b).
Proof. 
  intros a b.
  intros H1.
  intros aTrue.
  destruct (classic b) as [bTrue | bFalse].
  exact bTrue.
  pose (H1 bFalse) as aFalse.
  contradiction.
Qed.


Lemma sample1_20_helper2: forall a b c d e: Prop, 
    ((((a -> b) -> (~c -> ~d)) -> c) -> e) -> ~a -> (d -> e).
Proof. 
  intros a b c d e.
  intros H1.
  intros aFalse.
  intros H3.
  assert (((a -> b) -> ~ c -> ~ d) -> c) as H4.
  intros H5.
  assert (a -> b) as H6.
  intros aTrue.
  pose (aFalse aTrue) as CONTRA.
  contradiction CONTRA.
  pose (H5 H6) as H7.
  pose (hard_contrapos d c) as H8.
  apply H8.
  exact H7.
  exact H3.
  apply H1.
  exact H4.
Qed.


Lemma sample1_20: forall a b c d e: Prop, 
    ((((a -> b) -> (~c -> ~d)) -> c) -> e) -> ((e -> a) -> (d -> a)).
Proof.
  intros a b c d e.
  intros H1.
  intros H2.
  intros dTrue.
  destruct (classic a) as [aTrue | aFalse]. 
  exact aTrue.
  pose (sample1_20_helper2 a b c d e) as H3.
  pose (H3 H1) as H4.
  pose (H4 aFalse) as H5.
  pose (H5 dTrue) as eTrue.
  pose (H2 eTrue) as aTrue.
  exact aTrue.
Qed.   













