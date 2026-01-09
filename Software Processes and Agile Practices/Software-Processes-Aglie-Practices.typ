#import "../template.typ": conf, definition, solution
#import "@preview/thmbox:0.2.0": *
#import "@preview/ilm:1.4.2": *
#import "@preview/physica:0.9.7": *

#show: conf

#show: ilm.with(
  title: [Software Processes and Agile Practices],
  author: "Monika",
)

= Foundations of Agile Software Development

#definition[Software][
  Software is a collection of _programs_, _data_ and _documentation_. It is _intangible_, _highly malleable_ and _continuously evolving_.
]
Unlike physical products, software _does not wear out_, _changes are relatively cheap to make—but errors can propagate quickly_ and _value depends strongly on how well it meets current user needs_.

#definition[Software Process][
  It is a _structured set of activities_ used to _develop_, _deliver_, and _maintain software_ in a _systematic and disciplined manner_. It defines _what work is done, in what order, by whom, and with what artifacts_, in order to transform a user need into a working software system.
]

The software development process typically includes the following phases which is called the *Software Development Life Cycle (SDLC)*:
#columns(2)[
  + Requirements Gathering and Analysis
  + Design
  + Implementation (Coding)
  #colbreak()
  4. Testing
  + Deployment
  + Maintenance
]

== Need for Agile Software Development

#definition[Agile Software Development][
  It refers to an approach that emphasises _flexibility_ and _continuous delivery_ of software. It is a _flexible_, _fast_ and _adaptive_ way of developing software while _continuously improving_ the software.
]

Traditional software development methodologies, such as the Waterfall model, often struggle to accommodate changing requirements and deliver value quickly. Agile methodologies address these challenges by promoting iterative development, collaboration, and responsiveness to change.

The following are the disadvantages of traditional software development methodologies:
- Assumes that all requirements can be gathered upfront, which is often unrealistic
- Late delivery of working software, leading to delayed feedback and potential misalignment with user needs
- Limited customer involvement throughout the development process
- Poor handling of changing requirements, leading to scope creep and project delays
- High risk of project failure due to rigid processes and lack of adaptability
- Focus on documentation over working software, leading to inefficiencies and delays
- Linear and sequential processes that do not accommodate iterative development

Agile methodologies address these challenges by:
- Delivering working software early and frequently
- Welcoming changing requirements
- Encouraging continuous customer collaboration
- Managing risk incrementally
- Using iterative and incremental development
- Prioritizing feedback over prediction

== Agile Context
