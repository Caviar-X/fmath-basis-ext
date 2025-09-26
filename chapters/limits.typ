#import "@preview/theorion:0.4.0": *
#import "@preview/cetz:0.4.2": *
#import "@preview/cetz-plot:0.1.2": *
#import cosmos.clouds: *
#show: show-theorion
#let question = postulate-box
#let solution = proposition-box
#set math.equation(numbering: none)
= Limits
\

#line(length: 100%)

\
#quote-box[
  I always think that it's a shame on A-level Mathematics that they don't teach limits properly —— Justin Yu
]


Although this is a bit narcissistic, you can't deny that I am spitting fact. Limits aren't taught properly in A-level Mathematics & Further Mathematics. 

In fact, limits are barely mentioned in A-level Mathematics  & Further Mathematics textbooks, and the notation they use often looks a bit weird and funny. Like come on bro, nobody uses this $x arrow 0$ notation anymore.

However, in university and higher level of mathematics, limits is a fundamental concept that is used everywhere.

== Why do limits exist anyway?

Limits exists because we wanna study the properties of functions at points that are undefined.

For example, let's take a look at this function: $ f(x) = (sin x) / x $

Here is the graph of $y = (sin x) / x$ and $x = 0$

#align( canvas({  
  plot.plot(
    size: (9, 7.5),
    x-label: $x$,
    y-tick-step: 0.1,
    x-tick-step: calc.pi,
    legend: "inner-north-west",
    axis-style: "school-book",
    legend-style: (stroke: .1pt),
    {

      plot.add(
        style: (stroke: green + 1.5pt),
        domain: (-3*calc.pi, -0.1),
        label: $(sin x) / x$,
        x => calc.sin(x) / x,
      )
      plot.add(
        style: (stroke: green + 1.5pt),
        domain: (0.1, 3*calc.pi),
        x => calc.sin(x) / x,
      )

      plot.add(((0,1),),mark: "o")

    },
  )
}),center)

Obviously, since the denominator is 0 when $x = 0$, the function is undefined at $x = 0$. However, by the graph, we can see that as $x$ approaches 0, $f(x)$ approaches 1. If you still don't get it, here's the table of value of $f(x)$ when $x$ is very close to 0.

\

#align({
 
  table(
    columns: (90pt, 90pt),
    inset: 10pt,
    align: center,
    table.header(
      [*x*], [*$(sin x) / x$*],
    ),
    "1","0.841470985",
    "0.1","0.998334166",
    "0.01","0.999983333",
    "0.001","0.999999833",
  )

},center)

Now It's very clear that as $x$ approaches 0, $f(x)$ approaches 1.

In order to record this kind of tendency of change of function. We use limits. In formal notation, we write this as: $ lim_(x arrow 0) (sin x) / x = 1 $

#note-box[
  The whole book will use the formal notation instead of $x arrow n$ notation. Even if the extracted original question uses that notation.
]

Of course, this is just an intuitive explanation of limits. We didn't really define what exactly is a limit, but how can we do this?

== Cauchy's thoughts

Since the foundation of the calculus, mathematicians in many generations have been trying to formally define limits. One of them is Augustin-Louis Cauchy. In his book _Cours d'Analyse_ published in 1821, he defined limits as follows:


#quote-box[
  When the values successively attributed to the same variable *approach indefinitely* a fixed value, eventually differing from it by *as little as one could wish*, that fixed value is called the limit of all the others. —— Augustin-Louis Cauchy, _Cours d'Analyse_, 1821
]

Cauchy's definition is pretty good. In fact, it's very close to how we define limits today. However, it still has some problems. First, what does "approach indefinitely" mean? Do we have to approach it continuously or we can approach it in a jumpy manner? Second, what does "as little as one could wish" mean? Does it mean that we can get as close as we want to the limit, or does it mean that we can get infinitely close to the limit? This certianly needs to be clarified.

\
== Weierstrass's $epsilon$-$delta$ definition

It wasn't until 19th centry that Karl Weierstrass gave the modern definition of limits using $epsilon$ and $delta$. The definition is as follows:


#definition-box(title: [$epsilon$-$delta$ definition of limits])[
  Let $f(x)$ be defined on a deleted neighbourhood that contains $x_0$. If there exists a constant $A$ such that for every $epsilon > 0$ (no matter how small), there always exists a positive constant $delta$ such that when
  $x$ satisfies $0 < |x - x_0| < delta$, it follows that $|f(x) - A| < epsilon$.

  Therefore we call $A$ the limit of $f(x)$ as $x$ approaches $x_0$, and we write
  $ lim_(x arrow x_0) f(x) = A $
]

