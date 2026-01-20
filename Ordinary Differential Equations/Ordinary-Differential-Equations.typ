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

= Ordinary Differential Equations

== Definitions

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

== Solutions of an ODE

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

== Linear Independence of Solutions

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

#theorem[
  There exist two linearly independent solutions $y_1$ and $y_2$ of the equation $ a_0 y'' + a_1 y' + a_2 y = 0 $ such that every solution $y$ can be expressed as $y = c_1y_1 + c_2 y_2$ where $c_1$ and $c_2$ are arbitrary constants.
]

#theorem[
  Two solutions $y_1$ and $y_2$ of the equation $ a_0 y'' + a_1 y' + a_2 y = 0 $ are lineary dependent iff their wronskian is identically zero in $[a, b]$.
]
#proof[
  First we prove the "if" part. Suppose $y_1$ and $y_2$ are linearly dependent. Thus, there exist constants $c_1$ and $c_2$, not both zero,
  $
           c_1 y_1 + c_2 y_2 & = 0 quad forall x in [a, b] \
    => c_1 y_1 ' + c_2 y_2 ' & = 0
  $
  Since the above equations have a non-trivial solution, the determinant of the coefficients must be zero. Thus, $ mat(delim: "|", y_1, y_2; y_1 ', y_2 ') = 0 $

  Now we prove the "only if" part. Suppose the wronskian is identically zero in $[a, b]$. Thus, at some point $x_0 in [a, b]$, we have,
  $ mat(delim: "|", y_1(x_0), y_2(x_0); y_1 '(x_0), y_2 '(x_0)) = 0 $
  Thus, there exist constants $c_1$ and $c_2$, not both zero,
  $
        c_1 y_1 (x_0) + c_2 y_2 (x_0) & = 0 \
    c_1 y_1 ' (x_0) + c_2 y_2 ' (x_0) & = 0
  $
  Let $Y = c_1 y_1 + c_2 y_2$. Then, $Y$ is a solution of the equation $a_0 y'' + a_1 y' + a_2 y = 0$ satisfying the initial conditions $Y(x_0) = 0$ and $Y'(x_0) = 0$.\
  By the existence and uniqueness theorem, we have $Y = 0$ for all $x in [a, b]$. Thus, $y_1$ and $y_2$ are linearly dependent.
]

#corollary[
  Two solutions $y_1$ and $y_2$ of the equation $ a_0 y'' + a_1 y' + a_2 y = 0 $ are lineary independent iff their wronskian is not identically zero at some point in $[a, b]$.
]

#theorem[
  The wronskian of two solutions of the equation $ a_0 y'' + a_1 y' + a_2 y = 0 $ is either identically zero or never zero in the interval $[a, b]$.
]
#proof[
  Let $y_1$ and $y_2$ be two solutions of the equation $a_0 y'' + a_1 y' + a_2 y = 0$.\
  Let their wronskian be $W = mat(delim: "|", y_1, y_2; y_1 ', y_2 ')$.

  $
                          W' & = y_1 y_2 '' - y_1 '' y_2 ' \
                             & = -a_1/a_0 (y_1 y_2 ' - y_1 ' y_2) \
                          W' & = -a_1/a_0 W \
    therefore a_0 W' + a_1 W & = 0
  $
  Say $W$ is a solution of the above equation. We now have two cases to consider:
  - *Case 1:* If $W(x) != 0 med forall x in [a, b]$, then we are done
  - *Case 2:* If there exists some point $x_0 in [a, b]$ such that $W(x_0) = 0 => W'(x_0) = 0$, then by the existence and uniqueness theorem, we have $W = 0 med forall x in [a, b]$
]

#example[
  Compute the wronskian of $x^2$ and $x^2 ln x$. Can these be linearly independent solutions of a second order linear ODE? If so, find the ODE.
]
#show figure.where(kind: "thmbox"): set block(breakable: true)
#solution()[
  The wronskian is given by:
  $
    mat(
      delim: "|",
      x^2, x^2 ln x;
      2x, 2x ln x + x
    ) = x^3
  $
  Since the wronskian is not identically zero (in $bb(R)$), these functions can be linearly independent solutions of a second order linear ODE.\
  To find the ODE, which I am not a bitch so I won't do, can be found using, $ y = c_1 x^2 + c_2 x^2 ln x $ and then finding $c_1$ and $c_2$.
]

#lemma[Abel's Formula][
  Consider the differential equation $y'' + P y' + Q y = 0 med forall x in I$ where $P$ and $Q$ are continuous functions defined on $I$. Let $y_1$ and $y_2$ be linearly independent solutions of the above equation, then,
  $ W(y_1, y_2)(x) = exp(- integral_(x_0)^x P(x) dd(x)) W(y_1, y_2)(x_0) $
]
#proof[Abel's Formula][
  $
    W(y_1, y_2) &= y_1 y_2 ' - y_1 ' y_2 \
    => W' &= y_1 y_2 '' - y_1 '' y_2 \
    &= -P W quad ("Putting the solutions in the equation") \
    => integral_(x_0)^x W'/W dd(x) &= integral_(x_0)^x -P dd(x) \
    therefore W(y_1, y_2)(x) &= exp(- integral_(x_0)^x P(x) dd(x)) W(y_1, y_2)(x_0)
  $
]

= Solution of First Order Ordinary Differential Equations

We already know that the solution of the general first order differential equation of the type, $ y' + P y = Q $ is given by,
$
  y * "IF" = integral Q * "IF" dd(x) quad ("where" "IF" = exp(integral P dd(x)))
$

== Exact Differential Equation

#definition[Exact Equation][
  An expression $M dd(x) + N dd(y) = 0$, where $M$ and $N$  are functions of $x$ and $y$, is called an exact differential equation if there exists a function $F$ such that,
  $
    M dd(x) + N dd(y) = dd(F)
  $#footnote[$dd(F)$ rrepresents the total differential of $F$ given by $dd(F) = pdv(F, x) dd(x) + pdv(F, y) dd(y)$]
]

#definition[Exact Differential Equation][
  Consider the differential equation, $ M dd(x) + N dd(y) = 0 $ where $M$ and $N$ are continuous functions and have continuous partial derivatives for all points $(x, y)$ in $bb(R)^2$. Then the necessary and sufficient condition for it to be exact is,
  $ pdv(M, y) = pdv(N, x) $
]

=== Solution

The solution is somewhat clear from the definition of an exact differential equation,
$F = c$
where $c$ is any constant and $F$ is such that $pdv(F, x) = M$ and $pdv(F, y) = N$.

Finding, $F$ on the other hand is not so trivial but has pretty easy steps which are trivial.

=== Inexact Differential Equations

Say $M dd(x) + N dd(y) = 0$ is not exact, then, we can mutiply by some function say $mu$ such that,
$ mu M dd(x) + mu N dd(y) = 0 $
is exact. Then $mu$ is said to be an integrating factor.

We can look at cases where $mu$ can be figured out if it is a function of $x$ or $y$ but that's for uncool people.
