#import "../template.typ": conf, definition, exam, solution
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
  A real-valued function $u_i$ representing player $i$'s preferences over outcomes. Higher values indicate more preferred outcomes. It is generally expressed as,
  $ u_i (s_i, s_(i-i)) $
  where $s_(i-i)$ denotes the strategies chosen by all players other than player $i$.
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

#exam[Diagram of a Game][
  Every game is made up of:
  #columns(2)[
    - Players
    - Strategy
    #colbreak()
    - Utility/Payoff
    - Rules
  ]
]

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
#definition[Best Response][
  The best response correspondence of player $i$ is the mapping, $"BR"_i: S_(-i) arrows S_i$, defined by,
  $
    "BR"_i (s_(-i)) = { s_i in S_i | u_i (s_i, s_(-i)) >= u_i (s_i ', s_(-i)) forall s_i ' in S_i }
  $
]
#exam[Dominant Strategy vs Best Response][
  It may seem that the best response and the dominant strategy are the same, but they are not. The *dominant strategy* is a global property while the *best response* is a local property and depends on what the other players are doing. Now saying that *every dominant strategy is a best response* is true, but the converse is not. A best response may not be a dominant strategy because it may depend on the strategies chosen by other players. Thus, $s_i^* in "BR"_i (s_(-i)) forall s_(-i)$ meaning the dominant strategy is the best response to every possible opponent strategy.#footnote[We will look at a game like this called the *Stag Hunt Game* later.]
]

We will assume that all players are rational and a rational player will not choose a dominated strategy. The fact that all players are rational is common knowledge.

Let us consider a simple example of a strategic game known as the Prisoner's Dilemma. Two players, Alice and Bob, can either "Cooperate" or "Defect". The payoffs are as follows#footnote[I won't explain the details of the game here, but you can see that both players have a dominant strategy to defect, leading to a suboptimal outcome for both]:
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
    u_i (s_i^*, s_(-i)) & >= u_i (s_i, s_(-i)) med forall s_(-i) in S_(-i) \
    exists s_(-i)^* in S_(-i) in.rev u_i (s_i^*, s_(-i)^*) &> u_i (s_i, s_(-i)^*)
  $
]
#definition[Pareto Optimality][
  A strategy profile $s^* in S$ is pareto optimal if there does not exist another profile $s' in S$ such that,
  $
                         u_i (s') & >= u_i (s^*) med forall i in N \
    exists j in N in.rev u_j (s') & > u_j (s^*)
  $
]
We can deduce the definition of *Pareto Dominance* from the definition of Pareto optimality. A strategy profile $s'$ is said to Pareto dominate another strategy profile $s$ if,
$
                       u_i (s') & >= u_i (s) med forall i in N \
  exists j in N in.rev u_j (s') & > u_j (s)
$

#exam[Weakly Dominated Strategy vs Pareto Optimality][
  Weak dominance is *intra-player comparison* while Pareto optimality is *inter-player comparison*.
]

#definition[Rational][
  A strategy vector $s in S$ is termed rational if it is the unique result of a process of iterative elimination of weakly dominated strategies.
]

== Pure Strategy Nash Equilibrium

A *pure strategy Nash equilibrium* is a situation where every player is choosing a specific action and no one can gain by unilaterally changing their action.

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
Thus, we say that PSNE is a *fixed point* of the best responses or it is the intersection of the best responses.

The Nash equilibria is a *self-enforcing agreement* because no player has an incentive to deviate from their strategy given the strategies of others. It is also the *no-regret outcome* because no player regrets their choice after seeing the choices of others.#footnote[There is a nice mathematical definition of regret, but we won't go into that here.]

#exam[Presence of PSNE][
  It is important to note that a game may have multiple pure strategy Nash equilibria, a unique pure strategy Nash equilibrium, or no pure strategy Nash equilibrium at all.
]

#exam[Finding PSNE][
  We can easily find it by looking at the payoff matrix and checking for each strategy profile if any player can improve their payoff by unilaterally changing their strategy. If no player can improve, then that profile is a PSNE. However, if *both players change* their strategy and get a better payoff, then that profile is not a PSNE.
]

We will work out all these concepts for multiple games in a later chapter but first we'll cover the theory behind it.

== Normal Form Analysis

This basically means that we analyze the game using its normal form representation, which is a matrix that lists the players, their strategies, and the corresponding payoffs. This allows us to systematically evaluate the strategic interactions and identify equilibria.

This studies best response correspondences, nash equilibria, and the process of iterated elimination of dominated strategies. It also involves analyzing the stability of equilibria and how players might adjust their strategies over time.

= Classification of Games

== Classification based on Information about Moves

A game is said to have *perfect information* if all players know the moves that have taken place before making their own move (like chess). In contrast, a game has *imperfect information* if at least one player does not know the moves of others before making their decision (like rock-paper-scissors).

== Classification based on Information about Payoffs

A game is said to have *complete information* if all players know the payoff functions of all other players. In contrast, a game has *incomplete information* if at least one player does not know the payoff functions of others.

== Classification based on Timing

A game is said to be *simultaneous* if all players choose their strategies at the same time without knowledge of others' choices. A game is *sequential* if players make their moves one after another, with later players having some knowledge of earlier actions.

== Classification based on Strategy Types

