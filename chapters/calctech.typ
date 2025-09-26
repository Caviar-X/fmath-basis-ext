#import "@preview/theorion:0.4.0": *
#import "@preview/cetz:0.4.2": *
#import "@preview/cetz-plot:0.1.2": *
#import cosmos.clouds: *
#show: show-theorion
#let question = postulate-box
#let solution = proposition-box
#set math.equation(numbering: none)

= Extended Calculus Technique
\

#line(length: 100%)

\

#quote-box[
  The world of calculus is magnificant except I can do 0 questions in exam. —— Justin Yu
]

Well, for this chapter I mainly wanna cover the techniques of elementary techniques that won't be taught in school but very helpful.

You probably will find differentiation techniques is extremely short compared to the integration technique. Why will this happen?

== Why integration is just harder

Well the answer is actually quite simple. Differentiation is the process of eliminating the information, and integration is to generate the information from thin air. Imagine you have a piece of artwork, and you throw it into the shredder, this is the process of differentiation, if you have thousands of pieces of paper and you wanna put them together into that same piece of artwork, this is the process of integration. It is obvious that putting back the pieces together is significantly harder than just throw it into the shredder.

Okay quit yapping,now here's something real.



== Differentiation techniques

There's nothing much about actual application of differentiation in A-level Mathematics and Further Mathematics other than what you have been told in the textbook,but I still managed to find some easy and useful techniques that you might find useful.

=== Logarithmic differentiation

This technique is extremely useful when it comes to differentiating horrendous polynomials, let's say we wanna find$ "d"/("d"t) lr(\(,size: #300%) (6\(1+2t^2\)\(t^3-t\)^2) / (sqrt(t+5t^2) dot 4t^(3 / 2)) lr(\),size: #300%) $

This will took ages to find if you apply the rules and chain rules you've learned with brute force, but with Logarithmic differentiation,the reult would be much easier to get, but before that, I wanna talk about why we want logarithms to involve in when we differentiating a function.

We all know that when $f(x) = f(a) plus.minus f(b)$, $f'(x) = f'(a) plus.minus f'(b)$. This rule is really simple and intuitive, but doing products and division is not that beautiful at all. This is why we introduced logarithms here,because logarithms has two rules that we love (I'll use $ln$ here because the base doesn't matter)

$ ln (a b) = ln(a)+ln(b) $
$ ln(a/b) = ln(a) - ln(b) $

Did you discover something? logarithms turn the product and division which we dislike into simple addition and subtraction. This is why we want logarithms.

With this in mind, the formula of logarithmic differentiation is extremely easy to discover.

We have learned in A-level Mathematics that $ [ln(f(x))]' = (f'(x)) / (f(x)) $

We isolate $f'(x)$ to one side to get

$ f'(x) = f(x) dot [ln(f(x))]' $

This is the formula of logarithmic differentiation, you don't need to recite the formula itself because the mindset behind it can let you solve the questions I mentioned above without this formula.

#theorem-box(title: "The logarithmic differentation formula")[
  $ f'(x) = f(x) dot [ln(f(x))]' $
]

Now let's give a try about what you've just saw.

#question(title: "Question 1")[
  
  Differentiating $ (root(5,x-3) dot root(3,3x-2)) / (sqrt(x+2)) $
]



#solution(title: "Solution 1")[
  
  We let $ y = (root(5,x-3) dot root(3,3x-2)) / (sqrt(x+2)) $
  by taking logarithms from both sides, we get
  $ ln y = 1/5 ln |x-3| + 1/3 ln |3x-2| - 1/2 ln |x+2| $
  Differentiating both sides,
  $ y' / y =  1 / (5(x-3)) + 1/(3(3x-2)) - 1/(2(x+2)) $
  Therefore
  $ y' = (root(5,x-3) dot root(3,3x-2)) / (sqrt(x+2)) dot (1 / (5(x-3)) + 1/(3(3x-2)) - 1/(2(x+2))) $

]



Some of you might wonder why I add absolute value to $x-3$, *this is because we require $x > 0$ inside $ln(x)$*

This is extremely important,otherwise your function could be in trouble because of domain.

#question(title: "Question 2")[
  
  Let $ f(x) = product^(114514)_(a=1) (e^(a x) - a) $, compute $f'(0)$
]


#solution(title: "Solution 2 ")[

  
  First we evaluate $f'(x)$ by formula,which is
  $ f'(x)=  product^(114514)_(a=1) (e^(a x) - a) dot sum^(114514)_(b=1) (b e^(b x))/(e^(b x)-b) $

  The key here is: when $x = 0$,the first term will appear $1/0$,which is obviously not what we want.

  To solve this,we isolate the first term inside the sum.
  $ f'(x) = product_(a=1)^(114514) (e^(a x)-a) dot (e^x)/(e^x-1) + product^(114514)_(a=1) (e^(a x) - a) dot sum^(114514)_(b=2) (b e^(b x))/(e^(b x)-b) $

  And we bring out the first term in the product to cancel out $e^x-1$

  $ f'(x) = product_(a=2)^(114514) (e^(a x)-a) dot ((e^x-1)e^x)/(e^x-1) + product^(114514)_(a=1) (e^(a x) - a) dot sum^(114514)_(b=2) (b e^(b x))/(e^(b x)-b) $

  Simplify,we get
  $ f'(x) = e^x dot (product_(a=2)^(114514) (e^(a x)-a)) + product^(114514)_(a=1) (e^(a x) - a) dot sum^(114514)_(b=2) (b e^(b x))/(e^(b x)-b)  $

  Plug in $x=0$,for the second term,since $e^0-1=0$,the entire term will be 0, for the first term.

  $ f'(0)=  product_(a=2)^(114514) (1-a) $

  which is $(-1)(-2)(-3)....(-114513)$, which equals to $-114513!$
]

If you're interested in this, you can use the method above to compute $f'(0)$ when $ f(x) = product^(n)_(a=1) (e^(a x) - a) $

Here are some exercise questions


#question(title: "Question 3-6")[
  
  3. find the derivative of 
  $ f(x) = (x^2) / (1-x) root(3,(3-x)/((3+x)^2)) $

  4. find $f'(0)$ when
  $ f(x) =  (6x-x^3+5x^4+e^x)/(5+3x^2+2x^3+cos(x)) $

  5. find the derivative of
  
  $ f(x) = product_(i=1)^n (x-a_i)^(a_i) $

  6. let $f(x)$ and $g(x)$ be differentatiable functions of $x$,find the derivative of

  $ y = log_(f(x))g(x) $ 
  Hint: consider the change-of-base rule.
]

#pagebreak()

== Calculus techniques



