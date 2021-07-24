(** 
#<a href="../../discrete2021/assignments.html">Back to Discrete Assignments</a>#
*)

Require Import Classical.
Require Import Classical_Prop.


Section Homework5_Problems.

(** A is a nonempty set (containing element 'something' *)
Variables A : Set.
Variables something: A.
(** Assume that P,Q are 1-argument predicates defined on A *)
Variables P Q : A->Prop. 



(** ** The solution of Warmup Exercises *)

Lemma ex_dist_or_for : (exists x:A, P x \/ Q x) -> (ex P) \/ (ex Q).
Proof. 
  intro H.
  destruct H.
  destruct H.
  left.
  exists x.
  assumption.
  right.
  exists x.
  assumption.
Qed.


Lemma demorgan_forall : (forall x : A, P x) -> ~ (exists y : A, ~P y).
Proof. 
  intro H.
  unfold not.
  intro.
  destruct H0.
  apply H0.
  apply H.
Qed.


(* Same proof done with shorthand *)
Lemma demorgan_forall2 : (forall x : A, P x) -> ~ (exists y : A, ~P y).
Proof. 
  intro H.
  intro H1.
  destruct H1.
  destruct H0.
  apply H.
Qed.





Lemma distribute_forall: 
    (forall (x:A), (P x) /\ (Q x)) <-> (forall (x:A),(P x)) /\ (forall (x:A), (Q x)).
Proof. 
  split.
  intros H.
  split. 
  intros x0.
  apply (H x0). 
  intros x1.
  apply (H x1).
  intros H.
  destruct H as [H1 H2].
  intros x2.
  split.
  apply (H1 x2).
  apply (H2 x2).
Qed.



(**
Can inspect all the available logic axioms: 

#<a href="https://github.com/coq/coq/tree/master/theories/Logic">(Logic folder)</a><br/>#
#<a href="https://github.com/coq/coq/blob/master/theories/Logic/Classical.v">Classical.v</a><br/>#
#<a href="https://github.com/coq/coq/blob/master/theories/Logic/Classical_Pred_Type.v">Classical_Pred_Type.v</a>#

This is the full text of Lemma #<tt>not_all_ex_not</tt># (see #<tt>Classical_Pred_Type.v</tt># - link above).
<<
~ (forall n:A, P n) ->  exists n : U, ~ P n.
>>
The next result uses this lemma.
*)



Lemma allIMPL_exIMPL: ((forall (x:A), (P x)) -> (forall (x:A), (Q x))) -> (exists (x:A), (P x) -> (Q x)).
Proof. 
  intros H.
  destruct (classic (forall x : A, P x)) as [AllP | NotAllP].
  pose (H AllP) as H2.
  exists something.
  intros H3.
  apply H2.
  pose (not_all_ex_not A P) as H2.
  pose (H2 NotAllP) as H3.
  destruct H3 as [n H4].
  exists n.
  intros H5.
  contradiction (H4 H5).
Qed.

(** If we do not want the lemma #<tt>not_all_ex_not</tt># from 
the Coq proof library #<tt>Classical_Pred_Type.v</tt>#, 
it is possible to prove it manually. See #<tt>notall_demorgan</tt># below. *)

Lemma notall_demorgan: ~ (forall x : A, P x) -> exists y, ~(P y). 
Proof. 
  intros H.
  unfold not in H.
  apply NNPP.
  unfold not.
  intros H2.
  apply H.
  intros x.
  elim (classic (P x)).
  intros H3. 
  exact H3.
  intros H4.
  assert (exists y : A, P y -> False).
  exists x.
  exact H4.
  contradiction (H2 H0).
Qed.  



(** ** The solution of H5.Q5 *)


(** #<b>H5.Q5.Lemma1:</b># Can distribute 'exists' quantifier over a disjunction *)
Lemma sample5_1: 
    (exists (y:A), (P y)) \/ (exists (y:A), (Q y)) <-> 
    exists (x:A), (P x) \/ (Q x).
Proof. 
  split. 
  intros H.
  destruct H as [H1 | H2].
  destruct H1 as [y H3].
  exists y. left. exact H3.
  destruct H2 as [y H3].
  exists y. right. exact H3.
  intros H.
  destruct H as [x H1].
  destruct H1 as [H2 | H3].
  left. exists x. exact H2.
  right. exists x. exact H3.
Qed.




(** #<b>H5.Q5.Lemma2:</b># Some variant of De Morgans law *)
Lemma sample5_2: (exists (x:A), ~~(P x)) <-> ~(forall (y:A), ~(P y)).
Proof. 
  split. 
  intros H.
  destruct H as [x H1].
  intros H2.
  pose (H2 x) as H3.
  contradiction (H1 H3).
  intros H.
  apply NNPP.
  intros H2.
  apply H.
  intros y. 
  intros H3.
  apply H2.
  exists y.
  intros H4.
  contradiction (H4 H3).
Qed.



(** #<b>H5.Q5.Lemma3:</b># If #<tt>(P x)</tt># always implies #<tt>(Q x)</tt>#, then the existence 
   of some #<tt>(P x0)</tt># leads to existence of some #<tt>(Q x1)</tt># *)
Lemma sample5_3: (forall (x:A), P x -> Q x) -> ((exists (x:A), (P x)) -> exists (x:A), (Q x)).
Proof. 
  intros H1. 
  intros H2.
  destruct H2 as [x1 H3].
  exists x1. 
  apply (H1 x1).
  exact H3.
Qed.




(** #<b>H5.Q5.Lemma4:</b>#  If P being true sometimes implies that also Q is true sometimes, 
   then there is some x0 for which (P x) implies (Q x) *)
(** #<b>Note:</b> This result would not be true, if set A is empty. It is the reason why 
element #<tt>something</tt># was introduced. *)

Lemma sample5_4: ((exists (x:A), (P x)) -> (exists (x:A), (Q x))) -> (exists (x:A), ((P x) -> (Q x))).
Proof.
  intros H.
  pose (classic (exists x : A, P x)) as H2.
  destruct H2 as [H3 | H4].
  pose (H H3) as H5.
  destruct H5 as [x0 H6].
  exists x0.
  intros H7.
  exact H6.
  exists something.
  intros H5.
  assert (exists x : A, P x).
  exists something.
  exact H5.
  contradiction (H4 H0).
Qed.



(** #<b>H5.Q5.Lemma5:</b>#  If P(x) always implies Q(x), and P(x) is always true, then Q(x) is always true. *)
Lemma sample5_5: (forall (x:A), ((P x) -> (Q x))) -> ((forall (x:A), (P x)) -> forall (x:A), (Q x)).
Proof. 
  intros H.
  intros H2.
  intros x.
  pose (H x) as Hx.
  pose (H2 x) as H2x.
  apply (Hx H2x).
Qed.



End Homework5_Problems.