A game is said to have *pure strategies* if players choose a specific action with certainty. A game has *mixed strategies* if players randomize over their actions, assigning probabilities to each possible strategy.

== Classification based on Conflict Structure

A game is said to be *zero-sum* if one player's gain is exactly equal to another player's loss. A game is *non-zero-sum* if the total payoff to all players can vary, allowing for the possibility of mutual gains or losses.

== Classification based on Cooperation

A game is said to be *cooperative* if players can form binding agreements and coordinate their strategies to achieve better outcomes. A game is *non-cooperative* if players cannot make enforceable agreements and must rely on individual strategies.

= Dominance and Equilibrium

== Iterated Strict Dominance

This is a method in used in normal-form analysis.

#definition[Iterated Strict Dominance][
  A strategy is strictly dominated if there exists another strategy that always yields a higher payoff regardless of what the other players do. Iterated strict dominance is the process of repeatedly eliminating strictly dominated strategies until no more can be eliminated.
]

It basically means that if a strategy is strictly dominated, then a rational player would never choose it. By iteratively removing such strategies, we can simplify the game and potentially identify the Nash equilibrium.

#exam[Why does it work?][
  The reason is pretty obvious, since the players are rational and the rationality is common knowledge, no player would choose a strictly dominated strategy. Thus, we can eliminate it from consideration and focus on the remaining strategies. This process continues until we are left with strategies that are not strictly dominated, which may lead us to the Nash equilibrium.
]

In this method, for finite games, the order of elimination does not matter and we will always end up with the same reduced game. However, for infinite games, the order of elimination can affect the outcome.

#exam[Iterated Strict Dominance vs PSNE][
  The Nash equilibria is always one of the strategies that survive iterated strict dominance, but the converse is not true. A strategy that survives iterated strict dominance may not be a Nash equilibrium because it may not be a best response to the strategies of others.
]

We will look at the continuous case of this in some classical games later.

= Classical Strategic Games

== Prisoner's Dilemma

Two prisoners, $P_1$ and $P_2$ are arrested and charged with a crime. They are interrogated separately and cannot communicate with each other. Each prisoner has two options: to cooperate with the other by remaining silent or to defect by betraying the other. The payoffs for each combination of strategies are as follows:

#exam[Game of Prisoner's Dilemma][
  In this game, the players are the prisoners ${P_1, P_2}$, the strategies are {Confess, Deny}, and the payoffs are given by the matrix. The rule is no communication between the prisoners.
]

#align(center)[
  #table(
    align: center,
    columns: 4,
    table.cell(stroke: none, []), table.cell(colspan: 3, $P_2$),
    table.cell(rowspan: 3, align: center + horizon, [$P_1$]),
    [],
    [Confess],
    [Deny],
    [Confess], [$(-3, -3)$], [$(0, -4)$],
    [Deny], [$(-4, 0)$], [$( -1, -1)$],
  )
]

=== Strictly Dominated Strategies

Looking at the payoff matrix, we can see that for both players, "Confess" strictly dominates "Deny". This is because:
#columns(2)[
  - *For $P_1$*:
    - $u_1 (C, C) > u_1(D, C)$
    - $u_1 (C, D) > u_1(D, D)$
  #colbreak()
  - *For $P_2$*:
    - $u_2 (C, C) > u_2(D, C)$
    - $u_2 (C, D) > u_2(D, C)$
]
Thus, both players have a strictly dominant strategy to confess.\ This leads to a Nash equilibrium at $("Confess", "Confess")$ with payoffs $(-3, -3)$, which is a suboptimal outcome for both players compared to $("Deny", "Deny")$ with payoffs $(-1, -1)$. This illustrates the dilemma faced by the prisoners, where rational self-interest leads to a worse outcome for both.

Well, if we remove the strictly dominated strategy "Deny" for both players, we are left with only one strategy profile, which is $("Confess", "Confess")$. This confirms that it is the unique pure strategy Nash equilibrium of the game.

=== Best Response Analysis

To find the best responses, we can analyze the payoff matrix for each player:
#columns(2)[
  - For $P_1$:
    - $"BR"_1 (D) = C$
    - $"BR"_1 (C) = C$
  #colbreak()
  - For $P_2$:
    - $"BR"_2 (D) = C$
    - $"BR"_2 (C) = C$
]
Thus, the best response for both players is to confess regardless of the other player's choice, confirming that $("Confess", "Confess")$ is indeed a Nash equilibrium.

=== Pareto Optimality

Now, we look at each outcome one by one and check if it is Pareto optimal:
- $("Confess", "Confess")$: This outcome is not Pareto optimal because either player can improve their payoffs by switching to Deny, resulting in a better situation for both.
- $("Confess", "Deny")$ or $("Deny", "Confess")$: This outcome is Pareto optimal because neither player can improve their payoff without making the other worse off.
- $("Deny", "Deny")$: This outcome is Pareto optimal because neither player can improve their payoff without making the other worse off.
Thus, the Pareto Optimal outcomes are ${("Confess", "Deny"), ("Deny", "Confess"), ("Deny", "Deny")}$.

There are a lot of examples like the _Cold War Game_ which are just Prisoner's Dilemma spin-offs.

== Stag Hunt Game

Two hunters can either hunt a stag together or hunt a rabbit individually. Hunting the stag requires cooperation, while hunting the rabbit can be done alone. The payoffs are as follows:

