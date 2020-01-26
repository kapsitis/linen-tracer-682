(** #<a href="../../discrete/assignments.html">Back to Discrete Assignments</a># *)

(** * MyBaby: Jazz Song Analyzed *)

(** ** Human-oriented proof *)

(** Let us consider a song written in 1924 that later became  
one of the #<i>standard songs</i>#, sung by multiple jazz artists 
at different times.
#<a href="https://en.wikipedia.org/wiki/Everybody_Loves_My_Baby">Everybody Loves My Baby (But My Baby Don't Love Nobody But Me)</a>#;
music by #<i>Spencer Williams</i>#, lyric by
#<i>Jack Palmer</i>#
*) 

(** #<iframe width="560" height="315"#
#src="https://www.youtube.com/embed/U2BtteA0k8o" frameborder="0"#
#allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"#
#allowfullscreen></iframe>#
*)

(**
The example was taken from this logic textbook:
#<a href="https://learning.oreilly.com/library/view/logic-as-a/9781118880005/c04.xhtml">Logic# 
#as a Tool by Valentin Goranko, 2016.</a>#

The lyrics of this song mentions 
humans #<tt>MyBaby</tt># and #<tt>Me</tt># satisfying hypotheses:
#<dl>#
#<dt>ItemA</dt>#
#<dd>Every human loves <tt>MyBaby</tt></dd>#
#<dt>ItemB</dt>#
#<dd>On the other hand <tt>MyBaby</tt> does not love anyone except <tt>Me</tt></dd># 
#</dl>#

If #<tt>L(x,y)</tt># is the predicate to denote that 
x loves y, then for every human #<tt>x</tt>#: #<tt>L(x,MyBaby)</tt>#. 
In the meantime: for every human #<tt>x</tt>#, as long as 
#<tt>x&ne;Me</tt>#, then #<tt>~L(MyBaby,x)</tt>#
(namely, #<tt>MyBaby</tt># does not love #<tt>x</tt>#).
*)

(** Let us prove that in this case #<tt>MyBaby</tt># and #<tt>Me</tt>#
is the same person. 
Let's start with a human-readable proof:
#<ul><li>Define the set of all humans: <tt>HUM</tt>.</li>#
#<li>Denote elements <tt>MyBaby</tt> and <tt>Me</tt> in this set.</li>#
#<li>Assume that <tt>MyBaby&ne;Me</tt>.</li>#
#<li>Substitute in the property (ItemB): <tt>x = MyBaby</tt>#
#<li>Because of the assumption <tt>MyBaby&ne;Me</tt>,#
#<tt>MyBaby</tt> does not love <tt>MyBaby</tt>, since <tt>MyBaby</tt> only loves <tt>Me</tt></li>#
#<li>On the other hand, by assumption (ItemA): everybody must love <tt>MyBaby</tt>.</li>#
#<li>By (ItemA) <tt>MyBaby</tt> also loves <tt>MyBaby</tt>.</li>#
#<li>This is a contradiction, since <tt>L(MyBaby,MyBaby)</tt> should be either true or false.</li>#
#</ul>#
Contradiction was obtained, since we assumed #<tt>MyBaby&ne;Me</tt>#. 
Therefore, we should always have #<tt>MyBaby=Me</tt>#.
*)


(** ** Machine-verified proof *)

(** We will need the contrapositive tautology *)

Axiom ContraPos : forall p q: Prop, (p -> q) <-> (~q -> ~p).


(** We assume two hypotheses (ItemA, ItemB) and 
prove Lemma that #<tt>MyBaby</tt># and #<tt>Me</tt># 
are equal.
*)

Section mybaby.

(** Here the same proof is formalized with Coq. 
#<tt>HUM</tt># is the set of all humans. *)
Parameter HUM : Type.
(** Me and MyBaby are humans. *)
Parameter Me : HUM.
Parameter MyBaby : HUM.

(** The predicate #<tt>L(x,y)</tt># is true if and only if
#<tt>x</tt># loves #<tt>y</tt>#. *)
Parameter L : HUM*HUM -> Prop.

Hypothesis ItemA: forall x: HUM, L(x,MyBaby).
Hypothesis ItemB: forall x: HUM, ~(x=Me) -> ~(L(MyBaby,x)).


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