Yeah... this is the offical definition of limits. And to be honest, it looks like gibberish.

== Translation to human readable language

First we need to understand what a "deleted neighbourhood" is, and in order to do that, we need to understand what is a neighbourhood first.

#definition-box(title: [Definition of neighbourhood])[
  #align(center,text[
    Any open interval that it's center is $x_0$ is called a neighbourhood of $x_0$.
  ])
]

#note-box[
  An open interval is an interval that doesn't include its endpoints. For example, for constant $a,b$. $a < x < b$ is an open interval and $a lt.eq  x lt.eq b$ is a closed interval. For convenience and #strike[I am lazy], later in this book we will use $(a,b)$ for open intervals and $[a,b]$ for closed intervals.
]

With this definiton of neighbourhood, we can also define a neighbourhood with a specified radius.

#definition-box(title: [Definition of $delta$-neighbourhood])[
    For any constant $delta > 0$, we call the open interval $(x_0 - delta, x_0 + delta)$ the $delta$-neighbourhood of $x_0$.
]

Now with these definitions, we can easily define a deleted neighbourhood.

#definition-box(title: [Definition of deleted neighbourhood])[
    #align(center,text[
      A $delta$-neighbourhood of $x_0$ but without the point $x_0$.
    ])
]


\

After these definition, with the aid of the graph down below, we can tear the definition apart scentence by scentence.





#align( canvas({
  draw.rect(
    (-0.1,5.25),
    (10,4),
    stroke: none,
    omega: 0,
    fill: red.lighten(90%) 
  )
  plot.plot(
    size: (10, 7),
    x-label: $x$,
    y-tick-step: none,
    x-tick-step: none,
    legend: "inner-north-west",
    axis-style: "school-book",
    legend-style: (stroke: .1pt),
    {

      plot.add(
        style: (stroke: blue + 1.5pt),
        domain: (-2, 2),
        label: $f(x)$,
        // random function for demonstrate.
        x => calc.pow(x, 3) + 2 * x * x + 3 * x - 5,
      )
      plot.add(((1.5,7.3),),
        mark: "o"
      )
      plot.add-bar(((1.5,7.3),),
        bar-width: 0.0001,
        bar-position: "center",
        style: (stroke: (dash: "dashed"))
      )
      plot.add-bar(((1.35,5),),
        bar-width: 0.0001,
        bar-position: "center",
        style: (stroke: (dash: "dashed"))
      )
      plot.add-bar(((1.65,10),),
        bar-width: 0.0001,
        bar-position: "center",
        style: (stroke: (dash: "dashed"))
      )
      plot.add-hline(5,
        style: (stroke: (
          paint: red,
          dash: "dashed",
        ))
      )
      plot.add-hline(7.3,
        style: (stroke: (
          paint: blue,
          dash: "dashed",
        ))
      )
      plot.add-hline(10,
        style: (stroke: (
          paint: red,
          dash: "dashed",
        ))
      )
    },
  )
  draw.content(
    (8.8,2.5),
    text(size: 10pt)[$x_0$]
  )  
  draw.content(
    (8.0,2.5),
    text(size: 10pt)[$x_0-delta$]
  )
  draw.content(
    (9.6,2.5),
    text(size: 10pt)[$x_0+delta$]
  )
  draw.content(
    (11,4),
    text(red)[$A-epsilon$]
  )
  draw.content(
    (11,4.6),
    text(blue)[$A$]
  )
  draw.content(
    (11,5.25),
    text(red)[$A+epsilon$]
  )
}),center)

\

We all know that in geometry, the modulus function can mean the distance of two points, so now let's try to interpret $ |f(x) - A| < epsilon $ as the distance between $f(x)$ and $A$  can be as small as  $epsilon$,  where $epsilon$ can be as small as we want, $1 / 100000$, $1 / 1000000000000$... you name it.

But we don't need the distance of $f(x)$ and $A$ always be this small, we only need this if $x$ is close enough to $x_0$, so in order to formally express "close enough", we introduced $delta$ and its deleted neighbourhood.

If you still cannot understand what I am saying, you can use the graph up there to understand, now imagine horizontally, there're two lines $y = A + epsilon$ and $y = A - epsilon$ trying to clasp the line $y = a$. and the same to x-axis on $x - delta$ and $x + delta$. 4 lines that clamp $(x_0,A)$ like a sandwich.

Now with the basic understanding of limits, there is another thing that is worth to emphasize.

#warning-box(title: [A common mistake])[
  The fact that $lim_(x arrow x_0) f(x)$ exists *has nothing to do* with whether $f(x)$ is defined at $x_0$ or the value of $f(x_0)$. It is important to know that no matter what situation is in limits. $x$ will never be $x_0$ but can be infinitely approached to $x_0$
]

