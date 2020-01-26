(** #<a href="../../discrete/assignments.html">Back to Discrete Assignments</a># *)

(** ** This is a training file to try out some proofs similar to Coq Assignment 1. 
In this task replace all stubs "tauto" and "Admitted" with meaningful proofs.
*)

(** ** Do not modify this line: training1_0 *)

Lemma training1_0: forall a:Prop, a -> ~~a.
Proof. 
   intros a. 
   intros H.  (* aTrue *)
   unfold not.
   intros H1.  (* aFalse *)
   apply H1 in H as H2. 
(* This is the same thing
   pose (H1 H) as CONTRA.
*)
   contradiction H2.
Qed.

Require Import Classical_Prop.

Print Classical_Prop.



Lemma training1_0a: forall a:Prop, ~~a -> a.
Proof. 
  intros a.
  unfold not.
  intros H.
  pose (classic a) as EM.
  destruct EM as [H1 | H2].
  exact H1.
  pose (H H2) as CONTRA.
  contradiction CONTRA.
Qed.


Lemma training1_0b: forall a b:Prop, 
   (~a -> b) -> (a \/ b).
Proof. 
  intros a b.
  intros H.
  pose (classic a) as EM.
  destruct EM as [H1 | H2].
  left.
  exact H1.
  pose (H H2) as bTrue.
  right. 
  exact bTrue.
Qed.


Variable a b: Prop.
Check a. 
Check a -> b.

Lemma avb: forall a b: Prop, 
  (a \/ b) -> (~a -> b).
Proof. 
  intros a b. 
  intros H.
  intros H1.
  destruct H as [aTrue | bTrue]. 
  contradiction.
  exact bTrue.
Qed.





(* auto; 
contradiction; 

pose (aFalse aTrue) as CONTRA; 
*)


Show Script.


Le
mma sample1_3: forall a b: Prop, ((a -> b) -> a) -> a.
Proof.
   intuition.
Qed.


(*
  Admitted.
*)



(*
  intros a.
  unfold not.
  intros aTrue.
  intros aFalse.
  apply aFalse.
  exact aTrue.
Qed.
*)



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
  tauto.
Qed.

(** ** Do not modify this line: training1_4 *)

Lemma training1_4: forall a b:Prop, a -> (b -> a).
Proof.
  tauto.
Qed.

(** ** Do not modify this line: training1_5 *)

Lemma training1_5: forall a b:Prop, a /\ b -> a.
Proof.
  tauto.
Qed.

(** ** Do not modify this line: training1_6 *)

Lemma training1_6: forall a b:Prop, a -> (a \/ b).
Proof.
  tauto.
Qed.

(** ** Do not modify this line: training1_7 *)

Lemma training1_7: forall a b:Prop, (~b -> ~a) -> (a -> b).
Proof.
  Admitted.

(** ** Do not modify this line: training1_8 *)

Lemma training1_8: forall a b:Prop, (a -> b) -> (~b -> ~a).
Proof.
  tauto.
Qed.

(** ** Do not modify this line: training1_9 *)

Lemma training1_9: forall a b:Prop, a -> (b -> (a /\ b)).
Proof.
  tauto.
Qed.

(** ** Do not modify this line: training1_10 *)

Lemma training1_10: forall a b:Prop, a -> (~a -> b).
Proof.
  tauto.
Qed.




