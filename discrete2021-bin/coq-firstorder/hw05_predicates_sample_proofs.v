(** 
#<a href="../../discrete2021/assignments.html">Back to Discrete Assignments</a>#
*)

Section Predicate_Logic_Examples.

(* A is a nonempty set (containing element 'something' *)
Variables A : Set.
Variables something: A.
(* Assume that P,Q are 1-argument predicates defined on A *)
Variables P Q : A->Prop. 



Require Import Classical_Prop.



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



(* 
Can inspect all the available logic axioms: 

https://github.com/coq/coq/tree/master/theories/Logic
https://github.com/coq/coq/blob/master/theories/Logic/Classical.v
https://github.com/coq/coq/blob/master/theories/Logic/Classical_Pred_Type.v

~ (forall n:U, P n) ->  exists n : U, ~ P n.
*)

Require Import Classical.


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



End Predicate_Logic_Examples.