#align(center)[
  #table(
    align: center,
    columns: 4,
    table.cell(stroke: none, []), table.cell(colspan: 3, $H_2$),
    table.cell(rowspan: 3, align: center + horizon, [$H_1$]),
    [],
    [Stag],
    [Rabbit],
    [Stag], [$(2, 2)$], [$(0, 1)$],
    [Rabbit], [$(1, 0)$], [$(1, 1)$],
  )
]

#exam[Game of Stag Hunt][
  In this game, the players are the hunters ${H_1, H_2}$, the strategies are {Stag, Rabbit}, and the payoffs are given by the matrix. There is no rule about communication, but the hunters can observe each other's actions before making their own decision.
]

=== Strictly Dominated Strategies

Looking at the payoff matrix, we can see that there are no strictly dominated strategies for either player. This is because:
#columns(2)[
  - For $H_1$:
  - $u_1 (S, S) > u_1(R, S)$
  - $u_1 (R, R) > u_1(S, R)$
    #colbreak()
    - For $H_2$:
  - $u_2 (S, S) > u_2(S, R)$
  - $u_2 (R, R) > u_2(R, S)$
]
Thus, there are no strictly dominant strategies in this game.

=== Best Response Analysis

To find the best responses, we can analyze the payoff matrix for each player:
#columns(2)[
  - For $H_1$:
  - $"BR"_1 (S) = S$
  - $"BR"_1 (R) = R$
  #colbreak()
  - For $H_2$:
  - $"BR"_2 (S) = S$
  - $"BR"_2 (R) = R$
]
Thus, the best response for each player depends on the other player's choice. If one player chooses Stag, the best response for the other is to also choose Stag. If one player chooses Rabbit, the best response for the other is to also choose Rabbit. This leads to two pure strategy Nash equilibria: $("Stag", "Stag")$ and $("Rabbit", "Rabbit")$.

=== Pareto Optimality

Now, we look at each outcome one by one and check if it is Pareto optimal:
- $("Stag", "Stag")$: This outcome is Pareto optimal because neither player can improve their payoff without making the other worse off.
- $("Stag", "Rabbit")$ or $("Rabbit", "Stag")$: This outcome is not Pareto optimal since the player choosing Rabbit can improve their payoff by switching to Stag, resulting in a better situation for both.
- $("Rabbit", "Rabbit")$: This outcome is not Pareto optimal because both players can improve their payoffs by switching to Stag, resulting in a better situation for both.
Thus, the only Pareto Optimal outcome is $("Stag", "Stag")$.

This is a very interesting game because it has two pure strategy Nash equilibria, one of which is Pareto optimal and the other is not. This illustrates the concept of *coordination games*, where players must coordinate their strategies to achieve the best outcome.

There is a million different games who can dress just like me and walk, talk and act like me but they are just spin-offs, like _Startup Game_ or _Investment Game_.

== Battle of the Sexes

A couple is trying to decide on an activity for the evening. The husband prefers to go to a football game, while the wife prefers to go to a ballet. However, both would rather be together than apart. The payoffs are as follows:
#align(center)[
  #table(
    align: center,
    columns: 4,
    table.cell(stroke: none, []),
    table.cell(colspan: 3, $W$),
    table.cell(rowspan: 3, align: center + horizon, [$H$]),
    [],
    [Football],
    [Ballet],
    [Football], [$(10, 5)$], [$(0, 0)$],
    [Ballet], [$(0, 0)$], [$(5, 10)$],
  )
]

#exam[Game of Battle of the Sexes][
  In this game, the players are the husband $H$ and the wife $W$, the strategies are {Football, Ballet}, and the payoffs are given by the matrix. There is no rule about communication, but the couple can discuss their preferences before making their decision.
]

=== Strictly Dominated Strategies

Looking at the payoff matrix, we can see that there are no strictly dominated strategies for either player. This is because:
#columns(2)[
  - For $H$:
    - $u_H (F, F) > u_H (B, F)$
    - $u_H (B, B) > u_H (F, B)$
  #colbreak()
  - For $W$:
    - $u_W (F, F) > u_W (F, B)$
    - $u_W (B, B) > u_W (B, F)$
]
Thus, there are no strictly dominant strategies in this game.

=== Best Response Analysis

To find the best responses, we can analyse the payoff matrix for each player:
#columns(2)[
  - For $H$:
    - $"BR"_H (F) = F$
    - $"BR"_H (B) = B$
  #colbreak()
  - For $W$:
    - $"BR"_W (F) = F$
    - $"BR"_W (B) = B$
]
Thus, the best response for each player depends on the other player's choice. If one player chooses Football, the best response for the other is to also choose Football. If one player chooses Ballet, the best response for the other is to also choose Ballet. This leads to two pure strategy Nash equilibria: $("Football", "Football")$ and $("Ballet", "Ballet")$.

=== Pareto Optimality
Now, we look at each outcome one by one and check if it is Pareto optimal:
- $("Football", "Football")$: This outcome is Pareto optimal because neither player can improve their payoff without making the other worse off.
- $("Football", "Ballet")$ or $("Ballet", "Football")$: This outcome is not Pareto optimal since both players can improve their payoffs by coordinating on either Football or Ballet, resulting in a better situation for both.
- $("Ballet", "Ballet")$: This outcome is Pareto optimal because neither player can improve their payoff without making the other worse off.
Thus, the Pareto Optimal outcomes are ${("Football", "Football"), ("Ballet", "Ballet")}$.

