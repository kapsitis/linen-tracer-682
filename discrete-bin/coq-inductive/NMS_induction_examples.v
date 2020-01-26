(** 
Pierādīt, ka katram naturālam 𝑛 ir patiesa vienādība
1*4 + 2*7 + 3*10 + ... + 𝑛 *(3𝑛 + 1) = 𝑛*(𝑛 +1)^2
*)
Fixpoint SeqA (n : nat) := match n with
  0 => 0
  | S k => (SeqA k) + (k + 1) * (3 * (k + 1) + 1)
end.

Eval compute in (SeqA 0).
Eval compute in (SeqA 1).
Eval compute in (SeqA 2).

Require Import Arith.

Lemma Problem1 : forall n, SeqA n = n * (n + 1) * (n + 1).
Proof.
  induction n.
  simpl.
  reflexivity.
  assert (CubicIdentity : (S n) * (S n + 1) * (S n + 1) = 
      n*(n+1)*(n+1) + 3*n*n + 7*n + 4).
  ring.
  rewrite CubicIdentity.
  clear CubicIdentity.
  rewrite <- IHn.
  simpl.
  ring.
Qed.

Fixpoint SeqSum1 (n : nat) := match n with
  0 => 0
  | S k => (SeqSum1 k) + (k + 1)
end.

Eval compute in (SeqSum1 0).
Eval compute in (SeqSum1 1).
Eval compute in (SeqSum1 2).

Lemma SeqSum1Expr : forall n, 2 * (SeqSum1 n) - n = n * n.
Proof. 
  induction n.
  simpl.
  reflexivity.
  assert (SnSn : S n * S n = n * n + 2 * n + 1).
  ring.
  rewrite SnSn.
  rewrite <- IHn.
  simpl.
  assert (Stuff: SeqSum1 n + n + 1 + SeqSum1 n = SeqSum1 n + SeqSum1 n + n + 1).
  ring.


(*
  rewrite Nat.add_0_r.
  rewrite Nat.add_0_r.
  rewrite Nat.add_0_r.
  rewrite Nat.add_assoc.
  rewrite Nat.add_assoc.
  rewrite Nat.add_assoc.
  rewrite Nat.add_assoc.
*)




  ring.
Qed.

n(n+1)/2 + (n+1) + n(n+1)/2 + (n+1) - (n+1) = 
n(n+1)/2  + n(n+1)/2  +  - n + 2n + 1




(n+1)(n+2) - (n+1) = n(n+1) - n + 2n + 1.
n^2 + 3n + 2 - n - 1 = n^2 + n - n + 2n + 1. 
2n + 1 = 2n + 1



(*
 + (n + 1) + ((n + 1) + 0) - S n =
 - n + (n + (n + 0)) + 1

*)


(*
n + sum_n n + (n + sum_n n + 0) + S n =
sum_n n + (sum_n n + 0) + n + (n + (n + 0)) + 1

n + (n) + (S n) = 
n + n + n + 1

*)



Fixpoint SeqSum3 (n : nat) := match n with
  0 => 0
  | S k => (SeqSum3 k) + (k + 1)^3
end.


Eval compute in SeqSum3 3.

Lemma Problem2 : forall n, SeqSum3 n = (SeqSum1 n)*(SeqSum1 n).
Proof. 
  induction n.
  simpl.
  reflexivity.
  assert (CubicIdentity: 

