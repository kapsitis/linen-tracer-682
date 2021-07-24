(** 
#<a href="../../discrete2021/assignments.html">Back to Discrete Assignments</a>#
*)

(**
This file contains all the tautologies taken from the
SUNY Buffalo CSE 191 Course (by Knepley):
#<a href="https://cse.buffalo.edu/~knepley/classes/cse191/ClassNotes.pdf">https://cse.buffalo.edu/~knepley/classes/cse191/ClassNotes.pdf</a>#,
Pages 13-25

See also - for more guidance how to prove tautologies.
#<a href="https://coq.inria.fr/tutorial/1-basic-predicate-calculus">https://coq.inria.fr/tutorial/1-basic-predicate-calculus</a>#
*)

(** ** Ch1_4: Simple Tautologies *)  

Lemma id_P : forall P : Prop, P -> P.
Proof. 
  intro P.
  intro p.
  exact p.
Qed.


Lemma imp_trans : forall P Q R : Prop, (P->Q)->(Q->R)->P->R.
Proof. 
  intros P Q R.
  intros pIMPLq qIMPLr p.
  apply qIMPLr.
  apply pIMPLq.
  exact p.
Qed.


Lemma and_comm : forall P Q : Prop, (P /\ Q) -> (Q /\ P).
Proof. 
  intros P Q.
  intro pq.
  destruct pq as [p q].
  split.
  exact q.
  exact p.
Qed.


Lemma or_comm : forall P Q : Prop, (P \/ Q) -> (Q \/ P).
Proof. 
  intros P Q.
  intro pq.
  destruct pq as [p | q].
  right.
  exact p.
  left.
  exact q.
Qed.


Lemma noncon : forall P : Prop, ~(P /\ ~P).
Proof.
  intro P.
  unfold not.
  intro H.
  destruct H as [p np].
  apply np. 
  exact p.
Qed.


Lemma modus_ponens : forall P Q : Prop, P -> (P -> Q) -> Q.
Proof. 
  intros P Q.
  intros p pIMPLq.
  apply pIMPLq.
  exact p.
Qed.


Print modus_ponens.


Lemma modus_ponens_2 : forall P Q : Prop, P -> (P -> Q) -> Q.
Proof. 
  intros P Q p pIMPLq.
  apply pIMPLq in p as q.
  exact q.
Qed.


Print modus_ponens_2.

Lemma noncon3 : forall P : Prop, ~(P /\ ~P).
Proof. 
  intros P H.
  destruct H as [p np].
  contradiction.
Qed.



Lemma noncon4 : forall P : Prop, ~(P /\ ~P).
Proof. 
  intros P H.
  destruct H as [p np].
  elim np.
  exact p.
Qed.


(* Conditional Identity *)
Lemma cond_ident : forall P Q : Prop, (~P \/ Q) -> (P -> Q).
Proof. 
  intros P Q H p.
  destruct H as [np | q].
  contradiction.
  exact q.
Qed.



(* 1.4.1 *)

Lemma prob3a : forall P Q R : Prop, (P /\ Q) -> (P \/ R).
Proof. 
  intros P Q R pq.
  destruct pq as [p q].
  left.
  exact p.
Qed.


Lemma prob3b : forall P R : Prop, P->(R->P).
Proof. 
  intros P R p r.
  exact p.
Qed.




