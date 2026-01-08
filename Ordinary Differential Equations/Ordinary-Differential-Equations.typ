#import "../template.typ": conf, definition, solution
#import "@preview/thmbox:0.2.0": *
#import "@preview/ilm:1.4.2": *
#import "@preview/physica:0.9.7": *

#show: conf

#show: ilm.with(
  title: [Ordinary Differential Equations],
  author: "Sarika Goyal 💝",
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

The set of all solutions of an n-th order differential equation contains n arbitrary constants.

There are three types of solutions to differential equations:
#columns(2)[
  #definition[General Solution][
    The *general solution* of an n-th order differential equation is the solution that contains n arbitrary constants.
  ]
  #colbreak()
  #definition[Singular Solution][
    A *singular solution* of a differential equation is a solution that cannot be obtained from the general solution by any choice of the arbitrary constants.
  ]
]
#definition[Particular Solution][
  A *particular solution* of a differential equation is obtained by assigning specific values to the arbitrary constants in the general solution.
]
#colbreak()

#definition[Linearly Independent Functions][
  The functions ${f_i}_1^n$ is said to be linearly independent on an interval $I$ if the equation $sum c_i f_i (x) = 0$ holds for all $x in I$ only when all constants $c_i = 0$. Otherwise, they are said to be linearly dependent on $I$.
]

#definition[Wronskian][
  The *Wronskian* of n functions ${f_i}_1^n$ is defined as:
  #set math.mat(delim: "|")
  $
    W(f_1, f_2, dots, f_n) = mat(
      f_1, f_2, dots, f_n;
      dv(f_1, x), dv(f_2, x), dots, dv(f_n, x);
      dots.v, dots.v, dots.down, dots.v;
      dv(f_1, x, n-1), dv(f_2, x, n-1), dots, dv(f_n, x, n-1)
    )
  $
  If the Wronskian is non-zero at some point in the interval $I$, then the functions are linearly independent on $I$.#footnote[However, if the Wronskian is zero at some point, it does not necessarily imply that the functions are linearly dependent.]
]

#theorem[Existence and Uniqueness Theorem for $n^"th"$ Order ODE][
  Let $a_i(x)$ be continuous functions on an interval $I$ containing the point $x = x_0$ with $a_0(x) != 0$. Then, for any given initial conditions:
  $
    y^(i) (x) = c_(i + 1) quad forall i = 0, 1, dots, n - 1
  $
  there exists a unique solution $y = g(x)$ of the n-th order ODE on the interval $I$ that satisfies these initial conditions.
]
#proof[Linear Independence of Solutions of Homogeneous Linear ODE][
  If ${Phi_i}_1^n$ are n solutions of the homogeneous linear ODE:
  $
    sum a_i (x) dv(y, x, i) + a_0(x) y = 0
  $
  on an interval $I$.
  Say $Phi_i^(i - 1)(x_0) = 1$ and the other derivatives be $0$ for $i = 1, 2, dots, n$ at some point $x_0 in I$. Now, looking the Wronskian at $x = x_0$, we see an identity matrix, which has a non-zero determinant. Thus, by the property of Wronskian, the solutions ${Phi_i}_1^n$ are linearly independent on $I$.
]

#proof[Uniqueness of a Solution][
  Consider n solutions ${y_i}_1^n$ of the n-th order ODE satisfying the given initial conditions. Let us form a linear combination of these solutions:
  $
    y = sum c_i Phi_i
  $
  Consider another solution $y'$ of the same ODE satisfying the same initial conditions. Now, the difference $Y = y - y'$ is also a solution of the homogeneous part of the ODE. The initial conditions for $Y$ are:
  $
    Y^(i) (x_0) = 0 quad forall i = 0, 1, dots, n - 1
  $
  Since ${Phi_i}_1^n$ are linearly independent, the only solution to this system of equations is $c_i = 0$ for all $i$. Thus, $Y = 0$, which implies $y = y'$. Hence, the solution is unique.
]
