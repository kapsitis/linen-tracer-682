(** #<a href="../../discrete/coq.html">Back to Coq Main Page</a>#  *)

Definition is_zero (n:nat) :=
match n with
0 => true
| S p => false
end.


Eval compute in is_zero 0.
Print pred.
Print Nat.pred.

Eval compute in Nat.pred 17.


Fixpoint sum_n n :=
match n with
0 => 0
| S p => p + sum_n p
end.

Eval compute in sum_n 1.

Require Import List.

Check 1::2::3::nil.

Check (nil : list nat).

(*
Define a function that takes as input a number n and
returns a list with n elements, from 0 to n − 1.
*)

Fixpoint rangefun n :=
  match n with 
    0 => (nil: list nat)
    | S p => p :: (rangefun p)
  end.

Eval compute in rangefun 4.


Fixpoint first_n_aux (n:nat)(m:nat) :=
  match n with 
    0 => nil 
    | S p => m :: first_n_aux p (m+1) 
  end.

Eval compute in first_n_aux 2 0.

Definition first_n (n:nat) := first_n_aux n 0.

Eval compute in first_n 4.
