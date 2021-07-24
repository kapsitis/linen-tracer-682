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



(** ** Warmup Exercises *)

(** #<b>Sample Statement 1:</b># For any city there exists a different city *)
Lemma Sample1: forall (x: City), exists (y:City), x<>y.
Proof. 
  Admitted.


(** #<b>Sample Statement 2:</b># There exist two cities that do not have a direct plane link *)
Lemma Sample2: exists (x:City) (y: City), ~Plane(x,y).
Proof.
  Admitted.


(** #<b>Sample Statement 3:</b>#  For any city 'x' there is a city 'y' such that there is rail
link between the two. *)
Lemma Sample3: forall (x:City), exists (y: City), Rail(x,y).
Proof.
  Admitted.


(** ** Problems in H4.Q5 *)


(** #<b>H4.Q5.Lemma1:</b># From any city there is a direct plane-link to some other city. *)
Lemma L1: forall (x: City), exists (y: City), (x<>y /\ Plane(x,y)).
Proof. 
  Admitted.

(** #<b>H4.Q5.Lemma2:</b># From any city one can go to any other city in two steps like this: First take a
plane-link and then take a rail-link. *)
Lemma L2: ~(forall (x:City) (y:City), exists (z:City), (Plane(x,z) /\ Rail(z,y))).
Proof. 
  Admitted.


(** #<b>H4.Q5.Lemma3:</b># From any city one can go to any other city in two steps like this: First take a
plane-link and then take a rail-link. *)
Lemma L3: ~(forall x y z:City, (Plane(x,z) /\ Plane(z,y) -> Plane(x,y))).
  Admitted.


End Homework4_Problems.


