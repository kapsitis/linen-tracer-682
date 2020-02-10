(** #<a href="../../discrete/coq.html">Back to Coq Main Page</a>#  *)

(** * Inductively Defined Data Types *) 

(**
Date: 2020-01-02. Tested with Coq version 8.8.1.
------------------------
The following examples are based on the 
#<a href="http://www.cse.buffalo.edu/~knepley/classes/cse191/ClassNotes.pdf">Class Notes</a>#; 
Pages 84-106 (Chapter 4).
#<a href="https://cse.buffalo.edu/~knepley/classes/cse191/Syllabus.html">CSE 191 "Discrete Structures"</a>#.
*)


(** ** Inductive type with 3 enum values *)

Print bool.

Inductive pdetype : Set :=
  elliptic : pdetype 
  | parabolic : pdetype 
  | hyperbolic : pdetype.


Check pdetype_ind.
Check pdetype_rect.
Check pdetype_rec.

(** This shows a proof by verifying all the subcases (gadījumu pārlase).
Commands "right;left.", "left", "right; right" are meant
to pick the middle term, the leftmost term and the rightmost
term of the disjunction respectively.
*)
Theorem pde_equal : forall p : pdetype, p = parabolic \/ p = elliptic \/ p = hyperbolic.
Proof.
  induction p.
  right; left.
  reflexivity.
  left.
  reflexivity.
  right; right. 
  reflexivity.
Qed.

Theorem pde_equal_same : forall p : pdetype, p = parabolic \/ p = elliptic \/ p = hyperbolic.
Proof.
  intro p.
  pattern p.
  apply pdetype_ind.
  right; left.
  reflexivity.
  left.
  reflexivity.
  right; right.
  reflexivity.
Qed.


(** Proving more trivial statements about a 
function computed from an inductive type. 
*)
Definition mg_works (p : pdetype) :=
match p with
| hyperbolic => False
| other => True
end.


Eval compute in (mg_works hyperbolic).


(** Trivial theorem: One value of the predicate 
"mg_works" is False. 
*)
Theorem no_hyp_mg : mg_works hyperbolic = False.
Proof. 
  simpl. 
  reflexivity. 
Qed.

(** One more trivial theorem: Two constants not equal. *)
Lemma simple : ~ elliptic = hyperbolic.
Proof. 
  unfold not. 
  intro H.
  discriminate. (*r Conclude that "elliptic" and "hyperbolic" cannot be equal *)
Qed.

(** One more trivial theorem: Two constants not equal, 
but this time not using "discriminate". *)
Lemma simple_same : ~ elliptic = hyperbolic.
Proof. 
  unfold not. 
  intro H.
  change ((fun p:pdetype => match p with | elliptic => True | _ => False end) hyperbolic).
  rewrite <- H.
  trivial. 
Qed.



(** ** Natural numbers as inductive type *)

Print nat.
Print nat_ind.
Print nat_rect.


(** Inductive proof that addition is associative *)
Theorem plus_assoc : forall x y z:nat, (x+y)+z = x+(y+z).
Proof. 
  intros x y z.
  elim x.
  simpl. 
  reflexivity.
  intros n IHn.
  rewrite plus_Sn_m.
  rewrite plus_Sn_m.
  rewrite plus_Sn_m.
  rewrite IHn.
  reflexivity.
Qed.

(** Define function "sum_1" - it adds 
the same number "1" for indices 0 to n. 
*)
Fixpoint sum_1 (n : nat) := match n with
  0 => 1
  | S p => S (sum_1 p)
end.

Eval compute in (sum_1 10).

Theorem sum_1_analytic : forall n : nat, sum_1 n = S n.
Proof. 
  induction n.
  simpl. 
  reflexivity.
  simpl. 
  rewrite IHn.
  reflexivity.
Qed. 


(** "sum_n n" is a function adding together
0+1+...+(n-1). 
*)

Fixpoint sum_n n :=
  match n with
    0 => 0
    | S p => p + sum_n p
  end.

Eval compute in (sum_n 1).
Eval compute in (sum_n 2).
Eval compute in (sum_n 10).

(**
This import is necessary to include "ring" - a tactic
to do algebraic simplifications.
*)

Require Import Arith.

(** #<tt>sum_n n</tt># is equal to #<tt>n(n-1)/2</tt># *)
Lemma sum_n_p : forall n, 2 * sum_n n + n = n * n.
Proof. 
  induction n.
  simpl.
  reflexivity.
  assert (SnSn : S n * S n = n * n + 2 * n + 1).
  ring.
  rewrite SnSn.
  rewrite <- IHn.
  simpl.
  ring.
Qed. 

(**
A result that may be useful to prove inequalities.
For all n,m,p,q: If #<tt>n <= m</tt>#
and #<tt>p + m <= q + n</tt># then #<tt>p <= q</tt>#
*) 
Print Nat.le_le_add_le.



(** Simple inequality (not very useful): 
#<tt>0+1+...+(n-1)</tt># is more or equal to #<tt>n-1</tt># 
*)
Theorem bigger : forall n : nat, n <= sum_n n + 1.
Proof. 
  induction n.
  simpl.
  apply le_S.
  apply le_n.
  destruct n.
  simpl.
  apply le_n.
  rewrite <- Nat.add_1_r.
  apply Nat.le_le_add_le with (n := S n) (m := sum_n (S n) + 1).
  assumption.
  rewrite Nat.add_1_r at 2.
  simpl. 
  rewrite <- Nat.add_1_r.
  rewrite <- Nat.add_1_r with (n:=n).
  rewrite <- Nat.add_1_r with (n:=n + (n + sum_n n) + 1 + (n + 1)).
  apply plus_le_compat_r.
  rewrite <- plus_assoc with (n:=n) (m:=n + sum_n n) (p:=1).
  rewrite <- plus_assoc with (n:=n) (m:=n + sum_n n + 1) (p:=n+1).
  rewrite plus_comm with (n:=n + sum_n n + 1) (m:=n+1).
  rewrite plus_assoc with (n:=n) (m:=n+1).
  apply plus_le_compat_r.
  rewrite <- plus_O_n at 1.
  apply plus_le_compat_r.
  apply Peano.le_0_n.
Qed. 

Require Import Rfunctions.
Open Scope R_scope.
Require Import Reals.


Fixpoint sum_geom (n:nat) (x:R) : R :=
  match n with
    0 => 1
    | S p => x^n + sum_geom p x
  end.

Eval compute in (sum_geom 0 17).
Eval compute in (sum_geom 1 17).
Eval compute in (sum_geom 2 17).


Lemma sum_geom_p : forall n:nat, forall x:R, sum_geom n x * x + 1 = x^(n + 1) + sum_geom n x.
Proof.
  induction n.
  intros x.
  simpl.
  rewrite Rmult_1_l. (*r Multiplying with 1 from the left-side *)
  rewrite Rmult_1_r. (*r Multiplying with 1 from the right-side *)
  reflexivity.
  intros x.
  simpl.
  rewrite Rmult_plus_distr_r.
  rewrite tech_pow_Rmult.
  rewrite tech_pow_Rmult.
  rewrite Rmult_comm with (r1:=x ^ S n) (r2:=x).
  rewrite tech_pow_Rmult.
  rewrite Rplus_assoc.
  rewrite IHn.
  rewrite Nat.add_1_r.
  reflexivity.
Qed. 

Inductive par: Set := open | close.


(** ** Lists and Pigeonhole principle *)

Require Import List.

Inductive wp : list par -> Prop :=
wp_empty : wp nil
| wp_paren : forall l : list par, wp l -> wp (open :: l ++ close :: nil)
| wp_concat : forall l m : list par, wp l -> wp m -> wp (l ++ m).


Lemma wp_o_head_c : forall l1 l2 : list par, wp l1 -> 
  wp l2 -> wp ((open :: l1 ++ (close :: nil)) ++ l2).
Proof. 
  intros l1 l2 H1 H2.
  apply wp_concat.
  apply wp_paren.
  assumption.
  assumption.
Qed. 



Lemma wp_o_tail_c : forall l1 l2 : list par, wp l1 -> 
  wp l2 -> wp (l1 ++ (open :: l2 ++ (close :: nil))).
Proof. 
  intros l1 l2 H1 H2.
  apply wp_concat.
  assumption.
  apply wp_paren.
  assumption.
Qed. 

Inductive bin : Set := 
  L : bin 
  | N : bin -> bin -> bin.

Fixpoint bin_to_string (t:bin) : list par :=
  match t with
    | L => nil
    | N u v => cons open
    (app (app (bin_to_string u) (cons close nil)) (bin_to_string v))
  end.



















