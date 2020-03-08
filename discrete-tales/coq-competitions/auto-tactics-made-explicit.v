(*
https://stackoverflow.com/questions/35473630/how-to-simplify-a-0-0-into-a-0
*)

Require Import Arith.
Theorem add_increase: (forall a b: nat, a > 0 -> a + b > b).
  destruct a; intros b H.
  - inversion H.  (* base case, H: 0 > 0 *)
  - simpl. auto using le_lt_n_Sm, le_plus_r.
Qed.

Print add_increase.
SearchRewrite (gt_le_S _).

