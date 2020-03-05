(** #<a href="../../discrete/coq.html">Back to Coq Main Page</a>#  *)

(** * LT.RAJ.2020.11-12.3 *)

(** #<b>Problem:</b># Daina cut a piece of paper into 
n>1 smaller pieces and wrote numbers 
1, 2, 3, ..., 14 to those pieces - using 
every number exactly once. 
It turned out that the totals of the numbers on all the pieces
were the same (no piece of paper was left empty; but if a 
piece contains just one number, then the total equals that number). 
Find all possible values of n. 
*)

(** See #<a href='https://bit.ly/38i3HIp'>LT.RAJ #
#Užduotys ir Sprendimai</a>#, p.24.).
*)

(** The answer is this: n=3, 5, 7. *)
(**
If the sum s = 15, then n = 7. 
The numbers on the 7 pieces can be the following: 
(1, 14); (2, 13); (3, 12); (4, 11_; (5, 10); (6, 9); (7, 8).
*)
(**
If the sum s = 21, then n = 5. 
The numbers on the 5 pieces can be the following: 
(1, 7, 13); (2, 5, 14); (3, 6, 12); (10, 11); (4, 8, 9).
*)
(**
If the sum s = 35, then n = 3. 
The numbers on the 3 pieces can be the following: 
(8, 13, 14); (2, 10, 11, 12); (1, 3, 4, 5, 6, 7, 9).
*)



Require Import Nat.
Require Import PeanoNat.
Require Import Between.

Open Scope nat_scope.

Record ordinal n := {
    val :> nat;
    _   : val < n;
}.


Lemma easy: forall n:(ordinal 14), n*n <200.
Proof. 
  intros n.
  destruct n.
Admitted.



(*
Theorem lt_raj_2020_11_3: forall (n:nat)
  (k:(forall n:Z, 0 <= n < p)) 
*)