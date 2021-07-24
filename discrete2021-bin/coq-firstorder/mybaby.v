Axiom ContraPos : forall p q: Prop, (p -> q) <-> (~q -> ~p).

Section mybaby.

Variable Human: Type.

Variable Me : Human.
Variable MyBaby : Human.


Variable L : Human*Human -> Prop.

Hypothesis ItemA: forall x: Human, L(x,MyBaby).
Hypothesis ItemB: forall x: Human, ~(x=Me) -> ~(L(MyBaby,x)).

Lemma who_is_mybaby: MyBaby=Me.
Proof.
  assert (MyBaby <> Me -> ~L(MyBaby,MyBaby)).
  apply ItemB with (x := MyBaby).
  assert (L(MyBaby,MyBaby)).
  apply ItemA with (x := MyBaby).
  clear ItemA ItemB.
  elim (ContraPos (L(MyBaby,MyBaby)) (MyBaby = Me)).
  intros.
  clear H1.
  pose (H2 H) as H3.
  pose (H3 H0) as H4.
  exact H4.
Qed.

End mybaby.