This game illustrates the concept of *coordination games* with conflicting preferences, where players must coordinate their strategies to achieve a mutually beneficial outcome.

== Tragedy of the Commons

A village has a common pasture that can support a limited number of cows. Each villager can choose to graze their cows on the common pasture or keep them in their private fields.

#exam[Game of Tragedy of the Commons][
  In this game, we will consider only two villagers, $V_1$ and $V_2$. The strategies are to put effort ${e_1, e_2}$ and the payoff structure will be discussed below. The rule is that the common pasture can only support a certain amount of grazing, and if both villagers overgraze, the pasture will be destroyed, leading to a loss for both.
]

Now, the payoff of any villager depends on their own effort and the resource value,
$
  u_1 (e_1, e_2) & = e_1 [1 - (e_1 + e_2)] \
  u_2 (e_2, e_1) & = e_2 [1 - (e_2 + e_1)]
$
This is the interesting part of the game, we don't have a matrix representation here because the strategies are continuous, they can choose any level of effort between 0 and 1. The payoff functions reflect the fact that as more effort is put into grazing, the resource value decreases, leading to a potential tragedy if both villagers overgraze.

The question now is to find the Nash equilibrium of this game. To do that, we need to find the best response functions for both villagers and then find the point where they intersect. This will give us the level of effort that each villager will choose in equilibrium, which may lead to overgrazing and a suboptimal outcome for both.

For maxima,
$
  dv(u_1, e_1) & = 1 - 2 e_1^* - e_2 = 0 => e_1 = "BR"_1 (e_2) = (1 - e_2)/2 \
  dv(u_2, e_2) & = 1 - 2 e_2^* - e_1 = 0 => e_2 = "BR"_2 (e_1) = (1 - e_1)/2 \
$

We know, that the Nash equilibrium is the point where the best response functions intersect, so we can set them equal to each other and solve for $e_1$ and $e_2$:
$
  therefore e_1^* = e_2^* = 1/3 => u_i (1/3, 1/3) = 1/9
$

However, it seems that if the villagers could coordinate and agree to put in less effort, they could achieve a better outcome. For example, if both villagers agreed to put in an effort of 1/4, they would each receive a payoff of 3/16, which is higher than the payoff at the Nash equilibrium. This illustrates the tragedy of the commons, where individual rationality leads to a collectively suboptimal outcome.

=== Cooperation and Communication

Let us consider that the villagers choose to maximize their joint payoff instead of their individual payoffs. In this case, they would choose the level of effort that maximizes the sum of their payoffs:
$
  u_T & = u_1 + u_2 \
  & = e_1 [1 - (e_1 + e_2)] + e_2 [1 - (e_2 + e_1)] \
  & = (e_1 + e_2) [1 - (e_1 + e_2)]
  => dv(u_T, e_1) &= 1 - 2 (e_1 + e_2) = 0 => e_1 + e_2 = 1/2
$
Thus, if the villagers could coordinate and agree to put in a total effort of 1/2#footnote[Or we assume they put in the same effort of $1/4$], they would each receive a payoff of 1/8, which is higher than the payoff at the Nash equilibrium. This shows that cooperation and communication can lead to better outcomes in games like the tragedy of the commons. But the problem is that without enforceable agreements, there is always an *incentive for each villager to deviate* and put in more effort to increase their own payoff, which can lead to the tragedy of the commons.

#exam[Proving Deviation is Better][
  Now, say that they agree to $(1/4, 1/4)$, but then $V_1$ uses the best response function to find that if $V_2$ puts in an effort of $1/4$, then $V_1$ can choose,
  $ e_1 = "BR"_1 (1/4) = (1 - 1/4)/2 = 3/8 $
  At which the payoff for $V_1$ would be,
  $
    u_1 (3/8, 1/4) = 3/8 [1 - (3/8 + 1/4)] = 3/8 [1 - 5/8] = 3/8 [3/8] = 9/64 > 1/8
  $
  And thus, seeing this $V_2$ would also want to deviate and put in more effort, leading to a worse outcome for both villagers. This illustrates the difficulty of sustaining cooperation in games like the tragedy of the commons, where individual incentives can lead to collective failure.
]

=== Iterated Strict Dominance

Now, this is pretty trivial, we restrict the range of $e_1$ which restricts the range of $e_2$ and so on, until we are left with only one strategy profile, which is the Nash equilibrium.

Initially, $e_i in [0, 1]$, now the iterations are as follows:
$ [0, 1/2] -> [1/4, 1/2] -> [1/4, 3/8] -> dots -> 1/3 $

== Cournot Duopoly

There are two firms, $F_1$ and $F_2$, that produce a homogeneous product. Each firm chooses the quantity of output to produce, and the price of the product is determined by the total quantity produced by both firms. The payoffs for each firm depend on their own output and the output of the other firm.

#exam[Game of Cournot Duopoly][
  In this game, the players are the firms $F_1$ and $F_2$, the strategies are the quantities of output ${q_1, q_2}$, and the payoffs are determined by the market price and production costs. The rule is that both firms choose their output levels simultaneously without knowledge of the other firm's choice.
]

