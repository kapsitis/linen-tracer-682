Section statements.

Variable U: Set.

Lemma L1: forall P Q:U -> Prop,
    ((forall x, P x -> Q x) -> (exists x, (P x)) -> exists x, (Q x)).
Proof. 
  intros P Q.
  intros H1. 
  intros H2.
  destruct H2 as [x1 H3].
  exists x1. 
  apply (H1 x1).
  exact H3.
Qed.




End statements.

 