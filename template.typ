#import "@preview/thmbox:0.2.0": *

#let conf(doc) = {
  set page(margin: (
    top: 0.5in,
    bottom: 0.5in,
    x: 0.5in,
  ))
  set text(lang: "en")
  set figure(numbering: none)
  set quote(block: true)

  show: thmbox-init(counter-level: 2)

  doc
}

#let definition-counter = counter("definition")
#show: sectioned-counter(definition-counter, level: 2)
#let definition = definition.with(counter: definition-counter)

#let solution(body) = {
  v(-1.5em)
  example(variant: "Solution")[
    #body
  ]
}