Say the firms produce $q_1$ and $q_2$ units of output, and the market price#footnote[I kinda had a nice thought that maybe the equations comes from the differential equation $pdv(P, q_i) = -b$] is given by $P = a - b (q_1 + q_2)$, where $a$ and $b$ are positive constants. The cost of production for each firm is given by $C_i = c q_i$, where $c$ is the marginal cost. The payoff for each firm can be expressed as:
$
  u_1 (q_1, q_2) = q_1 (a - c - b (q_1 + q_2)) \
  u_2 (q_2, q_1) = q_2 (a - c - b (q_1 + q_2))
$
Finding the Nash equilibria is similar to _Tragedy of Commons_ and easy,
$
  (q_1^*, q_2^*) = ((a-c)/(3 b), (a-c)/(3 b)) => u_i (q_i^*, q_(-i)^*) = (a-c)^2 / (9 b)
$

Honestly, this is pretty *uninteresting*, at $a = b = 1$ and $c = 1$, we get the exact same scenario as the tragedy of the commons, where both firms produce $1/3$ of the output and get a payoff of $1/9$. This illustrates how competition can lead to suboptimal outcomes for firms in a duopoly, similar to how individual incentives can lead to the tragedy of the commons.

Also, I won't be a _little bitch_ and calculate everything for this again.

= Strategic Decision Making

== Final Offer Arbitration

Consider a union which demands a wage and a firm which proposes a different wage but cannot agree easily. So instead an arbitrator is hired. This arbitrator instead of choosing any _compromise number_ follows a rule:
- Each side submits one final offer
- The arbitrator *must choose only one of the offers*
In this scenario, neither party can choose something extreme since the loss will be too extreme. So, you must choose something reasonable which has a higher chance of being closer to something choosen. This encourages *moderation*.

== Strategic Voting

It is a situation in which a voter does not vote for their true most-preferred alternative, but instead votes in a way that produces a more favorable outcome given how others are expected to vote.

A very simple example is when there are three candidates, A, B, and C, and a voter prefers $"A" > "B" > "C"$. If the voter believes that A has no chance of winning and that B and C are the main contenders, they might *vote for B instead* of A to prevent C from winning. This is an example of strategic voting, where the voter is not voting for their true preference (A) but is instead voting strategically to influence the outcome in a way that they perceive as more favorable (B over C).

#exam[Not Done][
  The mathematical modelling of this chapter is not talked about anywhere in my course except the syllabus, so this is just there for completion.
]

= Mixed Strategy Games

This is different from _pure strategy games_ where players choose a specific action with certainty. In mixed strategy games, players randomize over their actions, assigning probabilities to each possible strategy.

Now, the game is still represented in normal form, but instead of choosing a single strategy, players choose a probability distribution over their strategies. The payoff for each player is then calculated as the expected payoff based on the probabilities assigned to each strategy.

#definition[Mixed Strategy][
  A mixed strategy of player $i$ is a probability distribution over $S_i$.
  $ sigma_i : S_i -> [0, 1] $
  such that $sum_(s_i in S_i) sigma_i (s_i) = 1$. The set of all mixed strategies for player $i$ is denoted by $Delta (S_i)$.
]
#definition[Mixed Strategy Profile][
  A mixed strategy profile is a tuple of mixed strategies, one for each player. It is denoted by $sigma = (sigma_1, sigma_2, dots.h, sigma_n)$ where $sigma_i in Delta (S_i)$ for each player $i$.
]

#definition[Mixed Strategy Nash Equilibrium][
  A mixed strategy profile $sigma^* = (sigma_1^*, sigma_2^*, dots.h, sigma_n^*)$ is a mixed strategy Nash equilibrium if for every player $i$,
  $
    u_i (sigma_i^*, sigma_(-i)^*) >= u_i (sigma_i, sigma_(-i)^*) med forall sigma_i in Delta (S_i)
  $
]

Moreover, since the strategies are random, the payoffs become _expected values_.
#definition[Expected Payoff][
  $
    U_i (sigma_1, sigma_2, dots, sigma_n) = sum_(s in S_1 times S_2 times dots times S_n) (product_(j = 1)^n sigma_j (s_j)) u_i (s)
  $
]

Let us look at a very simple childhood game *Rock-Paper-Scissors*.

== Rock-Paper-Scissors

Here, the players are two individuals, $P_1$ and $P_2$, who simultaneously choose one of three options: Rock, Paper, or Scissors. The payoff matrix is:
#align(center)[
  #table(
    align: center,
    columns: 5,
    table.cell(stroke: none, []), table.cell(colspan: 4, $P_2$),
    table.cell(rowspan: 4, align: center + horizon, [$P_1$]),
    [],
    [Rock],
    [Paper],
    [Scissors],
    [Rock], [$(0, 0)$], [$( -1, 1)$], [$(1, -1)$],
    [Paper], [$(1, -1)$], [$(0, 0)$], [$( -1, 1)$],
    [Scissors], [$( -1, 1)$], [$(1, -1)$], [$(0, 0)$],
  )
]

Well clearly, there are *no pure strategy Nash equilibria* in this game because for any pure strategy chosen by one player, the other player has a best response that beats it. For example, if $P_1$ chooses Rock, $P_2$ can choose Paper to win. If $P_1$ chooses Paper, $P_2$ can choose Scissors to win. If $P_1$ chooses Scissors, $P_2$ can choose Rock to win. Thus, there is *no stable outcome* where both players are choosing a pure strategy.

