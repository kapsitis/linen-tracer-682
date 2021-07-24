Lemma abc1: forall a:Prop, a -> a.
Proof.
  trivial. 
Qed. 

Lemma abc2: forall a:Prop, a -> a.
Proof.
  auto. 
Qed. 

Lemma abc3: forall a:Prop, a -> a.
Proof.
  tauto. 
Qed. 

Lemma abc4: forall a:Prop, a -> a.
Proof. 
  Admitted.

Lemma abc5: forall a:Prop, a -> a.
Proof. 
  intros a. 
  intros H.
  exact H.
Qed.
