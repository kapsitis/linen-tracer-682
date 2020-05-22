(* 
https://twitter.com/mathslogicbot/status/1261250017106579459
*)

Lemma doubleNegation: forall a:Prop, a -> ~~a.
Proof.
   intros a.
   intros H.
   unfold not.
   intros H1.
   apply H1 in H as H2.
   contradiction H2.
Qed.

Lemma murr: forall a b:Prop, (a -> (~b \/ ~~~~a)).
Proof. 
  intros. 
  right.
  pose (doubleNegation a) as H1.
  apply H1 in H as H2.
  pose (doubleNegation (~~a)) as H3.
  apply H3 in H2 as H4.
  exact H4.
Qed.


