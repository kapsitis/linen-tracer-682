Lemma doubleNegation: forall a:Prop, a -> ~~a.
Proof. 
  intros a.
  intros H0.
  unfold not.
  intros H1.
  apply H1 in H0 as H2.
  contradiction H2.
Qed.


Lemma Tautology638982: forall a b:Prop, (~~((a <->(b -> b)) -> a)).
Proof. 
  intros a b. 
  assert ((a <->(b -> b)) -> a) as H0.
  intros H1.
  unfold iff in H1.
  destruct H1 as [H2 H3].
  assert (b -> b) as H4.
  intros H5. 
  exact H5.
  apply H3 in H4 as H6. 
  exact H6.
  pose (doubleNegation (a <-> (b -> b) -> a)) as H1.
  apply H1 in H0 as H7.
  exact H7.
Qed.