Now, let us say $sigma_2 = (p_"R", p_"P", p_"S")$, the expected payoffs for player $P_1$ when choosing Rock, Paper, and Scissors are:
$
  U_1 (R, sigma_2) & = 0 p_"R" + (-1) p_"P" + 1 p_"S" \
  U_1 (P, sigma_2) & = 1 p_"R" + 0 p_"P" + (-1) p_"S" \
  U_1 (S, sigma_2) & = (-1) p_"R" + 1 p_"P" + 0 p_"S"
$
In equilibrium, $U_1 (R) = U_1 (P) = U_1 (S) => p_"R" = p_"P" = p_"S" = 1/3$.

== Battle of the Sexes Revisited

Earlier, we looked at the Battle of the Sexes game in the context of pure strategies, but now we will analyze it using mixed strategies. In the pure strategy version, we found that there were two Nash equilibria: $("Football", "Football")$ and $("Ballet", "Ballet")$. However, in the mixed strategy version, we can find a unique mixed strategy Nash equilibrium where both players randomize over their choices.

Say $sigma_H = (p_"F", p_"B")$ and $sigma_W = (q_"F", q_"B")$, the expected payoffs for the husband and wife when choosing Football and Ballet are:
$
  U_H (F, sigma_W) & = 10 q_"F" + 0 q_"B" \
  U_H (B, sigma_W) & = 0 q_"F" + 5 q_"B" \
  U_W (F, sigma_H) & = 5 p_"F" + 0 p_"B" \
  U_W (B, sigma_H) & = 0 p_"F" + 10 p_"B"
$
In equilibrium, we have:
$
  U_H (F) = U_H (B) => 10 q_"F" = 5 q_"B" => q_"F" = 1/3, q_"B" = 2/3 \
  U_W (F) = U_W (B) => 5 p_"F" = 10 p_"B" => p_"F" = 2/3, p_"B" = 1/3
$
Thus, the mixed strategy Nash equilibrium is $sigma_H^* = (2/3, 1/3)$ and $sigma_W^* = (1/3, 2/3)$, meaning that the husband will choose Football with a probability of 2/3 and Ballet with a probability of 1/3, while the wife will choose Football with a probability of 1/3 and Ballet with a probability of 2/3.

= Auctions as Strategic Games

#definition[Auction][
    It is a mechanism with
    - *Players:* bidders and sometimes an auctioneer
    - *Strategies:* bidding rules
    - *Payoffs:* $"utility" = "value of the item" - "payment"$ if won else $0$
    - *Information Structure:* what each bidder knows
]

In auctions, each bidder must keep in mind what they bid and what the other bidders might bid, as well as the rules of the auction. The strategic interaction between bidders can lead to different outcomes depending on the type of auction and the information available to the bidders.

An auction is an *incomplete information game*.

== Types of Auctions

=== Open vs Sealed-Bid Auctions

An *open auction* is a _dynamic game_ where bids are observable and evolve over time. E.g. American auction where the price starts low and bidders can see each other's bids and choose to bid higher or drop out, Dutch auction where the price starts high and decreases until a bidder accepts the current price.

A *sealed auction* is a _static one-shot simultaneous-move game_ where bids are submitted without knowledge of others' bids. E.g. First-price sealed-bid auction where the highest bidder wins and pays their bid, second-price sealed-bid auction _(Vickrey auction)_ where the highest bidder wins but pays the second-highest bid.

== One-Sided vs Two-Sided Auctions

A *one-sided auction* involves only buyers or only sellers. E.g. a government auctioning off a license to operate a business is a one-sided auction with sellers, while an online marketplace where individuals can bid on items is a one-sided auction with buyers.

A *two-sided auction* involves both buyers and sellers. E.g. a stock exchange where buyers and sellers trade shares is a two-sided auction, as is an online platform that connects buyers and sellers for various goods and services.

== Valuation

#definition[Valuation][
    A bidder $i$ has a valuation $v_i >= 0$, which reflects how much the item is worth to them personally.
]

The utility of a bidder is given by:
$
    u_i = cases(
        v_i - p "if bidder wins",
        0 "if bidder loses"
    )
$

=== Private Value

In a *private value* auction, each bidder's valuation of the item is independent of others' valuations. For example, in an art auction, each bidder may have a different personal value for the artwork based on their tastes and preferences.

=== Common Value

In a *common value* auction, the item has the same value for all bidders, but this value is uncertain and bidders have different estimates of it. For example, in an oil drilling rights auction, the actual amount of oil in the ground is the same for all bidders, but each bidder may have a different estimate of how much oil there is based on their own geological surveys.

=== Interdependent Value

In an *interdependent value* auction, each bidder's valuation of the item depends on the valuations of other bidders. For example, in a spectrum auction for telecommunications, the value of a particular frequency band may depend on how many other bidders are interested in it and how much they are willing to pay, as this can affect the potential market share and profitability for the winning bidder.

#exam[Valuation vs Bid][
    It's important to note that a bidder's valuation of an item is not necessarily the same as the amount they choose to bid. The bid is a strategic decision that takes into account not only the bidder's own valuation but also their beliefs about other bidders' valuations and strategies, as well as the rules of the auction. For example, in a first-price sealed-bid auction, a bidder may choose to bid less than their true valuation to avoid the winner's curse#footnote[The winner's curse occurs when the highest bidder overpays for an item, leading to a loss], while in a second-price sealed-bid auction, it is a dominant strategy for bidders to bid their true valuation.#footnote[We'll look at this later]
]

