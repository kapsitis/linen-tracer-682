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

Add LoadPath "/home/kalvis/workspace-osx/coq/theory/Init".

(**
https://blog.zhen-zhang.com/2016/09/19/coq-dev.html
Require Import Decimal.
*)

