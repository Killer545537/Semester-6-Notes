#import "../template.typ": conf, definition, solution
#import "@preview/thmbox:0.2.0": *
#import "@preview/ilm:1.4.2": *
#import "@preview/physica:0.9.7": *

#show: conf

#show: ilm.with(
  title: [Special Functions],
  author: "Vijay Gupta",
)
#set math.equation(numbering: none)

= The Lambert W Function

== Definition

The *Lambert W Function*, also called the _Omega function_ or the _Product Logarithm_, is defined as, $ W(x) = f^(-1) (x) $ where $f(x) = x e^x$.

This helps us find the solution to equations of the form, $ x e^x = k $ for some constant $k$ which cannot be found using elementary functions#footnote[A combination of algebraic operations, exponentials, logarithms, or trigonometric functions].

However, it is pretty clear that the function is not one-to-one. Therefore, the inverse is not well-defined over the entire domain of $f(x)$. To make this function well-defined we restrict the domain to the increasing part of the function.

== Principle Branch and Special Values

We observe that,
- $x >= 0$, we have exactly one solution
- $-1/e <= x < 0$, we have two solutions
- $x < -1/e$, we have no real solutions

Thus, we need to make sure of a few things and get some definitions out of the way.

#grid(
  columns: (1fr, 2fr),
  gutter: 10pt,

  figure(
    image("imgs/xex.png", height: 10%),
    caption: [Graph of $f(x) = x e^x$],
  ),
  [
    Clearly, $dv(y, x) = 0 => x = -1$, and $dv(y, x, 2) lr(|, size: #200%)_(x = -1) > 0$, thus, $x=-1$ is the minima.

    Now, for $x >= -1$, we see that the range is $[-1/e, infinity)$
  ],
)
Therefore, we restrict the domain to $[-1, infinity)$ and the range to $[-1/e, infinity)$.

Hence, we arrive at, $ W(x): [-1/e, infinity) -> [-1, infinity) $

This is called the *Principal Branch* of the Lambert W function and is denoted by $W_0 (x)$.
$
  W(x)e^(W(x)) & = x quad (x >= -1/e) \
      W(x e^x) & = x quad (x >= -1)
$

Some special values of the function are:
#columns(2)[
  $
       W(0) & = 0 \
       W(e) & = 1 \
    W(-1/e) & = -1 \
  $
  #colbreak()
  $
    W(2 ln 2) & = ln 2 \
     W(-pi/2) & = (i pi)/2 quad ("This is outside the principal branch")
  $
]

#example[
  Solve $ x + e^x = 2 $
]
#solution[
  $
    ln u + ln e^u & = 2 => ln (u e^u) = 2 \
            u e^u & = e^2 => u = W(e^2) \
      therefore x & = ln W(e^2) \
  $
]

== Derivative of the Lambert W Function

To find the derivative of the Lambert W function, we start with the defining equation:
$
  W(x) e^(W(x)) & = x \
  => W'(x) e^(W(x)) + W(x) e^(W(x)) W'(x) & = 1 quad ("Product Rule") \
  therefore W'(x) &= 1/(x + e^(W (x))) = (W(x))/(x (1 + W(x))) \
$

In general, the nth derivative of the Lambert W function is given by the Faà di Bruno's formula:
$
  W^(n) (x) = (-1)^(n - 1) / x^n sum_(k = 1)^n binom(n, k) (k^(n - 1) W^k (x))/(1 + W(x))^(n + k - 1)
$
The above formula is kinda just a flex, and we'll just use the quotient rule to find the second or third derivative when needed.

== Integral of the Lambert W Function

There are two approaches, one is sir's method and the other one is pretty good to look at.

#theorem[Integral of the Inverse][
  Consider an integrable and invertible function $f$ such that, $ integral f(x) dd(x) = F(x) $ and $f^(-1)$ is its inverse. Then,
  $
    integral f^(-1) (x) dd(x) = x f^(-1) (x) - F(f^(-1) (x)) + c
  $
]

By definition, we have $W(x) = f^(-1) (x)$ where $f(x) = x e^x$ and $F(x) = integral x e^x dd(x) = (x - 1) e^x + c$. Thus, simply substituting in the above theorem gives us,
$
  integral W(x) dd(x) = x W(x) - (W(x) - 1) e^(W(x)) + c = x W(x) - x + x/W(x)
$

Using all the above results and literally just looking at the problems, we can solve any shit ass question on the Lambert W Function.
