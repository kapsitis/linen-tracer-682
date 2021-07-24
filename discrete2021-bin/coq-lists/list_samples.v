(** #<a href="../../discrete/coq.html">Back to Coq Main Page</a>#  *)

(** * Lab02 Solutions *)


Require Import Nat.
Require Import PeanoNat.

Require Import ZArith.
Require Import Znumtheory.
Require Import BinInt.

Require Import Arith Psatz.

Open Scope nat_scope.

(** * Lemmas 11-15 are Properties of Lists of Non-Negative Integers *)

(** You do not need to modify anything in 
this intro section. These function definitions and notations
will be used below in samples 11 to 15. *)

Inductive natlist : Type :=
  | nil
  | cons (n : nat) (L : natlist).

Notation "x :: L" := (cons x L)
                     (at level 60, right associativity).
Notation "[ ]" := nil.

Notation "[ x ; .. ; y ]" := (cons x .. (cons y nil) ..).

(** The function repeats numbers. For example,
this should return the list #<tt>[5;5;5;5;5;5;5]</tt>#:
<<
  Compute (repeat 5 7).
>>
*)
Fixpoint repeat (n count : nat) : natlist :=
  match count with
  | O => nil
  | S count' => n :: (repeat n count')
  end.


(** The function returns the length of the list. For example, this should return 5:
<<
  Compute (length [1;2;4;8;16]).
>> 
*)
Fixpoint length (L:natlist) : nat :=
  match L with
  | nil => O
  | h :: t => S (length t)
  end.




(** The function appends one list at the end of another. For example, 
this should return #<tt>[1;2;4;8;16;3;5]</tt>#:
<<
  Compute (app [1;2;4;8;16] [3;5]).
>>
*)
Fixpoint app (L1 L2 : natlist) : natlist :=
  match L1 with
  | nil => L2
  | h :: t => h :: (app t L2)
  end.