A perfect example will be this piecewise function.

$ f(x) = cases(
  x space space (x eq.not 0),
  1 space space (x = 0)
) $


What is $lim_(x arrow 0) f(x)$? If you said 1 you're cooked and you should read the content inside warning box again. The correct answer is 0.

== Give it a shot.

After all these yapping I'm sure you wanna give a shot about what you've learned.


#question(title: "Question 1.5.1")[
  Evaluate $ lim_(x arrow 0) (2x-1) $
]

#solution(title: "Solution 1.5.1")[
 \
 Since $2x-1$ is continous and defined on $x = 0$, we can directly plug in $x = 0$ into $2x-1$.

 Giving 0 - 1 which is 1
]

This leaves us a very intuitive theorem

#theorem[
  If a function $f(x)$ is *continous* and defined at $x_0$, then $ lim_(x arrow x_0) f(x) = f(x_0) $
]

The piecewise function we defined previously is not continous, therefore this theorem cannot apply.

Now let's try something a bit harder


#question(title: "Question 1.5.2")[
  Evaluate $ lim_(x arrow 1) (x^2-1)/(x-1) $
]

#solution(title: "Solution 1.5.2")[
  
  Notice that the numerator can be expand to $(x-1)(x+1)$ and $(x - 1)$ cancels out with the denominator. Therefore we only need to calculate $lim_(x arrow 1) x+1$ which according to _Theorem 1.5.1_, the answer is 2.
]

== Left-hand and right-hand limits

When we define limits previously, we require that $x_0$ must be the midpoint of the interval according to the definition of neighbourhood, but sometimes we only wanna do a side, when these time come we use left-hand limits and right hand limits.

#definition-box(title: "Definition of right-hand limits")[
  
  for all $epsilon > 0$,there exists a $delta >0$ when $x_0 < x < x_0 + delta$ there is $f(x)-A < epsilon$, we call$ lim_(x arrow x_0^+) f(x) = A $
]

#definition-box(title: "Definition of left-hand limits")[
  
  for all $epsilon > 0$,there exists a $delta >0$ when $x_0 - delta < x < x_0$ there is $f(x)-A < epsilon$, we call$ lim_(x arrow x_0^-) f(x) = A $
]

In order to understand what the skibidi is this,let's take a look at this function.

#align( canvas({  
  plot.plot(
    size: (9, 7.5),
    x-label: $x$,
    y-tick-step: 2,
    x-tick-step: none,
    axis-style: "school-book",
    legend-style: (stroke: .1pt),
    {

      plot.add(
        style: (stroke: purple + 1.5pt),
        domain: (-2, -0.01),
        label: $f(x)$,
        x => x*x,
      )
      plot.add(
        style: (stroke: purple + 1.5pt),
        domain: (0.1, 3*calc.pi),
        x => calc.sin(x) + 2,
      )
      plot.add(((0,0),),mark: "o")
      plot.add(((0,2),),mark: "o")
    },
  )
}),center)

What is the answer of $lim_(x arrow 0) f(x)$? It doesn't exist.

Why? because $f(x)$ has two corresponding points when $x = 0$, therefore the limit of $f(x)$ when $x = 0$ does not exist.

That's when the left-hand and right-hand limits come in handy, the left-hand limit of $f(x)$ should be 0 and the right-hand limit of $f(x)$ should be 2 according to the graph, it's really intuitive.

This gives us a conclusion.

#theorem[

  $lim_(x arrow x_0) f(x)$ exists if and only if $lim_(x arrow x_0^+)f(x)$ and $lim_(x arrow x_0^-) f(x)$ both exist and equal.
]

#pagebreak()

With these in mind, let's look at this question.

#question(title: "Question 1.6.1")[

  let $ f(x) = cases(x-1 space space (x<0),0 space space (x = 0),x + 1 space space (x > 1)) $, prove that $lim_(x arrow 0) f(x)$ doesn't exist
]

#warning-box[Do not plug $x=0$ into the limit, recall that _Theorem 1.5.1_ only applies on *continous* function. (I have predicted yall)]

#solution(title: "Solution 1.6.1")[

  From _Theorem 1.6.1_, we know that if a limit does not exists, the left-hand limit and the right-hand limit of the function must be inequal, with this in mind, we have $ lim_(x arrow 0^-)f(x) = 0-1=-1 $
  $ lim_(x arrow 0^+) f(x) = 0+1=1 $

  left-hand limit and the right-hand limit are inequal,therefore $lim_(x arrow 0) f(x)$ does not exist.

]

