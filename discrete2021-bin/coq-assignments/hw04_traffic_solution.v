(** 
#<a href="../../discrete2021/assignments.html">Back to Discrete Assignments</a>#
*)

(** ** Initial Definitions *) 

Section Homework4_Problems. 

(** 'Inductive' type means that there are no other cities 
except those listed as A,B,C. 
Use 'closed world assumption': all cities can be 
analyzed by considering just three cases. 
*)

Inductive City : Type := 
  | A 
  | B 
  | C.

Variable Plane : City*City -> Prop.
Variable Rail: City*City -> Prop. 

Hypothesis PlaneLinks: forall x y:City, x<>y <-> Plane(x,y).
Hypothesis RailLink1: Rail(A,B). 
Hypothesis RailLink2: Rail(B,A). 
Hypothesis RailLink3: Rail(B,C). 
Hypothesis RailLink4: Rail(C,A). 
Hypothesis RailLink5: ~Rail(A,A). 
Hypothesis RailLink6: ~Rail(A,C). 
Hypothesis RailLink7: ~Rail(B,B). 
Hypothesis RailLink8: ~Rail(C,B). 
Hypothesis RailLink9: ~Rail(C,C). 

(** ** The solution of Warmup Exercises *)

(** #<b>Sample Statement 1:</b># For any city there exists a different city *)
Lemma Sample1: forall (x: City), exists (y:City), x<>y.
Proof. 
  intros x.
  induction x.
  exists B.
  discriminate.
  exists C.
  discriminate.
  exists A.
  discriminate.
Qed.


(** #<b>Sample Statement 2:</b># There exist two cities that do not have a direct plane link *)
Lemma Sample2: exists (x:City) (y: City), ~Plane(x,y).
Proof.
  exists A.
  exists A.
  intros H0.
  destruct (PlaneLinks A A) as [_ H1].
  pose (H1 H0) as H2.
  unfold not in H2.
  assert (A=A) as H3.
  reflexivity. 
  contradiction (H2 H3).
Qed.


(** #<b>Sample Statement 3:</b>#  For any city 'x' there is a city 'y' such that there is rail
link between the two. *)
Lemma Sample3: forall (x:City), exists (y: City), Rail(x,y).
Proof.
  intros x. 
  induction x.
  exists B. exact RailLink1.
  exists C. exact RailLink3.
  exists A. exact RailLink4.
Qed.


(** ** The solution of H4.Q5 *)


(** #<b>H4.Q5.Lemma1:</b># From any city there is a direct plane-link to some other city. *)
Lemma L1: forall (x: City), exists (y: City), (x<>y /\ Plane(x,y)).
Proof. 
  intros x. 
  pose (Sample1 x) as H1.
  destruct H1 as [y H2].
  exists y.
  split.
  exact H2.
  destruct (PlaneLinks x y) as [H3 _].
  apply (H3).
  exact H2.
Qed.


(** #<b>H4.Q5.Lemma2:</b># From any city one can go to any other city in two steps like this: First take a
plane-link and then take a rail-link. *)
Lemma L2: ~(forall (x:City) (y:City), exists (z:City), (Plane(x,z) /\ Rail(z,y))).
Proof. 
  unfold not. 
  intros H0.
  pose (H0 B C) as H2.
  assert (~Plane(B,B)). 
  assert (~(B<>B)).
  unfold not.
  intros HH.
  assert (B=B).
  reflexivity.
  contradiction (HH H).
  intros H3.
  pose (PlaneLinks B B) as H4.
  destruct H4 as [H5 H6].
  contradiction (H (H6 H3)).
  destruct H2 as [i IH].
  destruct IH as [IHPlane IHRail].
  assert (i<>B).
  intros H7.
  rewrite H7 in IHPlane.
  contradiction (H IHPlane).
  induction i.
  contradiction (RailLink6 IHRail).
  contradiction (H IHPlane).
  contradiction (RailLink9 IHRail).
Qed.


(** #<b>H4.Q5.Lemma3:</b># From any city one can go to any other city in two steps like this: First take a
plane-link and then take a rail-link. *)
Lemma L3: ~(forall x y z:City, (Plane(x,z) /\ Plane(z,y) -> Plane(x,y))).
  unfold not.
  intros H0.
  pose (H0 A A B) as H1.
  assert (A <> B) as H2.
  discriminate.
  destruct (PlaneLinks A B) as [H3 _].
  pose (H3 H2) as H4.
  assert (B <> A) as H5.
  discriminate.
  destruct (PlaneLinks B A) as [H6 _].
  pose (H6 H5) as H7.
  assert (Plane (A, B) /\ Plane (B, A)) as H8.
  split. 
  exact H4.
  exact H7.
  pose (H1 H8) as H9.
  destruct (PlaneLinks A A) as [_ H10].
  pose (H10 H9) as H11.
  assert (A = A) as H12.
  reflexivity.
  contradiction (H11 H12).
Qed.


End Homework4_Problems.


