(** 
#<a href="../../discrete2021/assignments.html">Back to Discrete Assignments</a>#
*)

(**
This file contains all proofs taken from
SUNY Buffalo CSE 191 Course (by Knepley):
https://cse.buffalo.edu/~knepley/classes/cse191/ClassNotes.pdf
Pages 129-131
*) 

Inductive par: Set := open | close.

Inductive wp : list par -> Prop :=
  wp_empty : wp nil
  | wp_paren : forall l : list par, wp l -> wp (open :: l ++ close :: nil)
  | wp_concat : forall l m : list par, wp l -> wp m -> wp (l ++ m).


Lemma wp_o_head_c : forall l1 l2 : list par, wp l1 -> wp l2 -> 
    wp ((open :: l1 ++ (close :: nil)) ++ l2).
Proof.
  intros l1 l2 H1 H2.
  apply wp_concat.
  apply wp_paren.
  assumption.
  assumption.
Qed.


Lemma wp_o_tail_c : forall l1 l2 : list par, wp l1 -> wp l2 -> 
    wp (l1 ++ (open :: l2 ++ (close :: nil))).
Proof.
  intros l1 l2 H1 H2.
  apply wp_concat.
  assumption.
  apply wp_paren.
  assumption.
Qed.



Inductive bin : Set := L : bin | N : bin -> bin -> bin.
Fixpoint bin_to_string (t:bin) : list par :=
  match t with
  | L => nil
  | N u v => cons open
  (app (app (bin_to_string u) (cons close nil)) (bin_to_string v))
end.


