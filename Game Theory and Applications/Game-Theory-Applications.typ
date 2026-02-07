#import "../template.typ": conf, definition, solution
#import "@preview/thmbox:0.2.0": *
#import "@preview/ilm:1.4.2": *
#import "@preview/physica:0.9.7": *

#show: conf

#show: ilm.with(
  title: [Game Theory and Applications],
  author: "Neha Aggarwal",
)
#set math.equation(numbering: none)

= Introduction to Game Theory

== Overview and Motivation

*Game Theory* is a branch of applied mathematics and economics that studies situations of strategic interaction, where the outcome for each participant depends not only on their own actions but also on the actions chosen by others.

Game Theory is motivated by the need to analyze decision problems where:
- Multiple decision-makers exist
- Their objectives may conflict or partially align
- Outcomes depend on mutual expectations and strategic reasoning
_Classical optimization_ assumes a _passive environment_. Game theory generalizes optimization to _interactive environments_, where each agent’s problem is coupled with others’ problems.

== Applications of Game Theory

Game Theory has a wide range of applications across various fields, including:
- *Economics*: Analyzing markets, auctions, bargaining, and competition among firms
- *Political Science*: Studying voting systems, coalition formation, and international relations
- *Biology*: Understanding evolutionary strategies and behaviors in populations
- *Computer Science*: Designing algorithms for network routing, resource allocation, and multi-agent systems
- *Social Sciences*: Examining social norms, cooperation, and conflict resolution

#definition[Game][
  A game#footnote[We will generally refer to strategic-form games only] is a formal model of a situation involving multiple decision-makers (players) who make choices (strategies) to achieve certain outcomes (payoffs). Formally, it can be defined as a tuple $(N, S_i, u_i)$ where:
  - $N = {1, 2, dots.h, n}$ is a finite set of _players_
  - $S_i$ is the nonempty set of _strategies_ available to player $i$
  - $u_i: S_1 times S_2 times dots.h times S_n -> bb(R)$ is the _payoff/utility_ function of player $i$
]

Each player chooses a strategy $s_i in S_i$ and the resulting strategy profile is denoted by $s = (s_1, s_2, dots.h, s_n) in S_1 times S_2 times dots.h times S_n$. The outcome of the game is determined by the strategy profile, and each player receives a payoff based on their chosen strategy and the strategies of others.

#definition[Payoff/Utility][
  A real-valued function $u_i$ representing player $i$'s preferences over outcomes. Higher values indicate more preferred outcomes.
]
#definition[Rationality][
  Players are assumed to be rational, meaning they will choose strategies that maximize their own payoffs given their beliefs about other players' strategies.
]
#definition[Common Knowledge][
  All players are aware of the game's structure, the rationality of other players, and this awareness is mutual among all players.
]

#definition[Altruism][
  A scenario where players care about the payoffs of other players in addition to their own. In altruistic games, a player's utility function may include terms that reflect the well-being of others.
]
In standard game theory, players are typically assumed to be self-interested, focusing solely on maximizing their own payoffs. However, in altruistic games, players may derive utility from the outcomes of others, leading to different strategic considerations and equilibria.\
Here, the utility function for player $i$ might be represented as:
$
  U_i (x) = u_i (x) + sum_(j != i) a_(i j) u_j (x)
$
where $a_(i j) >= 0$ represents the degree of altruism player $i$ has towards player $j$.

#theorem[The Theory of Rational Choice][
  The action chosen by a decision-maker is at least as good, according to her preferences, as every other available action.
]

= Strategic (Normal-Form) Games

A *strategic game* models situations where:
- Players choose their strategies _simultaneously_
- Players move sequentially but _without observing earlier actions_
Formally, a strategic game consists of players, strategy sets, and payoff functions as defined above.

In normal-form representation, the game is typically presented in a matrix format, where rows represent strategies of one player and columns represent strategies of another player. Each cell contains the payoffs for both players corresponding to the chosen strategies. The strategies are chosen without knowledge of the other players' choices.

