(** #<a href="../../discrete/coq.html">Back to Coq Main Page</a>#  *)

(** * Lab02: Proving Number Theory Results in Coq *)

(** In all the exercises replace #<b>Admitted.</b># 
with a proof. Enclose it between #<b>Proof.</b># and #<b>Qed.</b># 
#<b>Note:</b> Simple, self-sufficient proofs are preferable, but
whenever necessary, you can import 
statements from the Coq standard theorem libraries.
Available imports are listed here:
#<a href='https://coq.inria.fr/library/index.html'>Coq Libraries</a>#.
*)

(** ** Guidelines for submission *)
(** #<ul><li>Download this Coq source file#
#<a href='lab02_tasks.v'>lab02_tasks.v</a>.</li>#
#<li>Replace <tt>'Admitted'</tt> with a meaningful proof.</li>#
#<li>Make sure that your proofs do not contain # 
#<tt>'Admitted'</tt> or any non-explicit tactics #
#such as <tt>'tauto'</tt>, <tt>'intuition'</tt>, #
#<tt>'firstorder'</tt>, <tt>'auto'</tt>, <tt>'trivial'</tt>.</li>#
#<li>Ensure that the separating #
#comments "Do not modify this line ..." are preserved.</li>#
#<li>If you cannot solve some example, leave it unchanged,#
#but do not change the numeration.</li>#
#<li>In case you need any <tt>'Require Import'</tt> command,#
#write it right above the lemma where you need it.</li>#
#<li>When you are done, upload the resulting#
#<tt>lab02_tasks.v</tt> file to ORTUS.</li>#
#</ul>#
*)


Require Import Nat.
Require Import PeanoNat.

Require Import ZArith.
Require Import Znumtheory.
Require Import BinInt.

(** * Lemmas 1-5 on Modular Arithmetic *)

(** ** Do not modify this line: sample2_1 *)
(** See Example1 from (Rosen2019, p.87): #<br/>#
If $n$ is an odd integer, then $n^2$ is odd. *)

Open Scope Z_scope.

Definition Even a := exists b, a = 2*b.
Definition Odd a := exists b, a = 2*b+1.


Lemma sample2_1: forall n: Z, (Odd n) -> (Odd (n^2)).
Proof. 
  (* FILL IN HERE *) Admitted.

(** #<b>Alternative exercise:</b>#
If you wish, you can prove a similar lemma for natural 
numbers (non-negative integers 0,1,2,etc.). 
In PeanoNat the definition of 'odd' is by induction 
rather than algebraic. So the proof would be different.
The lemma in the natural set:
<<
  Lemma sample2_1_natural: forall n: nat, 
      (odd n)=true -> (odd (n^2))=true.
  Proof.
    Admitted.
>>
The proof over naturals would likely be more interesting.
*)

Close Scope Z_scope.

(** ** Do not modify this line: sample2_2 *)

(** See Example12 from (Rosen2019, p.91): #<br/>#
If $3n+2$ is odd, then $n$ is odd. *)

Open Scope Z_scope.

Lemma sample2_2: forall n: Z, (Odd (3*n+2)) -> (Odd n).
Proof. 
  (* FILL IN HERE *) Admitted.

(** #<b>Alternative exercise:</b>#
A very similar lemma in the natural set:
<<
  Lemma sample2_2_natural: forall n: nat, 
      (odd (3*n+2))=true -> (odd n)=true.
Proof.
  Admitted.
>>
**)

Close Scope Z_scope.

(** ** Do not modify this line: sample2_3 *)

(** See Problem44 from (Rosen2019, p.259): #<br/>#
Show that if $n$ is an integer, then $n^2$ is congruent to 0 or 1 (mod 4).
*)
Lemma sample2_3: forall n: nat, (n^2 mod 4 = 0) \/ (n^2 mod 4 = 1).
Proof.
  (* FILL IN HERE *) Admitted.


(** ** Do not modify this line: sample2_4 *)

(** See Problem45 from (Rosen2019, p.259): #<br/># 
Show that if $m$ is a positive integer of the form $4k+3$ 
for some nonnegative integer $k$, then $m$ is not 
the sum of the squares of two integers.
*)
Lemma sample2_4: 
  forall m: nat, (exists k:nat, m = 4*k+3) -> (forall a b:nat, a^2 + b^2 <> m).
Proof.
  (* FILL IN HERE *) Admitted.


(** ** Do not modify this line: sample2_5 *)

(** See Problem46 from (Rosen2019, p.259): #<br/>#  
Prove that if $n$ is an odd positive integer, then 
$n^2$ is congruent to 1 (mod 8).
*)
Lemma sample2_5: forall n: nat, (odd n) = true -> (n^2 mod 8 = 1).
Proof.
  (* FILL IN HERE *) Admitted.




(** * Lemmas 6-10 on Mathematical Induction *)

(** Define divisibility relation between natural numbers; 
it is a predicate with two arguments, can take values
True or False. The second line introduces a shorthand
notation for divisibility using vertical bar (pipe symbol). 
You can always 'unfold' such notation. *)

Definition divide x y := exists z, y=z*x.
Notation "( x | y )" := (divide x y) (at level 0) : nat_scope.


(** ** Do not modify this line: sample2_6 *)

Fixpoint SeqA (n : nat) := match n with
  0 => 0
  | S k => (SeqA k) + (k + 1) * (3 * (k + 1) + 1)
end.

(** See Problem1 from the Latvian Regional Olympiad study material: 
#<a href='https://bit.ly/2OTn6c7'>(NMS2020)</a>:#
Prove that for each positive integer 'n' the following equality holds:#<br/>#
1*4 + 2*7 + 3*10 + ... + n*(3n+1) = n*(n + 1)^2.
*)
Lemma sample2_6: forall n, SeqA n = n * (n + 1)^2.
Proof.
  (* FILL IN HERE *) Admitted.



(** ** Do not modify this line: sample2_7 *)

Fixpoint SeqB (n : nat) := match n with
  0 => 0
  | S k => (SeqB k) + (k+1)^3
end.

Fixpoint SeqC (n : nat) := match n with
  0 => 0
  | S k => (SeqC k) + (k+1)
end.

(** See Problem2 from the Latvian Regional Olympiad study material: 
#<a href='https://bit.ly/2OTn6c7'>(NMS2020)</a>:#
Prove that for each positive integer $n$ the following equality holds:#<br/>#
1^3 + 2^3 + 3^3 + ... + n^3 = (1 + 2 + 3 + ... + n)^2.
*)
Lemma sample2_7: forall n: nat, (SeqB n)=(SeqC n)^2.
Proof.
  (* FILL IN HERE *) Admitted.


(** ** Do not modify this line: sample2_8 *)




Definition SeqD (n: nat) := 7^n + 3^(n+1).

(** See Problem3 from the Latvian Regional Olympiad study material: 
#<a href='https://bit.ly/2OTn6c7'>(NMS2020)</a>:#
Show that for all positive integers 'n', 
7^n + 3^(n+1) is divisible by 4.
*)
Lemma sample2_8: forall n: nat, (4 | (SeqD n)).
Proof.
  (* FILL IN HERE *) Admitted.



(** ** Do not modify this line: sample2_9 *)

Definition SeqE (n: nat) := 3*n^5 + 5*n^4 - 8*n.

(** See Problem4 from the Latvian Regional Olympiad study material: 
#<a href='https://bit.ly/2OTn6c7'>(NMS2020)</a>:#
Prove that for any positive integer 'n' the expression
3n^5 + 5n^4 - 8n is divisible by 10.
*)
Lemma sample2_9: forall n: nat, (10 | (SeqE n)).
Proof.
  (* FILL IN HERE *) Admitted.




(** ** Do not modify this line: sample2_10 *)

Fixpoint SeqF (n : nat) := match n with
  0 => 0
  | S n' => match n' with 
      0 => 1 
      | 1 => 5
      | S n'' => 5*(SeqF n') - 6*(SeqF n'')
      end
  end.

(** See Problem5 from the Latvian Regional Olympiad study material: 
#<a href='https://bit.ly/2OTn6c7'>(NMS2020)</a>:#
Sequence x(n) is defined recursively as#<br/>#
x(n+2) = 5x(n+1) - 6x(n) and x(1) = 1, x(2) = 5.#<br/>#
Prove that every member of this sequence satisfies this equality:
x_n = 3^n - 2^n.
*)
Lemma sample2_10: forall n: nat, (SeqF n) = 3^n - 2^n.
Proof.
  (* FILL IN HERE *) Admitted.



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




(** ** Do not modify this line: sample2_11 *)

(** See the Theorem #<tt>'rev_app_distr'</tt># from the Coq textbook
#<a href='https://bit.ly/2uuX1ZK'>Lists: Working with Structured Data</a>#. 
This lemma tells how to reverse a concatentation of two lists: 
#<tt>rev([1;2;4]++[7;11]) = [11;7]++[4;2;1].</tt>#
*)
Lemma sample2_11: forall L1 L2 : natlist,
  rev (L1 ++ L2) = rev L2 ++ rev L1.
Proof.
  (* FILL IN HERE *) Admitted.


(** ** Do not modify this line: sample2_12 *)

(** See the Theorem #<tt>'rev_involutive'</tt># from the Coq textbook
#<a href='https://bit.ly/2uuX1ZK'>Lists: Working with Structured Data</a>#. 
This lemma tells that reversing any list two times returns the
original list: #<tt>rev(rev([1;2;4])) = rev([4;2;1]) = rev([1;2;4])</tt>#. 
*)
Lemma sample2_12: forall L : natlist,
  rev (rev L) = L.
Proof.
  (* FILL IN HERE *) Admitted.



(** ** Do not modify this line: sample2_13 *)

(** See the Theorem 'app_assoc4' from the Coq textbook
#<a href='https://bit.ly/2uuX1ZK'>Lists: Working with Structured Data</a>#.
This lemma tells that list concatenation is associative; 
one can regroup as long as the order of lists does not change.
*)
Lemma sample2_13: forall L1 L2 L3 L4 : natlist,
  L1 ++ (L2 ++ (L3 ++ L4)) = ((L1 ++ L2) ++ L3) ++ L4.
Proof.
  (* FILL IN HERE *) Admitted.




(** ** Do not modify this line: sample2_14 *)

(** See the Theorem 'rev_injective' from the Coq textbook
#<a href='https://bit.ly/2uuX1ZK'>Lists: Working with Structured Data</a>#.
This lemma tells that reversing a list is an injection: different lists
must lead to different reversed lists.
*)
Lemma sample2_14:  forall L1 L2 : natlist, rev L1 = rev L2 -> L1 = L2.
Proof.
  (* FILL IN HERE *) Admitted.




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
Fixpoint sample15_rm_one_third (L: natlist) : natlist := L.
(* FILL IN HERE. (Returning list 'L' as is done now would be wrong). *) 

(** These are 10 unit tests. Once the function is 
defined correctly, each proof here can be replaced
by #<tt>'Proof. simpl. reflexivity. Qed'</tt># or similar.*)
Example sample15_test0: sample15_rm_one_third [] = [].
Proof. (* FILL IN HERE *) Admitted.
Example sample15_test1: sample15_rm_one_third [1] = [].
Proof. (* FILL IN HERE *) Admitted.
Example sample15_test2: sample15_rm_one_third [1;2] = [2].
Proof. (* FILL IN HERE *) Admitted.
Example sample15_test3: sample15_rm_one_third [1;2;3] = [2;3].
Proof. (* FILL IN HERE *) Admitted.
Example sample15_test4: sample15_rm_one_third [1;2;3;4] = [2;3].
Proof. (* FILL IN HERE *) Admitted.
Example sample15_test5: sample15_rm_one_third [1;2;3;4;5] = [2;3;5].
Proof. (* FILL IN HERE *) Admitted.
Example sample15_test6: sample15_rm_one_third [1;2;3;4;5;6] = [2;3;5;6].
Proof. (* FILL IN HERE *) Admitted.
Example sample15_test7: sample15_rm_one_third [1;2;3;4;5;6;7] = [2;3;5;6].
Proof. (* FILL IN HERE *) Admitted.
Example sample15_test8: sample15_rm_one_third [1;2;3;4;5;6;7;8] = [2;3;5;6;8].
Proof. (* FILL IN HERE *) Admitted.
Example sample15_test9: sample15_rm_one_third [1;2;3;4;5;6;7;8;9] = [2;3;5;6;8;9].
Proof. (* FILL IN HERE *) Admitted.

(** This function is supposed to return the last number that
remains, if we apply #<tt>'sample15_rm_one_third'</tt># until  
the last number remains. *)
Fixpoint sample15_rm_until_last (L: natlist) : nat := 42.

(** These are 6 more unit tests. Once the function 
sample15_rm_until_last
has been *)
Example sample15_test10: sample15_rm_until_last [] = 0.
Proof. (* FILL IN HERE *) Admitted.
Example sample15_test11: sample15_rm_until_last [1] = 1.
Proof. (* FILL IN HERE *) Admitted.
Example sample15_test12: sample15_rm_until_last [1;2] = 2.
Proof. (* FILL IN HERE *) Admitted.
Example sample15_test13: sample15_rm_until_last [1;2;3] = 3.
Proof. (* FILL IN HERE *) Admitted.
Example sample15_test14: sample15_rm_until_last [1;2;3;4] = 3.
Proof. (* FILL IN HERE *) Admitted.
Example sample15_test15: sample15_rm_until_last [1;2;3;4;5] = 5.
Proof. (* FILL IN HERE *) Admitted.


(** This result is sufficient to show the original olympiad problem: *)
Lemma sample2_15: (sample15_rm_until_last (rangeTo 2004)) = 1598.
Proof.
  Admitted.







(** * Lemmas 16-20 are Number Theory in Z *)

(** The remaining 5 proofs are about the integer divisibility.
See #<a href='../coq-numbertheory/CSEnotes_numbertheory.html'>Integer Arithmetic #
#(Buffalo CSE191, p.110-137)</a>#
*)

Require Import Znumtheory.

(** A warm-up example: Prove that (Zis_gcd 6 15 (-3)) is True. This means
that (-3) satisfies all properties of a GCD. It divides both 6 and 15, and
any other divisor of 6 and 15 is also a divisor of (-3). *)

(** In the scope of 'nat' (not Z), the GCD always equals 3, not (-3):
<<
  Compute (gcd 6%nat 15%nat).
>>
The above line should return #<tt>3%nat</tt>#, so it cannot be (-3). 
In the arithmetic of Z (all integers), there are two feasible values
of GCD. GCD(6,15) can be both '+3' and '-3'. 
*)

Example gcd_6_15A: (Zis_gcd 6 15 (-3)).
Proof.
  apply Zis_gcd_intro.
  - unfold Z.divide. exists (-2). reflexivity.
  - unfold Z.divide. exists (-5). reflexivity.
  - { 
    intros x H1 H2.
    unfold Z.divide in H1. destruct H1 as [u H11].
    unfold Z.divide in H2. destruct H2 as [v H22].
    unfold Z.divide.
    exists (v - 3*u).
    rewrite Z.mul_sub_distr_r.
    rewrite <- H22. rewrite <- Z.mul_assoc. rewrite <- H11.
    reflexivity.
  }
Qed.



(** ** Do not modify this line: sample2_16 *)

(** See #<a href='https://che.gg/2umW71y'>Properties of GCD</a>.<br/>#
Note that Item (a) from that list is already solved as #<tt>Lemma div_a_perp_b</tt># in
#<a href='https://cse.buffalo.edu/~knepley/classes/cse191/ClassNotes.pdf'>(Knepley2019, p.135)</a>.<br/>#
#<b>Lemma:</b> If gcd(a,b)=1 and c divides a, then gcd(b,c)=1.#
*)
Lemma sample2_16: forall a b c: Z, (Zis_gcd a b 1) -> (c | a) -> (Zis_gcd b c 1).
Proof.
  (* FILL IN HERE *) Admitted.




(** ** Do not modify this line: sample2_17 *)

(** #<b>Lemma:</b> If gcd(a,b)=1, then then gcd(ac,b)=gcd(c,b).# *)
Lemma sample2_17: forall a b c k: Z, 
  (Zis_gcd a b 1) -> ((Zis_gcd (a*c) b k) <-> (Zis_gcd c b k)).
Proof.
  (* FILL IN HERE *) Admitted.


(** ** Do not modify this line: sample2_18 *)

(** #<b>Lemma:</b> If gcd(a,b)=1 and c divides (a+b), then gcd(a,c)=gcd(b,c)=1.# *)
Lemma sample2_18: forall a b c: Z, 
  (Zis_gcd a b 1) -> (c | (a+b)) -> ((Zis_gcd a c 1) /\ (Zis_gcd b c 1)).
Proof.
  (* FILL IN HERE *) Admitted.


(** ** Do not modify this line: sample2_19 *)
(** #<b>Lemma:</b> If gcd(a,b)=1; d divides ac; d divides bc, then d divides c.# *)
Lemma sample2_19: forall a b c d: Z, 
  (Zis_gcd a b 1) -> (d | (a*c)) -> (d | (b*c)) -> (d | c).
Proof.
  (* FILL IN HERE *) Admitted.


(** ** Do not modify this line: sample2_20 *)
(** #<b>Lemma:</b> If gcd(a,b)=1, then gcd(a^2,b^2)=1.# *)
Lemma sample2_20: forall a b: Z, 
  (Zis_gcd a b 1) -> (Zis_gcd (a^2) (b^2) 1).
Proof.
  (* FILL IN HERE *) Admitted.







