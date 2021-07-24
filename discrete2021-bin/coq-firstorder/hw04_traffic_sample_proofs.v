(** 
#<a href="../../discrete2021/assignments.html">Back to Discrete Assignments</a>#
*)


Section traffic.

(* 
'Inductive' type means that there are no other cities 
except those listed as A,B,C. 
Use 'closed world assumption': all cities can be 
analyzed by considering just three cases. *)

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



(* Sample1: For any city there exists a different city *)
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


(* Sample2: There exist two cities that do not have a direct plane link *)
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


(* Sample3: For any city 'x' there is a city 'y' such that there is rail
link between the two. *)
Lemma Sample3: forall (x:City), exists (y: City), Rail(x,y).
Proof.
  intros x. 
  induction x.
  exists B. exact RailLink1.
  exists C. exact RailLink3.
  exists A. exact RailLink4.
Qed.

End traffic.

