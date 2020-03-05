(** #<a href="../../discrete/coq.html">Back to Coq Main Page</a>#  *)

(** * LT.RAJ.2020.9-10.5 *)

(** #<b>Problem:</b># A positive integer n is divided by 1, 2, 3, ..., n. The respective remainders
are denoted by r_1, r_2, r_3, ..., r_n (if n is divisible by k, then r_k = 0). 
The total of all n remainders equals 2n. 
Find all possible values of the number n. 
*)
(** See #<a href='https://bit.ly/38i3HIp'>LT.RAJ #
#Užduotys ir Sprendimai</a>#, p.24.).
*)



Require Import Nat.
Require Import PeanoNat.

Compute (17 mod 3).


Fixpoint rem_sum (k:nat) (n:nat): nat :=
  match k with 
  | 0 => 0
  | S k' => (rem_sum k' n) + (n mod k)
  end.

Definition rem_total (n:nat):nat := rem_sum n n.


(** 1 + 2 + 3 + 1 + 5 + 4 + 3 + 2 + 1 = 
Compute (rem_total 1).
Compute (rem_total 2).
Compute (rem_total 3).
Compute (rem_total 4).
Compute (rem_total 5).
Compute (rem_total 6).
Compute (rem_total 7).
Compute (rem_total 8).
Compute (rem_total 9).
Compute (rem_total 10).
Compute (rem_total 11).
Compute (rem_total 12).
Compute (rem_total 13).
Compute (rem_total 14).
Compute (rem_total 15).
Compute (rem_total 16).
Compute (rem_total 17).
Compute (rem_total 18).
Compute (rem_total 19).
Compute (rem_total 20).
*)

Theorem lt_raj_2020_09_5: forall n:nat, 
  (rem_total n = 2*n) -> n = 11.
Proof. 
  Admitted.