Formally, a strategic game is defined as,
$ G = (N, (S_i)_(i in N), (u_i)_(i in N)) $
where, $N$ is the  set of players, $S_i$ is the strategy set for player $i$, and $u_i$ is the payoff function for player $i$.

== Players and Payoff Structures

#definition[Player][
  An entity capable of making decisions and pursuing objectives in a game. Players can be individuals, firms, nations, or any agents with strategic interests.
]
#definition[Strategy][
  A strategy for player $i$ is a complete contingent plan specifying an action for every possible situation the player might face.
]
For each player $i$, the strategy set $S_i$ contains all possible strategies available to that player. The strategy profile $s = (s_1, s_2, dots.h, s_n) in S$ represents a combination of strategies chosen by all players.
#definition[Dominant Strategy][
  A strategy that yields a higher payoff for a player regardless of the strategies chosen by other players. A strategy $s_i^*$ is dominant for player $i$ if,
  $
    u_i (s_i^*, s_(-i)) >= u_i (s_i, s_(-i)) med forall s_i in S_i and forall s_(-i)
  $
]

We will assume that all players are rational and a rational player will not choose a dominated strategy. The fact that all players are rational is common knowledge.

Let us consider a simple example of a strategic game known as the Prisoner's Dilemma. Two players, Alice and Bob, can either "Cooperate" or "Defect". The payoffs are as follows#footnote[I won't explain the details of the game here, but you can see that both players have a dominant strategy to defect, leading to a suboptimal outcome for both]:
#pagebreak()
#align(center)[
  #table(
    align: center,
    columns: 4,
    table.cell(stroke: none, []), table.cell(colspan: 3, $P_2$),
    table.cell(rowspan: 3, align: center + horizon, [$P_1$]),
    [],
    [Cooperate],
    [Defect],
    [Cooperate], [$(-3, -3)$], [$(0, -4)$],
    [Defect], [$(-4, 0)$], [$( -1, -1)$],
  )
]
Games in strategic form are also called matrix games because they can be described in matrices. The matrices are $n$ dimensional where $n$ is the number of players#footnote[When $n = 2$, these games are called bimatrix games].

#definition[Weakly Dominated Strategy][
  A strategy $s_i$ of player $i$ is called weakly dominated if there exists another strategy $s_i^*$ of player $i$ satisfying,
  $
      u_i (s_i^*, s_(-i)) & >= u_i(s_i, s_(-i)) med forall s_(-i) in S_(-i) \
    u_i (s_i^*, s_(-i)^*) & >= u_i(s_i, s_(-i)^*) exists s_(-i)^* in S_(-i)
  $
]

#definition[Rational][
  A strategy vector $s in S$ is termed rational if it is the unique result of a process of iterative elimination of weakly dominated strategies.
]

== Pure Strategy Nash Equilibrium

A *pure strategy Nash equilibrium* is a situation where every player is choosing a specific action and no one can gain by unilaterally changing their action.

#example[Prisoner's Dilemma][
  Here, each player can choose to either _cooperate_(C) or _defect_(D). If the other defects, your best response is to defect and when both defect, neither can imporove by changing alone. Thus, $(D, D)$ is the unique pure strategy Nash equilibrium, even though both players would be better off if they both cooperated.
]

#definition[Pure Strategy Nash Equilibrium][
  A strategy profile $s^* = (s_1^*, s_2^*, dots.h, s_n^*)$ is a pure strategy Nash equilibrium if for every player $i$,
  $
    u_i (s_i^*, s_(-i)^*) >= u_i (s_i, s_(-i)^*) med forall s_i in S_i
  $
]
It can also be defined in terms of best responses.
$
  "BR"_i (s_(-i)) = arg max_(s_i in S_i) u_i (s_i, s_(-i)) => s^* "is a PSNE" <=> s_i^* in "BR"_i (s_(-i)^*) forall i
$
Thus, we say that PSNE is a *fixed point* of the best responses.

= Games with Perfect Information
