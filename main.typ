#import "@preview/ilm:1.4.1": *
#set page(paper: "a4")
#show link: set text(blue)
#show heading.where(level: 1): set text(size: 26pt, weight: "bold")
#set text(lang: "en")

#show: ilm.with(
  title: "A-level Further Mathematics Guide: Basis and Extension",
  author: "Justin Yu",
  preface: [#include "preface.typ"],
)

#include "chapters/limits.typ"