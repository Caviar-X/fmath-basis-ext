#import "@preview/theorion:0.4.0": *
#import cosmos.clouds: *
#show: show-theorion
#set heading(outlined: false)

= Preface
\


This book is kinda a collection of my thoughts, notes and extensive mathematical knowledge while studying Cambridge International Education (CIE) A-level Further Mathematics. Because of the scarcity of resources online. I currently haven't found a concise, clear route of self-studying A-level Further Mathematics on the Internet. So I decided to write this book to help myself and hopefully others.

Moreover, This book is the by-product of my own imagination of a "perfect" A-level Further Mathematics textbook. I have read the CIE textbook, Hodder education textbook and Collins textbook. I'm not saying that these textbooks are bad, but they didn't add the things that I think are essential to a Further Mathematics textbook, so I decide to work it out solely.

To be clear, I am not a professional mathematician, nor a teacher. I am just a student who wants to share the struggles and thoughts that I had while studying A-level Further Mathematics.

Although I myself is studying CIE A-level Further Mathematics, I believe that this book can also be useful for students studying other examination boards, such as Edexcel and AQA.

Also, since I don't wanna this book to be another "dry" textbook, the register and the tone will obviously be informal. and since english is not my first language, you probably will find lots of grammatical and spelling errors. If you do find any, please make an issue or pull request on #link("https://github.com/Caviar-X/fmath-basis-ext")[The github repository of this book]. You can also send me a pull-request if you want to make any contributions.

I assume that all the readers are already familiar with all the contents in A-level mathematics.

I would like to thank all the people who're currently reading the book. You guys make my time and effort worth it, and to all the courses and books that I have seen and learned from, without you guys.

Finally, to Ms.Cassie, thank you for bringing me to the world of mathematics.



#align(right, text[
  \
  Justin Yu

  Sep 12, 2025
])


#pagebreak()

#align(center, text(red, weight: "bold",size: 30pt)[
  This book is licensed under AGPL version 3.0

  Any unapproved commerical use of the contents inside is strictly prohibited
])

#pagebreak()

= How to use this book
\

yeah uh pretty much every textbook has these with like beautiful boxes in it, so why don't we add this section as well?


#let qeustion = postulate-box
#let solution = proposition-box

#theorem-box(title: "Example Theorem", outlined: false)[

  $ integral u space "d"v = u v - integral v space "d"u $
]

#definition-box(title: "Example definition", outlined: false)[
  #align(center, text[
    Natural Number ($NN$) is defined as 1 and its successor
  ])
]

#lemma-box(title: "Example lemma", outlined: false)[

  #align(center, text[
    Given two segments $a$ and $b$, there exists a real number $r$ such that $b = r a$
  ])

]

#tip-box(title: "Here's a tip")[
  When you see a question that asks you to prove something, try to start from the thing that you want to prove.
]

#note-box(title: "Here's a note")[
  This is a note box. You can use it to add extra information that is not essential to the main text.
]

#warning-box(title: "Here's a warning")[
  This is a warning box. You can use it to warn the reader about something.
]

#caution-box(title: "Here's a caution")[
  This is a caution box. You can use it to caution the reader about something.
]

#remark[
  This is a remark box. You can use it to add extra information that is not essential to the main text.
]

#quote-box[
  I didn't say that
  —— Shing-Tung Yau
]

#qeustion[
  *Example Problem*
  \
  #align(left, text[
    Evaluate
    $ integral^pi_0 ln (2+cos x) space "d"x $
  ])
]

#solution[
  *Example Solution*
  \

  let $f(a) = integral^pi_0 ln (1+cos x)$ where $a gt.eq 0$, therefore
  $ f'(a) = integral^pi_0 1 / (a+cos x) space "d"x = pi / (sqrt(a^2-1)) space space space (a>1) $
  Also,
  $ f(1) = integral^pi_0 ln (1+cos x) space "d"x = integral^pi_0 ln (2cos^2 x/2) space "d"x = -pi ln 2 $
  Hence,
  $ f(2)=f(1) + integral^2_1 f'(a)space "d"a = -pi ln(4-2sqrt(3)) $
]

== Exercise

+ Prove that For any measureable, bounded function $h : Theta -> RR$ we have:
  $ log EE_(theta ~ pi)[exp h(theta)] = sup_(rho in cal(P)(Theta)) [ EE_(theta~rho)[h(theta)] - K L(rho || pi) ]. $


#pagebreak()
