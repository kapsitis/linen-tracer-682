Require Import Arith Psatz.
Require Import Nat.
Require Import PeanoNat.

Print even.


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


Compute (1 + 2 :: [3]).



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




Compute (rev [1;2;3] ++ []).









(**
Some new variations and exercises; These may be handy for your future 
explorations about lists: exercises 11 - 15.
*)

(** Prove that any list equals to itself. This should be super-easy. *)
Lemma list_refl: forall L: natlist, L = L.
Proof. 
  Admitted.

(** Prove that you can concatentate an empty list at the end. 
Can use induction over the list L. *)
Lemma concat_nil_r: forall L: natlist, L ++ [] = L.
Proof. 
  Admitted.

(** Adding a single number in front of the first list and then concatenating lists
is the same as first concatenating lists; and only then adding 'n' at the front. 
Can use induction over L1 *)
Lemma concat_h_tail_tail: forall (n:nat) (L1 L2: natlist), 
  (n::L1)++L2 = n::(L1++L2).
Proof. 
  Admitted.

(** Concatenating lists is associative. This lemma can be used also in
sample2_13 - a similar result about 4 lists. *)
Lemma concat_assoc: 
  forall L1 L2 L3: natlist, (L1 ++ L2) ++ L3 = L1 ++ L2 ++ L3.
Proof. 
  Admitted.

(** Adding a single element at the front is same as concatenating
with a single-element list *)
Lemma concat_single: forall (n:nat) (L:natlist), 
  n::L = [n] ++ L.
Proof. 
  Admitted.







(** This function should return a new list where 
1st, 3rd, 5th, etc. members are removed *)
Fixpoint rm_all_odd (L: natlist) : natlist := 
 match L with
  | nil => nil
  | h1 :: nil => nil
  | (h1 :: h2 :: t) => h2 :: (rm_all_odd t)
  end.

(** This function should return a new list where 
2nd, 4th, 6th, etc. members are removed *)
Fixpoint rm_all_even (L: natlist) : natlist := 
 match L with
  | nil => nil
  | h1 :: nil => h1 :: nil
  | (h1 :: h2 :: t) => h1 :: (rm_all_even t)
  end.




Example test0odd: rm_all_odd [] = [].
Proof. simpl. reflexivity. Qed.

Example test0even: rm_all_even [] = [].
Proof. simpl. reflexivity. Qed.

Example test6even: rm_all_even [1;2;3;4;5;6] = [1;3;5].
Proof. simpl. reflexivity. Qed.

Example test6odd: rm_all_odd [1;2;3;4;5;6] = [2;4;6].
Proof. simpl. reflexivity. Qed.


(** Multiply every member of L by 2 *)
Fixpoint double_all (L: natlist) : natlist := 
  match L with
  | nil => nil
  | h::t => (2*h)::(double_all t)
  end.

Example test6double: double_all [1;2;3;4;5;6] = [2;4;6;8;10;12].
Proof. simpl. reflexivity. Qed.

(** Write every member of L two times *)
Fixpoint duplicate_all (L: natlist) : natlist := 
  match L with
  | nil => nil
  | h::t => h::h::(duplicate_all t)
  end.


Example test4duplicate: duplicate_all [1;2;3;4] = [1;1;2;2;3;3;4;4].
Proof. simpl. reflexivity. Qed.


(** Returns numbers in the reverse order: rev_range(3) is [3;2;1] *)
Fixpoint rev_range(n:nat):natlist := 
  match n with
  | 0 => []
  | S k => (k+1) :: rev_range(k)
  end.

(** This function returns numbers in the correct order: range(3) is [1;2;3] *)
Definition range(n:nat) := rev (rev_range(n)).

Compute (range 0).
Compute (range 1).
Compute (range 2).
Compute (range 3).


Fixpoint slow_fibonacci (n:nat) : nat :=
  match n with
    0 => 0
  | (S n') =>
       match n' with
         0 => 1
       | (S n'') => (slow_fibonacci n'') + (slow_fibonacci n')
       end
  end.

Compute (slow_fibonacci 24).

(** P.S. an efficient Fibonacci function would be working on pairs; 
it would take the top two elements from an existing list and append
in the front. In this case it would not create redundant calls. *)

Fixpoint fibpair (n:nat): (nat*nat) := 
  match n with 
  | 0 => (0,0)
  | 1 => (0,1)
  | S k => 
      let (a,b) := fibpair(k) in (b,a+b)
  end.

Compute (fibpair 0).
Compute (fibpair 1).
Compute (fibpair 2).
Compute (fibpair 3).
Compute (fibpair 4).
Compute (fibpair 24).

(** ** Recursively defined Logarithm *) 
(** Various integer-valued functions can be defined recursively; 
often the trick is to pass around multiple variables *) 


(** From Init/Nat.v  *)
Fixpoint log2_recurr k p q r :=
  match k with
    | O => p
    | S k' => match r with
                | O => log2_recurr k' (S p) (S q) q
                | S r' => log2_recurr k' p (S q) r'
              end
  end.

Definition log2floor n := log2_recurr (pred n) 0 1 0.

Compute (log2floor 0).
Compute (log2floor 1).
Compute (log2floor 2).
Compute (log2floor 4).
Compute (log2floor 8).

Compute (pred 10).
Compute (log2floor 11).
Compute (log2_recurr 10 0 1 0).

(**
This is the order, how log2(11) is computed:
<<
  (log2_recurr 10 0 1 0)
  (log2_recurr 9 1 2 1)
  (log2_recurr 8 1 3 0)
  (log2_recurr 7 2 4 3)
  (log2_recurr 6 2 5 2)
  (log2_recurr 5 2 6 1)
  (log2_recurr 4 2 7 0)
  (log2_recurr 3 3 8 7)
  (log2_recurr 2 3 9 6)
  (log2_recurr 1 3 10 5)
  (log2_recurr 0 3 11 4)
>>
*)


(** ** How to address Problem 15? *)

(** It is not difficult to create a recursive procedure that deletes
every third member of a list (the first task there). On the other hand, it 
is not obvious how to repeat that procedure until there is only one 
number left. Fortunately, the approach can be very similar to the log2 
function shown above. *)


(** One possible way to compute this function that strikes out 
1st, 4th, 7th and so on. (And then repeats the whole process, 
until one last number remains.)
<<
1 18 [1;2;3;4;5;6] []
2 17 [2;3;4;5;6] []
3 16 [3;4;5;6] [2]
1 15 [4;5;6] [2;3]
2 14 [5;6] [2;3]
3 13 [6] [2;3;5]
1 12 [] [2;3;5;6]
----------------
1 11 [2;3;5;6] []
2 10 [3;5;6] []
3 9 [5;6] [3]
1 8 [6] [3;5]
2 7 [] [3;5]
----------------
1 6 [3;5] []
2 5 [5] []
3 4 [] [5]
----------------
0 3 [] [5]
0 2 [] [5]
0 1 [] [5]
0 0 [] [5]
----------------
return 5
>>
*)

Compute (sample15_rm_until_last (rangeTo 2004)).

(** A more perfect test would be a separate Lemma. But Coq
misbehaves here - it goes into an infinite loop.
<<
  Lemma sample2_15: (sample15_rm_until_last (rangeTo 2004)) = 1598.
  Proof. simpl. reflexivity. Qed.
>>
*)