There are also another 2 cases where a function's limit does not exist.

+ This function's left or right hand limit is $plus.minus infinity$ (Example: $lim_(x arrow 0) 1/x$)

+ The function vibrates infinitely (Example: $lim_(x arrow 0) sin 1/x$)

== Limits toward $infinity$

The limits toward a constant acts differently from limits toward infinity.

#definition-box(title: "Definition of limits toward infinity")[

  let $f(x)$ be defined when $|x|$ is greater than a positive constant, for any $epsilon > 0$ (no matter how small it is), there always exists a positive constant $X$ that when $|x| > X$, $|f(x) - A| < epsilon$ is always true. Then, we denote that
  $ lim_(x arrow infinity) f(x) = A $

]

The left-hand and right-hand limits toward infinity is nearly identical to the definition of limits toward infinity, just change $|x| > X$ to $x > X$ and $x < -X$, these limits also satisfy _Theorem 1.6.1_

== L'Hopital's rule

All these things that were mentioned were theroretical, and in A-level Mathematics & Further Mathematics exams, you will mostly use L'Hopital's rule.

#theorem-box(title: "L'Hopital's rule")[
  
  if $lim_(x arrow a) f(x) = infinity$ or $0$, and $lim_(x arrow a) g(x) = infinity$ or 0, then

  $ lim_(x arrow a) f(x) / g(x) = lim_(x arrow a) (f'(x)) / (g'(x)) $
]

This is a very useful rule since most polynomials and other kinds of functions you meet in the exam, such as _Question 1.5.2_ can be applied to this rule.

The questions that uses L'Hopital's rule will usually appear in three forms, they are

+ $0 / 0$ form
+ $infinity / infinity$ form
+ $0 dot infinity$ form

#question(title: [Question 1.8.1 ($0 / 0$ form)])[
  
  Use L'hopital's rule to verify that
  $ lim_(x arrow 0) (sin x) / x = 1 $
]

#caution-box[
  Notice that I use *verify* instead of *prove*, this is because the proof of L'Hopital's rule uses this result, proving the statement with L'Hopital's rule will cause a #link("https://en.wikipedia.org/wiki/Circular_reasoning")[circular reasoning].
]

#pagebreak()

#solution(title: "Solution 1.8.1")[
  
  Notice that $lim_(x arrow 0) sin x = 0$ and $lim_(x arrow 0) x = 0$,this is why it's called a $0 / 0$ form. The other two are the same.

  By using L'Hopital's rule, we can get that the limit is equal to
  $ lim_(x arrow 0) cos x $
  Since $cos x$ is continous and defined on $x = 0$, we can directly plug in and get the result $cos 0 = 1$
]


#question(title: [Question 1.8.2 ($infinity / infinity$ form)])[

  Prove that $ lim_(x arrow infinity) (e^x - e^(-x)) / x^2 = infinity $
]

#note-box[
  You might have the question that why a limit of a function can be $infinity$, you can see the cases where a function's limit do not exist in the above parts, that doesn't confine that the function's limit itself cannot be $infinity$, it just ensures that the left and right hand limits cannot be $plus.minus infinity$. Don't get confused.
]

#solution(title: "Solution 1.8.2")[

  Using L'Hopital's rule we know that the limit is equal to
  $ lim_(x arrow infinity) (e^x + e^(-x)) / (2x) $
  Apply the L'Hopital rule again. We get
  $ lim_(x arrow infinity) (e^x - e^(-x)) / 2 $

  According to _Theorem 1.5.1_ , we plug in $x = infinity$, therefore the answer is $infinity$

]

#question(title: [Question 1.8.3 ($0 dot infinity$ form)])[
  
  Find the value of $ lim_(x arrow 0) x ln x $
]

#solution(title: "Solution 1.8.3")[

  This needs a bit of thinking because L'Hopital's rule can be only applied with division than product, but we can change the form of the limit to $ lim_(x arrow 0) (ln x) / x^(-1) $

  Now we can apply the L'Hopital rule, so this limit is equal to
  $ lim_(x arrow 0) (x^(-1)) / (-x^(-2)) = lim_(x arrow 0) (-x) = 0 $
]

Of course, the form we just mentioned is just the most basic ones, here is one of the advaced form.

This is a kind of advanced form,I'll left as a exercise

#question(title: "Question 1.8.4")[

In this problem,you may assume all the function mentioned are continous and logarithms can swap places with limits.

(i) By using L'hopital rule and logarithms, prove that

$ lim_(f(x) arrow 0)  (1+f(x))^(1/f(x))=e $

(ii) Hence, compute $ lim_(x arrow 0) cos 2x^(3 / x^2) $



]


