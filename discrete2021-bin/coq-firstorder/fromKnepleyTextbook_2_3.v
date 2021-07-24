(** 
#<a href="../../discrete2021/assignments.html">Back to Discrete Assignments</a>#
*)

(**
This file contains all proofs taken from
SUNY Buffalo CSE 191 Course (by Knepley):
https://cse.buffalo.edu/~knepley/classes/cse191/ClassNotes.pdf
Pages 43-49
*)


Print bool. 

Inductive pdetype: Set := 
  elliptic : pdetype | 
  parabolic : pdetype |
  hyperbolic : pdetype.

Check bool_ind.

Check pdetype_ind.

Theorem pde_equal : forall p : pdetype, p = parabolic \/ p = elliptic \/ p = hyperbolic.
Proof. 
  induction p.
  right.
  left.
  reflexivity.
  left. 
  reflexivity.
  right.
  right.
  reflexivity.
Qed.


Theorem pde_equal2 : forall p : pdetype, p = parabolic \/ p = elliptic \/ p = hyperbolic.
Proof. 
  intro p. 
  pattern p.
  apply pdetype_ind.
  right; left; reflexivity.
  left; reflexivity.
  right; right; reflexivity.
Qed.


Definition mg_works (p : pdetype) :=
  match p with
  | hyperbolic => False
  | other => True
end.

Eval compute in (mg_works elliptic).


Theorem no_hyp_mg : mg_works hyperbolic = False.
Proof.
  simpl.
  reflexivity.
Qed.


Lemma simple : ~ elliptic = hyperbolic.
Proof. 
  unfold not.
  intros H.
  discriminate.
Qed.


Lemma simple2: ~ elliptic = hyperbolic.
Proof. 
  unfold not.
  intros H.
  change ((fun p:pdetype => match p with 
    | elliptic => True 
    | _ => False end) hyperbolic).
  rewrite <- H.
  trivial.
Qed.

Print simple2.


Open Scope nat_scope.


Print nat.


Print plus_Sn_m.
(* forall n m : nat, S n + m = S (n + m) *)



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



Close Scope nat_scope.

