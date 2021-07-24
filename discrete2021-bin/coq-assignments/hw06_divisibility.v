(** 
#<a href="../../discrete2021/assignments.html">Back to Discrete Assignments</a>#
*)

(** ** Problems in H6.P5 *)

Require Import ZArith.
Require Import Znumtheory.

Section Homework6_Problems.

Open Scope Z_scope.

(** See Theorem1 (i), p.252 in the textbook *)
Lemma sample6_1: forall a b c:Z, (a | b) -> (a | c) -> (a | b+c).
Proof. 
  Admitted.


(** See Theorem1 (ii), p.252 in the textbook *)
Lemma sample6_2: forall a b c:Z, (a | b) -> (a | b*c).
Proof. 
  Admitted.


(** See Theorem1 (iii), p.252 in the textbook *)
Lemma sample6_3: forall a b c: Z, (a | b) -> (b | c) -> (a | c).
Proof. 
  Admitted.


(** See Theorem4, p.255 in the textbook *)
Lemma sample6_4_helper: forall a b m: Z, (m <> 0) ->
  ((a mod m) = (b mod m) -> (m | a - b)).
Proof.
  Admitted.


Lemma sample6_4: forall a b m: Z, (m <> 0) ->
    ((a mod m) = (b mod m) <-> (exists k:Z, a = b+k*m)).
Proof.
  Admitted.


Lemma sample6_5 : forall a b c : Z, (a|b) \/ (a|c) -> (a| b*c).
Proof. 
  Admitted.


(** ** Optional Corollary *)
(** Once the homework is proven, you can 
obtain useful corollaries. *)

Corollary divide_lincombination: 
    forall a b c m n, (a | b) /\ (a | c) -> (a | m*b + n*c).
Proof. 
  Admitted.


Close Scope Z_scope.

End Homework6_Problems.

