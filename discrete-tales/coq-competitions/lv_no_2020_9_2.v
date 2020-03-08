(** #<a href="../../discrete/coq.html">Back to Coq Main Page</a>#  *)

(** * LV.NO.2020.9.2 *)

(** See #<a href='https://bit.ly/2VLBCH8'>LV Regional 
Olympiad Problems</a>#. *)

(** #<b>Problem:</b># Show that 1/(1*3) + 1/(3*5) + 1/(5*7) + ... + 
1/(2019*2021) = 1010/2021.
*)


Require Import Field.
Require Import QArith.
Require Import Znumtheory.
Require Import Eqdep_dec.

Open Scope Q_scope.

Fixpoint get_odd (k:nat):positive :=
  match k with 
  | 0%nat => 1%positive
  | S k' => (get_odd k') + 2
  end.

Print positive.

Compute (xI 4%positive).

Compute (Pos.of_nat 1%nat).

Fixpoint SeqA (k:nat):Q :=
  match k with 
  | 0%nat => 0
  | S k' => Qred ((SeqA k') + 
    (1#((2*(Pos.of_nat k)-1)*(2*(Pos.of_nat k)+1))))
  end.

Compute (SeqA 4).

Theorem lv_no_2020_9_2: SeqA 1010 = 1010#2021.
Proof. 
  Admitted.




Close Scope Q_scope.