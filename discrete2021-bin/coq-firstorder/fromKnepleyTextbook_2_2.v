(** 
#<a href="../../discrete2021/assignments.html">Back to Discrete Assignments</a>#
*)

(** 
This file contains all proofs taken from
SUNY Buffalo CSE 191 Course (by Knepley):
https://cse.buffalo.edu/~knepley/classes/cse191/ClassNotes.pdf
Pages 38-43
*)

(** ** Ch2_3: Statements on Predicate Logic *)

Section Pred_Examples.

Variables A : Set.

Variables P Q : A->Prop.

Lemma ex_dist_or_for : (exists x:A, P x \/ Q x) -> (exists x:A, P x) \/ (exists x:A, Q x).
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


End Pred_Examples.



