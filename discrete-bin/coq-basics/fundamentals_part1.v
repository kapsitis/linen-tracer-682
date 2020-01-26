(** #<a href="../../discrete/assignments.html">Back to Discrete Assignments</a># *)

(** * Defining Functions and checking values and types *) 

(** These examples are adapted from 



Inductive day : Type :=
  | monday
  | tuesday
  | wednesday
  | thursday
  | friday
  | saturday
  | sunday.

Definition next_weekday (d:day) : day :=
  match d with
  | monday => tuesday
  | tuesday => wednesday
  | wednesday => thursday
  | thursday => friday
  | friday => monday
  | saturday => monday
  | sunday => monday
  end.

Compute (next_weekday friday).
Eval compute in (next_weekday friday).

Example test_next_weekday: (next_weekday (next_weekday saturday)) = tuesday.
Proof. 
  simpl.
  reflexivity. 
Qed. 



Eval compute in (3+4).
Eval compute in (3=5).

Check 3 = 3.
Compute (3 = 3).
Check (forall n m: nat, n+m = m+n).

Theorem plus_2_2_is_4 : 2 + 2 = 4.
Proof. 
  reflexivity.

Check @eq.

Definition is_three (n : nat) : Prop := n = 3.


Definition injective {A B} (f : A -> B) :=
  forall x y : A, f x = f y -> x = y.

Lemma succ_inj : injective S.
Proof. 
  intros n m H.
  injection H as H1.
  apply H1.
Qed.

Example and_exercise :
  forall n m : nat, n + m = 0 -> n = 0 /\ m = 0.
Proof.
  intros.
  split.







