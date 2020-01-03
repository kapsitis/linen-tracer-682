(*
Lemma example3 : forall A B, A \/ B -> B \/ A.
Proof.
  intros.
  destruct H as [H1 | H1].
  right; assumption.
  left; assumption.
Qed.
*)


(*
Theorem plus_O_n : forall n : nat, 0 + n = n.
Proof.
  intros n.
  simpl.
  reflexivity.
Qed.
*)


(*
Theorem ssample: forall P Q R : Prop,
  ((R -> P \/ Q) /\ (~(R /\ Q))) -> (R -> P).
Proof.
  intros.
*)

(*
Theorem murr : forall A:Prop, A <-> A.
Proof.
  split.
  intros.
  assumption.
  intros.
  assumption.
Qed.
*)

(*
Variables P Q R S : Prop.
Lemma id_P : P->P.
Proof.
  intros H.
  assumption.
Qed.
*)

(*
Lemma imp_trans : forall P Q R: Prop, ((P->Q)->(Q->R))-> (P->R).
Proof.
  intros.
*)

Lemma imp_trans : (P->Q)->(Q->R)->P->R.