== Vickrey Auction as a Strategic Game

In a Vickrey auction, each bidder submits a sealed bid, and the highest bidder wins but pays the second-highest bid. This creates an interesting strategic environment for bidders.

Let us try to figure out the best strategy for a bidder in a Vickrey auction.

Let us focus on bidder $i$ and the opponents bid $b_(-i)$. Define the maximum bid among the opponents as
$
    m := max_(j != i) b_j
$
If bidder $i$ bids $b_i$, their payoff can be expressed as#footnote[We assume that each bidder values the item at $v$]:
$
    u(b) = cases(
        v - m "if" b_i > m,
        0 "if" b_i <= m
    )
$
#theorem[
    We claim $b = v$ weakly dominates every other bid $b' != v$, i.e.,
    $
        forall m quad u(v) >= u(b')
    $
    with strict inequality for some $m$.
]
#proof[
    We will consider three cases based on the relationship between $b'$, $v$, and $m$:
    #columns(3)[
        *Case 1:* $m < v$
        For a truthful bid $b = v$, the payoff is,
        $
            u(v) = v - m > 0
        $
        For an alternative bid $b'$, we have two subcases:
        - If $b' > m$, then $u(b') = v - m$, which is equal to $u(v)$.
        - If $b' <= m$, then $u(b') = 0$, which is less than $u(v)$.
        Thus, in this case, $u(v) >= u(b')$ with strict inequality when $b' <= m$.

        #colbreak()

        *Case 2:* $m > v$
        For a truthful bid $b = v$, the payoff is,
        $
            u(v) = 0
        $
        For an alternative bid $b'$, we have two subcases:
        - If $b' > m$, then $u(b') = v - m < 0$, which is less than $u(v)$.
        - If $b' <= m$, then $u(b') = 0$, which is equal to $u(v)$.
        Thus, in this case, $u(v) >= u(b')$ with strict inequality when $b' > m$.

        #colbreak()

        *Case 3:* $m = v$
        For a truthful bid $b = v$, the payoff is,
        $
            u(v) = 0
        $
        For an alternative bid $b'$, we have two subcases:
        - If $b' > m$, then $u(b') = v - m = 0$, which is equal to $u(v)$.
        - If $b' <= m$, then $u(b') = 0$, which is equal to $u(v)$.
        Thus, in this case, $u(v) >= u(b')$ with equality for all $b'$.
    ]
]

= Linear and Network Games

== Network Games

#definition[Network Game][
    It is a game where players are located on the nodes of a network and their payoffs depend on the actions of their neighbors in the network. The strategies of each player can be influenced by the structure of the network and the actions of their neighbors.

    A standard linear network games has the payoff function for player $i$ as:
    $
        u_i = a_i x_i - 1/2 x_i^2 + beta sum_(j in N(i)) g_(i j) x_i x_j
    $
    where $x_i$ is the strategy of player $i$, $a_i$ is a parameter that captures the intrinsic value of the strategy for player $i$, $beta$ is a parameter that captures the strength of the interaction between players, and $g_(i j)$ is an element of the adjacency matrix of the network, which indicates whether players $i$ and $j$ are neighbors.
]

#exam[Network Games][
    We only have *Network Congestion Games* and only *Braess' Paradox* is talked about in the course, so I will just talk about that.
]

=== Braess' Paradox

Braess' Paradox is a phenomenon in network games where adding an extra link to a transportation network can lead to worse overall traffic congestion. This counterintuitive result occurs because the new link can change the equilibrium of the game in such a way that all drivers end up taking routes that are more congested than before.

Say we have the following network with $4000$ drivers:
#figure(
    image("imgs/Img1.jpg", width: 80%)
)
Here, the Nash equilibrium is for $2000$ drivers to take the upper route and $2000$ drivers to take the lower route, resulting in a travel time of $45 + 2000/100 = 65$ minutes for each driver.#footnote[Confirm this by assuming one driver deviates and takes the other route, they will have a travel time of $45 + 2001/100 = 65.01$ minutes, which is worse than sticking to the original route]

Now, say we add a path that goes from A to B with a travel time of $0$ minutes. This creates a new route for drivers to take, and the Nash equilibrium changes. Now, all drivers will choose the route Start -> A -> B -> End, which has a travel time of $45 + 4000/100 = 85$ minutes, which is worse than the original equilibrium. This illustrates Braess' Paradox, where adding an extra link to the network can lead to worse overall congestion.

This has had real-world implications, as it has been observed in traffic networks that adding new roads can sometimes lead to increased congestion, and in some cases, removing roads can actually improve traffic flow.
- Stuggart, Germany: In the 1960s, a new highway was built to alleviate traffic congestion, but it ended up increasing travel times for commuters. The highway was eventually removed, and traffic flow improved.
- Seoul, South Korea: In the early 2000s, a major highway was removed to create a public park, and traffic congestion in the area decreased significantly.

== Linear Market Models