(** Appending lists will be expressed as an infix operator #<tt>++</tt># *)
Notation "x ++ y" := (app x y)
                     (right associativity, at level 60).


(** The function to reverse a list. For example, #<tt>(rev [1,2,3])</tt># 
is #<tt>[3,2,1]</tt># *)
Fixpoint rev (L:natlist) : natlist :=
  match L with
  | nil => nil
  | h :: t => rev t ++ [h]
  end.

(** The function returns the list of all natural numbers from 1 to n. 
It is empty, if n=0 *)
Fixpoint rangeTo(n:nat): natlist :=
  match n with
  | 0 => []
  | (S n') => (rangeTo n') ++ [n]
  end.


Fixpoint nonzeros (l:natlist) : natlist := 
  match l with
  | nil => nil
  | 0 :: t => nonzeros(t)
  | h :: t => h :: nonzeros(t)
  end.

Example test_nonzeros:
  nonzeros [0;1;0;2;3;0;0] = [1;2;3].
Proof. 
  simpl. reflexivity.
Qed.



Fixpoint oddmembers (l:natlist) : natlist :=
  match l with
  | nil => nil
  | h :: t => if odd h
      then h :: oddmembers(t)
      else oddmembers(t)
  end.

Example test_oddmembers:
  oddmembers [0;1;0;2;3;0;0] = [1;3].
Proof. simpl. reflexivity. Qed.

Definition countoddmembers (l:natlist) : nat :=
  length (oddmembers l).

Example test_countoddmembers1:
  countoddmembers [1;0;3;1;4;5] = 4.
Proof. simpl. reflexivity. Qed.

Example test_countoddmembers2:
  countoddmembers [0;2;4] = 0.
Proof. simpl. reflexivity. Qed.

Example test_countoddmembers3:
  countoddmembers nil = 0.
Proof. simpl. reflexivity. Qed.





(** ** Do not modify this line: sample2_11 *)

(** See the Theorem #<tt>'rev_app_distr'</tt># from the Coq textbook
#<a href='https://bit.ly/2uuX1ZK'>Lists: Working with Structured Data</a>#. 
This lemma tells how to reverse a concatentation of two lists: 
#<tt>rev([1;2;4]++[7;11]) = [11;7]++[4;2;1].</tt>#
*)

Lemma concat_nil_r: forall L: natlist, L ++ [] = L.
Proof. 
  intros L.
  induction L as [| n LL IHL].
  simpl. reflexivity.
  simpl. 
  rewrite IHL.
  reflexivity.
Qed.

Lemma concat_h_tail_tail: forall (n:nat) (L1 L2: natlist), 
  (n::L1)++L2 = n::(L1++L2).
Proof. 
  intros n L1 L2.
  induction L1 as [| m L1TAIL IH].
  simpl. reflexivity.
  simpl. reflexivity.
Qed.



Lemma concat_assoc: 
  forall L1 L2 L3: natlist, (L1 ++ L2) ++ L3 = L1 ++ L2 ++ L3.
Proof. 
  intros L1 L2 L3.
  induction L1 as [| n L1TAIL IH].
  simpl. reflexivity.
  pose (concat_h_tail_tail n L1TAIL L2) as H2. rewrite H2.
  simpl.
  rewrite IH. reflexivity.
Qed. 


Lemma sample2_11: forall L1 L2 : natlist,
  rev (L1 ++ L2) = rev L2 ++ rev L1.
Proof.
  intros L1 L2.
  induction L1 as [| n L11 IHL1].
  simpl.
  pose (concat_nil_r (rev L2)) as H2. rewrite H2.
  reflexivity.
  simpl. rewrite IHL1.
  pose (concat_assoc (rev L2) (rev L11) [n]) as H3.
  exact H3.
Qed.




(** ** Do not modify this line: sample2_12 *)

(** See the Theorem #<tt>'rev_involutive'</tt># from the Coq textbook
#<a href='https://bit.ly/2uuX1ZK'>Lists: Working with Structured Data</a>#. 
This lemma tells that reversing any list two times returns the
original list: #<tt>rev(rev([1;2;4])) = rev([4;2;1]) = rev([1;2;4])</tt>#. 
*)

Lemma concat_single: forall (n:nat) (L:natlist), 
  n::L = [n] ++ L.
Proof. 
  intros n L.
  induction L as [| m LTAIL IH].
  simpl. reflexivity.
  simpl. reflexivity.
Qed.


Lemma sample2_12: forall L : natlist,
  rev (rev L) = L.
Proof.
  intros L.
  induction L as [| n LTAIL IH].
  simpl. reflexivity.
  pose (concat_single n LTAIL) as H1.
  rewrite H1.
  pose (sample2_11 [n] LTAIL) as H2.
  rewrite H2.
  pose (sample2_11 (rev LTAIL) (rev [n])) as H3.
  rewrite H3.
  rewrite IH. simpl. reflexivity.
Qed.
  



(** ** Do not modify this line: sample2_13 *)

(** See the Theorem 'app_assoc4' from the Coq textbook
#<a href='https://bit.ly/2uuX1ZK'>Lists: Working with Structured Data</a>#.
This lemma tells that list concatenation is associative; 
one can regroup as long as the order of lists does not change.
*)

Lemma sample2_13: forall L1 L2 L3 L4 : natlist,
  L1 ++ (L2 ++ (L3 ++ L4)) = ((L1 ++ L2) ++ L3) ++ L4.
Proof.
  intros L1 L2 L3 L4.
  pose concat_assoc as H1.
  rewrite H1.
  rewrite H1.
  reflexivity.
Qed.


(** A longer proof can use associativity with special substitutions, 
but this is longer. 
<<
  Lemma sample2_13: forall L1 L2 L3 L4 : natlist,
    L1 ++ (L2 ++ (L3 ++ L4)) = ((L1 ++ L2) ++ L3) ++ L4.
  Proof.
    intros L1 L2 L3 L4.
    pose (concat_assoc L1 L2 L3) as H1.
    rewrite H1.
    pose (concat_assoc L1 (L2 ++ L3) L4) as H2.
    rewrite H2.
    pose (concat_assoc L2 L3 L4) as H3.
    rewrite H3.
    reflexivity.
  Qed.
>>
*)



(** ** Do not modify this line: sample2_14 *)

(** See the Theorem 'rev_injective' from the Coq textbook
#<a href='https://bit.ly/2uuX1ZK'>Lists: Working with Structured Data</a>#.
This lemma tells that reversing a list is an injection: different lists
must lead to different reversed lists.
*)

Lemma list_refl: forall L: natlist, L = L.
Proof. reflexivity. Qed.

Lemma sample2_14:  forall L1 L2 : natlist, rev L1 = rev L2 -> L1 = L2.
Proof.
  intros L1 L2.
  intros H. 
  pose (list_refl (rev (rev L1))) as H1.
  rewrite H in H1 at 2.
  pose (sample2_12 L1) as H2.
  pose (sample2_12 L2) as H3.
  rewrite H2 in H1.
  rewrite H3 in H1.
  exact H1.
Qed.









(** ** Do not modify this line: sample2_15 *)

(** See #<a href='https://bit.ly/2tM6N9C'>Latvian Open Math Olympiad, 2004</a>#, 
Grade 8, Problem 5.#<br/>#
In an increasing sequence there are all positive integers from 1 to 2004; 
every number is written exactly once.
We remove all numbers that are written in the positions 
n=1, n=4, n=7, n=10, and so on. 
From the remaining sequence we again remove all numbers in 
the positions n=1, n=4, n=7, n=10.#<br/>#
We repeat this procedure until there is only one number left. 
Which one is it? *)

(** This function should return a new list where 
1st, 4th, 7th, etc. members are removed *)
Fixpoint sample15_rm_one_third (L: natlist) : natlist := 
 match L with
  | nil => nil
  | h1 :: nil => nil
  | h1 :: h2 :: nil => h2 :: nil
  | (h1 :: h2 :: h3 :: t) => h2 :: h3 :: (sample15_rm_one_third t)
  end.


(* FILL IN HERE. (Returning list 'L' as is done now would be wrong). *) 

(** These are 10 unit tests. Once the function is 
defined correctly, each proof here can be replaced
by #<tt>'Proof. simpl. reflexivity. Qed'</tt># or similar.*)
Example sample15_test0: sample15_rm_one_third [] = [].
Proof. simpl. reflexivity. Qed.
Example sample15_test1: sample15_rm_one_third [1] = [].
Proof. simpl. reflexivity. Qed.
Example sample15_test2: sample15_rm_one_third [1;2] = [2].
Proof. simpl. reflexivity. Qed.
Example sample15_test3: sample15_rm_one_third [1;2;3] = [2;3].
Proof. simpl. reflexivity. Qed.
Example sample15_test4: sample15_rm_one_third [1;2;3;4] = [2;3].
Proof. simpl. reflexivity. Qed.
Example sample15_test5: sample15_rm_one_third [1;2;3;4;5] = [2;3;5].
Proof. simpl. reflexivity. Qed.
Example sample15_test6: sample15_rm_one_third [1;2;3;4;5;6] = [2;3;5;6].
Proof. simpl. reflexivity. Qed.
Example sample15_test7: sample15_rm_one_third [1;2;3;4;5;6;7] = [2;3;5;6].
Proof. simpl. reflexivity. Qed.
Example sample15_test8: sample15_rm_one_third [1;2;3;4;5;6;7;8] = [2;3;5;6;8].
Proof. simpl. reflexivity. Qed.
Example sample15_test9: sample15_rm_one_third [1;2;3;4;5;6;7;8;9] = [2;3;5;6;8;9].
Proof. simpl. reflexivity. Qed.


(** This function is supposed to return the last number that
remains, if we apply #<tt>'sample15_rm_one_third'</tt># until  
the last number remains. *)


Fixpoint recursive_remove (j:nat) (k:nat) (L:natlist) (M:natlist): nat :=
  match k with 
  | 0 => 
      match M with 
      | nil => 0
      | MHead :: MTail => MHead
      end
  | S k' => 
      match L with 
      | nil => 
          match M with 
          | nil => (recursive_remove 0 k' [] [])
          | MHead::nil => (recursive_remove 0 k' [] [MHead])
          | MHead::MTail => (recursive_remove 1 k' (MHead::MTail) [])
          end
      | LHead::LTail => 
          match j with 
          | 1 => (recursive_remove 2 k' LTail M)
          | 2 => (recursive_remove 3 k' LTail (M++[LHead]))
          | _ => (recursive_remove 1 k' LTail (M++[LHead]))
          end
      end
  end.

Definition sample15_rm_until_last (L: natlist) : nat := 
  match L with 
  | nil => 0
  | LHead::nil => LHead
  | _ => recursive_remove 1 (3*(length L)) L []
  end.



Example sample15_test10: sample15_rm_until_last [] = 0.
Proof. simpl. reflexivity. Qed.
Example sample15_test11: sample15_rm_until_last [1] = 1.
Proof. simpl. reflexivity. Qed.
Example sample15_test12: sample15_rm_until_last [1;2] = 2.
Proof. simpl. reflexivity. Qed.
Example sample15_test13: sample15_rm_until_last [1;2;3] = 3.
Proof. simpl. reflexivity. Qed.
Example sample15_test14: sample15_rm_until_last [1;2;3;4] = 3.
Proof. simpl. reflexivity. Qed.
Example sample15_test15: sample15_rm_until_last [1;2;3;4;5] = 5.
Proof. simpl. reflexivity. Qed.





(** The following lemma may cause Coq to crash, so it was replaced
by a simple 'Compute' call instead of a proper testcase:
<<
  Lemma sample2_15: (sample15_rm_until_last (rangeTo 2004)) = 1598.
  Proof. simpl. reflexivity. Qed.
>>
*)


Compute (sample15_rm_until_last (rangeTo 2004)).

Close Scope nat_scope.

