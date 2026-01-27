#import "../template.typ": conf, definition, solution
#import "@preview/thmbox:0.2.0": *
#import "@preview/ilm:1.4.2": *
#import "@preview/physica:0.9.7": *

#show: conf

#show: ilm.with(
  title: [Software Processes and Agile Practices],
  author: "Monika",
)
#set math.equation(numbering: none)

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

$
  "Plan" -> "Design" -> "Develop" -> "Testing" -> "Review" -> "Release" -> "Repeat"
$

== Agile Context

#definition[Agile Context][
  It refers to the specific environment or situation in which Agile methodologies are applied. This includes factors such as team size, project complexity, customer involvement, and organizational culture.
  $
    "Agile Context" = "nature of problem" + "nature of environment" + "nature of team"
  $
]

Agile methodologies are particularly well-suited for projects with the following characteristics:
- High uncertainty and changing requirements
- Need for rapid delivery of working software
- Close collaboration with customers and stakeholders
- Small to medium-sized teams
So we should not just blindly follow Agile practices, but rather adapt them to fit the specific context of the project and organization.\
The core elements of Agile context are:
- *Requirements Context:* Agile assumes _discovery during development_
- *Technical Context:* Agile supports _evolutionary design_
- * Business Context:* Agile prioritizes _early and frequent delivery_ of value
- *Human and Team Context:* Agile relies on _people over process enforcement_
- *Risk Context:* Agile manages risk _incrementally_

== Agile Manifesto

It is a short, fundamental document that outlines the core values and principles of Agile software development. It was created in 2001 by a group of software developers who sought to find better ways to develop software.

- *Individuals and Interactions over Processes and Tools*:
  - Skilled, motivated people are the primary drivers of success
  - Tools support development, but they cannot replace communication and collaboration
- *Working Software over Comprehensive Documentation:*
  - Documentation is useful, but working software is the ultimate measure of progress
  - Excessive documentation without validation through execution has limited value
- *Customer Collaboration over Contract Negotiation:*
  - Continuous engagement with customers leads to better alignment with real needs
  - Rigid contracts often prevent adaptation when requirements evolve
- *Responding to Change over following a Plan:*
  - Plans are important, but adapting to new information is more important
  - Change is treated as a source of value, not a disruption

The manifesto explicitly says that items on the right still have value—but the items on the left are valued more.\
The manifesto does not describe specific practices or methodologies, but it provides a guiding philosophy for Agile development emphasizing flexibility, collaboration, and customer-centricity.

The manifesto is supported by 12 principles that provide more detailed guidance on how to implement Agile values in practice.
=== Agile Principles

+ Early and continuous delivery of valuable software
+ Welcoming changing requirements, even late in development
+ Frequent delivery of working software
+ Daily collaboration between business and developers
+ Build projects around motivated individuals
+ Build projects around motivated individuals
+ Working software is the primary measure of progress
+ Sustainable development pace
+ Technical excellence and good design enhance agility
+ Simplicity—maximizing the amount of work not done
+ Self-organizing teams produce the best designs
+ Regular reflection and adaptation
