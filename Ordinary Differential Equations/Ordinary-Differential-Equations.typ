#import "../template.typ": conf, definition, solution
#import "@preview/thmbox:0.2.0": *
#import "@preview/ilm:1.4.2": *
#import "@preview/physica:0.9.7": *

#show: conf

#show: ilm.with(
  title: [Ordinary Differential Equations],
  author: "Sarika Goyal",
)
#set math.equation(numbering: none)

= Introduction

#definition[Differential Equation][
  An equation involving derivatives of one or more dependent variables with respect to one or more independent variables is called a *differential equation*.
]
We have two types of differential equations:
#columns(2)[
  #definition[Ordinary Differential Equation][
    A differential equation involving derivatives with respect to a single independent variable is called an *ordinary differential equation (ODE)*.
  ]
  #colbreak()
  #definition[Partial Differential Equation][
    A differential equation involving derivatives with respect to multiple independent variables is called a *partial differential equation (PDE)*.
  ]
]

#columns(2)[
  #definition[Order of a Differential Equation][
    The order of a differential equation is the order of the highest derivative present in the equation.
  ]
  #colbreak()
  #definition[Degree of a Differential Equation][
    The degree of a differential equation is the power of the highest order derivative present in the equation, provided the equation is free from radicals and fractions with respect to derivatives.
  ]
]

A general form of an ordinary differential equation of order n is given by:
$
  f(x, y, dv(y, x), dv(y, x, 2), dots, dv(y, x, n)) = 0
$
where $y$ is the dependent variable, $x$ is the independent variable, and $dv(y, x, k)$ represents the $k^"th"$ derivative of $y$ with respect to $x$.

A general form of a linear ordinary differential equation of order n is given by:
$
  sum a_i (x) dv(y, x, i) + a_0(x) y = f(x)
$
where $a_i (x)$ are functions of the independent variable $x$ continuous on some interval $I subset.eq bb(R)$, $f(x)$ is a given function. An ODE is said to be linear if it can be expressed in this form; otherwise, it is nonlinear.\
An ordinary differential equation is said to be homogeneous if $f(x) = 0$; otherwise, it is non-homogeneous.
- If ${y_i}_i^n$ are solutions of a homogeneous linear ODE, then any linear combination of these solutions is also a solution of the same ODE
- If $y_c$ are the solutions of the homogeneous part of a non-homogeneous linear ODE, and $y_p$ is a particular solution of the non-homogeneous ODE, then the general solution of the non-homogeneous ODE is given by $c y_c + y_p$

#definition[Solution of a Differential Equation][
  A function $y=g(x)$ is called a solution of a differential equation $f(x, y, dv(y, x), dv(y, x, 2), dots, dv(y, x, n)) = 0$ on an interval $I$ if:
  - $y = g(x)$ is n-times differentiable on $I$
  - Substituting $y = g(x)$ and its derivatives into the differential equation satisfies $forall x in I$
]
