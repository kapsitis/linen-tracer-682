Theorem my_first_proof: (forall a : Prop, a -> a).
Proof.
  intros a.
  intros aTrue.
  exact aTrue.
Qed.


Theorem forward_small : (forall a b : Prop, a -> (a->b) -> b).
Proof.
 intros a b.
 intros aTrue.
 intros H.
 pose (H aTrue) as bTrue.
 exact bTrue.
Qed.