#definition[Linear Market Model][
    It is a model of a market where the demand and supply functions are linear. The demand function can be expressed as $D(p) = a - b p$ and the supply function can be expressed as $S(p) = c + d p$, where $a$, $b$, $c$, and $d$ are positive constants, and $p$ is the price of the good.
]

A classical example is the *Cournot duopoly* we discussed earlier, where two firms choose quantities to produce and the price is determined by a linear demand function. Another example is the *Bertrand duopoly*, where two firms choose prices instead of quantities, and the demand is also linear.

=== Hotelling Problem

The Hotelling problem is a model of spatial competition where two firms choose locations along a line to maximize their market share. The demand for the firms' products is determined by the distance of consumers from the firms, and the firms must strategically choose their locations to attract customers while considering the location of their competitor.

Consider the consumers to be uniformly distributed along a line segment $[0, 1]$ and two firms, $F_1$ and $F_2$, choose locations $x_1$ and $x_2$ along this line. The consumers will buy from the firm that is closest to them, so the market share for each firm can be determined by the location of the firms. The payoff for each firm is proportional to its market share, which depends on the distance of consumers from the firms.

We will study a specific case of the problem, *Ice Cream Vendors*, where the firms are selling ice cream and the consumers are located along a beach. The firms must choose their locations to maximize their market share while considering the location of their competitor.
Even if both of them start of at the extreme ends of the beach, they have the exact same market share, however, both of them have an incentive to move towards the center of the beach to capture more customers, which leads to a situation where both firms end up in the *middle of the beach*#footnote[This is called the Principle of Minimum Differentiation], resulting in a Nash equilibrium. This illustrates how competition can lead to clustering of firms in the same location, which is a key insight from the Hotelling problem.

This model has been used to analyze various real-world scenarios, such as the location of retail stores, political candidates' positions on issues, and even the distribution of species in ecology. It highlights the importance of strategic decision-making in competitive environments and how firms or individuals may choose to differentiate themselves or cluster together based on the actions of their competitors.

It assumes *Single-Peaked Preferences*, meaning that consumers have a most preferred location and their preference decreases as they move away from that location. This is a key assumption that leads to the clustering outcome in the Hotelling problem.

= Information Structures

Information structures specify what each player knows about the game, including the payoffs, strategies, and types of other players. The information structure can significantly affect the strategies and outcomes of a game. It includes:
- timing of moves (simultaneous or sequential)
- observability of actions (perfect or imperfect information)
- knowledge of payoffs (complete or incomplete information)

== Information Sets

#definition[Information Set][
    An information set for a player is a collection of decision nodes in the game tree such that the player cannot distinguish between them based on the information available to them at that point in the game. In other words, when a player is at an information set, they do not know which specific node they are at within that set, but they know that they are at one of those nodes.
]
If two nodes are in the same information set, the player must choose the *same action* at both. This is because the player cannot distinguish between the nodes in the information set, so they must have a consistent strategy that applies to all nodes in that set.

== Perfect Information

A game has perfect information if every player knows *all previous actions* when making a decision. Thus, every information set is *singleton*.

== Imperfect Information

A game has imperfect information if there exists at least one information set that contains more than one decision node. This means that at least one player does not know all previous actions when making a decision.

= Extensive Form Games

An *extensive form game* is a way to model a strategic interaction where the _timing of moves_, _order of play_, and _information available to players at each step_ are explicitally represented.

#definition[Exetnsive Form Representation][
    An extensive-form game consists of:
    - *Players:* a finite set of players $N$.
    - *Game Tree*
        - *Nodes:* Decision points
        - *Edges:* Actions
        - *Root:* Starting point
        - *Terminal nodes:* Outcomes
    - *Player Function:* Assigns each decision node to a player (who moves there)
    - *Action Sets:* At each node, the available actions
    - *Information Sets:* For each player, a partition of their decision nodes into information sets
    - *Payoff Function:* Assigns a payoff to each player for each terminal node
]

#figure(
    image("imgs/Img2.jpg", width: 80%)
)

== Subgame Perfect Equilibrium

It is a refinement of Nash equilibrium for extensive-form games, where the strategy profile constitutes a Nash equilibrium in every subgame of the original game. This concept eliminates non-credible threats and ensures that players' strategies are optimal at every point in the game.

#definition[Subgame][
    A subgame is a part of the game that can be considered a game in itself, starting from a single decision node and including all its descendants. Formally, a subgame must satisfy the following conditions:
    - It must start at a single decision node (the root of the subgame).
    - It must include all the descendants of that node.
    - It must not cut across any information sets; that is, if a node is included in the subgame, then all nodes in the same information set must also be included.
]

#exam[Why Nash is not sufficient for extensive-form games?][
    In dynamic games, a Nash equilibrium can contain *non-credible threats*, like actions that hurt both but obviously won't be taken by a rational player. Nash equilibirum may still accept this because it only check deviations _globally_ not at every decision point.
]

#exam[Finding Subgame Perfect Equilibrium][
    To find the subgame perfect equilibrium, we can use *backward induction*. We start from the terminal nodes of the game tree and determine the optimal actions for the players at each decision node, working our way back to the root of the tree. This process ensures that we are considering the optimal strategies for every subgame, leading to a strategy profile that is a Nash equilibrium in every subgame.
]

Subgame Perfect Equilibrium requires that at every point in the game, players' strategies must be optimal given what follows, thus even *off-equilibrium paths* must be rational.
