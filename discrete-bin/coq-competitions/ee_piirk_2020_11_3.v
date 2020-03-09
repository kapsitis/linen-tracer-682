(** #<a href="../../discrete/coq.html">Back to Coq Main Page</a>#  *)

(** * EE.PIIRK.2020.11.3 *)


(** #<b>Problem:</b># Do there exist two 2-digit positive integers
such that their sum and their product 
can be obtained from each other by reversing the order of
their digits?
*)

(** See #<a href='https://bit.ly/32OWgHH'>Piirkonnavoor 2020</a>#, 
page p.10, p.22.
*)


Require Import Nat.
Require Import PeanoNat.
Require Import Arith Psatz.

Require Import ZArith.
Require Import Znumtheory.
Require Import BinInt.
Require Import BinIntDef.
Require Export BinNums.
Require Import BinPos BinNat.

Require Import Datatypes.
Require Import Decimal DecimalFacts.
Require Import DecimalNat.


Add LoadPath "/home/kalvis/workspace-osx/coq/theory/Init".

(**
https://blog.zhen-zhang.com/2016/09/19/coq-dev.html
Require Import Decimal.
*)

Definition a:nat := 3%nat.

Definition b:uint := (D8 Nil).

Open Scope nat_scope.

Definition hd d :=
 match d with
 | Nil => 0
 | D0 _ => 0
 | D1 _ => 1
 | D2 _ => 2
 | D3 _ => 3
 | D4 _ => 4
 | D5 _ => 5
 | D6 _ => 6
 | D7 _ => 7
 | D8 _ => 8
 | D9 _ => 9
end.

Definition tl d :=
 match d with
 | Nil => d
 | D0 d | D1 d | D2 d | D3 d | D4 d | D5 d | D6 d | D7 d | D8 d | D9 d => d
end.

(** Number of digits *)
Fixpoint usize (d:uint) : nat :=
  match d with
  | Nil => 0
  | D0 d => S (usize d)
  | D1 d => S (usize d)
  | D2 d => S (usize d)
  | D3 d => S (usize d)
  | D4 d => S (usize d)
  | D5 d => S (usize d)
  | D6 d => S (usize d)
  | D7 d => S (usize d)
  | D8 d => S (usize d)
  | D9 d => S (usize d)
  end.

(*
Fixpoint to_lu n :=
 match n with
 | 0 => Decimal.zero
 | S n => Little.succ (to_lu n)
 end.
*)

Fixpoint append (L1 L2 : uint) : uint :=
  match L1 with
  | Nil => L2
  | D0 d => D0 (append d L2)
  | D1 d => D1 (append d L2)
  | D2 d => D2 (append d L2)
  | D3 d => D3 (append d L2)
  | D4 d => D4 (append d L2)
  | D5 d => D5 (append d L2)
  | D6 d => D6 (append d L2)
  | D7 d => D7 (append d L2)
  | D8 d => D8 (append d L2)
  | D9 d => D9 (append d L2)
  end.

Compute (append 200%uint 2002%uint).



Notation "x ++ y" := (append x y)
                     (right associativity, at level 60).


Fixpoint rev (d:uint) : uint :=
  match d with
  | Nil => Nil
  | D0 d => append (rev d) (D0 Nil)
  | D1 d => append (rev d) (D1 Nil)
  | D2 d => append (rev d) (D2 Nil)
  | D3 d => append (rev d) (D3 Nil)
  | D4 d => append (rev d) (D4 Nil)
  | D5 d => append (rev d) (D5 Nil)
  | D6 d => append (rev d) (D6 Nil)
  | D7 d => append (rev d) (D7 Nil)
  | D8 d => append (rev d) (D8 Nil)
  | D9 d => append (rev d) (D9 Nil)
  end.


Compute (rev 1234%uint).

Compute (usize (to_uint 2002)).
Compute (of_uint (D8 (D9 Nil))).
Compute (of_uint (Nil)).

Compute (to_uint 2020%nat).


Lemma sample2: exists a:uint, usize a = 2 /\ rev a = a.
Proof. 
  exists 22%uint.
  split. 
  simpl. reflexivity.
  simpl. reflexivity.
Qed.

Theorem ee_piirk_2020_11_3: forall a b:nat, 
  usize (to_uint a) = 2 -> 
    usize (to_uint b) = 2 -> 
      of_uint (rev (to_uint (a + b))) <> a*b.
Proof. 
  Admitted.


