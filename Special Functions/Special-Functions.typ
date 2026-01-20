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

= Error Functions

== Definition

The *Error Function* (_Gauss Error Function_), is defined as, $ erf(x) = 2/sqrt(pi) integral_0^x e^(-t^2) dd(t) $
Since the integrand $e^(-t^2)$ has no elementary antiderivative, $erf$ itself is not an elementary function.

== Complementary Error Function

The complementary error function is pretty similar with, $ "erfc"(x) = 1- erf(x) $

== Different Forms of Error and Complementary Error Functions

$erf(x)$ is the probability that $Y tilde cal(N)(0, sqrt(1/2))$ lies in the range $[-x, x]$. Thus, the error function is also called the _probability integral_.

=== Incomplete Gamma Function

We can represent the error function in terms of the _lower incomplete gamma function_ which is, $ gamma(s, x) = integral_0^x t^(s - 1) e^(-t) dd(t) $ by making the obvious substitution of $u = t^2$ in the error function. In the end we get,
$
  erf(x) & = gamma(1/2, x^2)/Gamma(1/2) quad (Gamma(1/2) = sqrt(pi)) \
  "erfc"(x) & = Gamma(1/2, x^2)/Gamma(1/2) quad (Gamma(s, x) = integral_x^infinity t^(s - 1) e^(-t) dd(t))\
$

=== Maclaurin Series

The Maclaurin series expansion of the error function is given by,
$
  erf(x) & = integral_0^x sum_(n=0)^infinity ((-1)^n t^(2n))/n! dd(t) \
         & = sum_(n=0)^infinity (-1)^n x^(2n + 1)/((2n + 1) n!) \
$

== Properties of Error Functions

$
         erf(0) & = 0 \
  erf(infinity) & = 1 \
        erf(-x) & = -erf(x) \
$

== Derivative of the Error Function

The derivative of the error function is given by,
$
             erf(x) & = 2/sqrt(pi) integral_0^x e^(-t^2) dd(t) \
  therefore erf'(x) & = 2/sqrt(pi) e^(-x^2) quad ("Using Leibniz's Rule") \
$

#theorem[Leibniz's Rule][
  If $f(x, t)$ is continuous in both variables and has a continuous partial derivative with respect to $x$ in the region $a <= t <= b$, then,
  $
    dv(, x) integral_(a(x))^(b(x)) f(x, t) dd(t) = f(x, b(x)) b'(x) - f(x, a(x)) a'(x) + integral_(a(x))^(b(x)) pdv(, x) f(x, t) dd(t)
  $
]

== Integral of the Error Function

To find the integral of the error function, we use integration by parts,
$
            I & = integral erf(x) dd(x) \
              & = x erf(x) - integral x erf'(x) dd(x) \
  therefore I & = x erf(x) + e^(-x^2)/sqrt(pi) + C
$

#example[Laplace Transform of the Error Function][
  Find $ L{erf(sqrt(t))} $
]
#solution[
  The Laplace Transform is given by,
  $
    L{erf(sqrt(t))} &= integral_0^infinity e^(-s t) erf(sqrt(t)) dd(t) \
    &= integral_0^infinity integral_0^sqrt(t) 2/sqrt(pi) e^(-s t - u^2) dd(u) dd(t) \
    &= integral_0^infinity integral_(u^2)^infinity 2/sqrt(pi) e^(-s t - u^2) dd(t) dd(u) quad ("Changing the order of the integral") \
    therefore L{erf(sqrt(t))} &= 1/(s sqrt(s+1)) \
  $
]

= Combinatorial Special Functions

== Stirling Numbers of the First Kind

#definition[Falling Factorial][
  The falling factorial, denoted by $x^(underline(n))$, is defined as,
  $
    x^(underline(n)) = x (x - 1) (x - 2) ... (x - n + 1) quad (n in bb(N))
  $
]

#definition[Rising Factorial][
  The rising factorial, denoted by $x^(overline(n))$, is defined as,
  $
    x^(overline(n)) = x (x + 1) (x + 2) ... (x + n - 1) quad (n in bb(N))
  $
]

#let usn(n, k) = {
  set math.mat(delim: "[")
  $mat(#n ; #k)$
}

#definition[Signed Stirling Number of the First Kind][
  The coefficient of $x^k$ in the expansion of the falling factorial $x^(underline(n))$ is called the _Signed Stirling Number of the First Kind_ and is denoted by $s(n, k)$.
  $ x^(underline(n)) = sum_(k = 1)^n s(n, k) x^k $
]

#definition[Unsigned Stirling Number of the First Kind][
  The coefficient of $x^k$ in the expansion of the rising factorial $x^(overline(n))$ is called the _Unsigned Stirling Number of the First Kind_ and is denoted by $usn(n, k)$.

  $ x^(overline(n)) = sum_(k = 1)^n usn(n, k) x^k $
]

It is pretty clear#footnote[Kinda in the name too tho] that, $ usn(n, k) = (-1)^(n - k) s(n, k) $

#example[Recurrence Relation][
  Prove that
  $
    s(n + 1, k) & = s(n, k - 1) - n s(n, k) \
      usn(n, k) & = usn(n - 1, k - 1) + (n - 1) usn(n - 1, k) \
  $
]
#solution[
  Compare the coefficients of $x^k$ on both sides of the equations.
]

#example[Generating Function][
  Prove that,
  $
    sum_(n = k)^infinity s(n, k) (x^n)/(n!) & = 1/k! ln^k (1 + x) \
    sum_(n = k)^infinity usn(n, k) (x^n)/(n!) & = 1/k! ln^k (1/(1-t)) quad abs(t) < 1 \
  $
]
#solution[
  Use the bionomial expansion of $(1+t)^x$ for the first one and $(1-t)^(-x)$ for the second one.
]

The above problems are trivial applications of the definitions and properties of the Stirling Numbers of the First Kind.

== Stirling Numbers of the Second Kind

#let snsk(n, k) = {
  set math.mat(delim: "{")
  $mat(#n ; #k)$
}
#definition[Stirling Numbers of the Second Kind][
  It is the number of ways to partition a set of n objects into k non-empty subsets. It is denoted by $snsk(n, k)$
  $ x^n = sum_(k = 0)^n snsk(n, k) x^underline(k) $
]

Here,
$
  snsk(0, 0) & = 1 \
  snsk(n, 0) & = 0 quad (n > 0) \
  snsk(0, n) & = 0 quad (n > 0)
$

#example[Generating Function][
  Prove that,
  $ sum_(n = k)^infinity snsk(n, k) = (e^t - 1)^k / k! $
]
#solution[
  Use the binomial expansion of $(e^t - 1)^x$.
]

#example[Recurrence Relation][
  Prove that,
  $ snsk(n + 1, k) = k snsk(n, k) + snsk(n, k - 1) quad (n > k > 0) $
]

== Touchard Polynomials

#definition[Touchard Polynomials][
  If $X$ is a random variable with a *Poisson Distribution* with expected value $lambda$, then its $n^"th"$ moment is $E(X^n) = T_n(lambda)$,
  $
    T_n (x) & = e^(-x) sum_(k = 0)^infinity (x^k k^n)/k! \
            & = sum_(k = 0)^n snsk(n, k) x^k
  $
]
The first few Touchard polynomials are,
$
  T_1 (x) & = x \
  T_2 (x) & = x^2 + x \
  T_3 (x) & = x^3 + 3x^2 + 7 \
  T_4 (x) & = x^4 + 6x^3 + 7x^2 + x
$

#example[Generating Function][
  $T_n$ is the coefficient of $t^n / n!$ in the expansion of, $exp(x(e^t - 1))$,
  $ sum_(n = 0)^infinity T_n (x) t^n/n! = exp(x(e^t - 1)) $
]
#solution[
  Use the definition of Touchard polynomials on the left.
]

#example[Binomial Type Relation][
  $ T_n (x + y) = sum_(k = 0)^n binom(n, k) T_k (x) T_(n-k) (y) $
]
#solution[
  Just use the above generating function. And for the product of summations, use the *Cauchy Product*.
]

#example[Recurrence Relation][
  $
    T_n (x) = x sum_(k = 1)^n binom(n - 1, k - 1) T_(n - k) (x) quad n >= 1
  $
]
#solution[
  Assume,
  $ F(t) = sum_(n = 0)^infinity T_n (x) t^n/n! = exp(x(e^t - 1)) $
  Differentiating and equating, we get the desired result.
]

#example[Rodrigues Formula][
  $ T_n (e^x) = e^(-e^(-x)) dv(, x, n) e^(-e^(x)) $
]
#solution[
  Use the generating function and interpret the right hand side as a Taylor Series.
]

= Bessel's Differential Equation

$ x^2 dv(y, x, 2) + x dv(y, x) + (x^2 - n^2)y = 0 quad n in bb(R) $
is called Bessel's Differential Equation.

== Series Solution of Bessel's Differential Equation

We find the solution as ascending powers of $x$. Say the solution is of the form, $ y = sum_(k = 0)^infinity a_k x^(k + m) quad a_0 != 0 $

Putting it in the differential equation and adjusting the indices we get, $ sum_(k = 0)^infinity {a_k [(k + m)^2 - n^2] + a_(k - 2)} x^(k + m) = 0 $

Equating the coefficient of the lowest power of $x$, i.e. $x^m$, we get, $m = plus.minus n$. Similarly, looking at $x^(m + 1)$, we get $a_1 = 0$.

Now, for the general recurrence, we equate the coefficient of $x^(k + m)$ to 0 to get, $ a_k = (-a_(k - 2)) / ((k + m)^2 - n^2) $
For the first case where $m = n$, we see, all the odd terms vanish and the remaining general terms can be given by, $ a_(2 r) = a_0 ((-1)^r n!)/(2^(2 r) r! (n+r)!) $

We take the standard normalisation as $a_0 = 1/2^n n!$, plugging it in, we get the series solution becomes,
$ J_n (x) = sum_(k = 0)^infinity (-1)^k / (k! (n+k)!) (x/2)^(n + 2k) $
This is known as Bessel Function of the First Kind of Order $n$.#footnote[In class, $J_n$ was written using the Gamma Function but I mean, I am not that old yet.]

#example[
  Show that $J_n$ is even when $n$ is even and odd when $n$ is odd.
]

#example[
  Show that,
  $ lim_(x -> 0) (J_n (x))/x^n = 1/(2^n n!) $
]
#solution[
  This is trivial and simply the first term after dividing by $x^n$.
]

#example[Generating Function][
  Show that,
  $ e^(x/2 (t - 1/t)) = sum_(n = -infinity)^infinity J_n (x) t^n $
]
#solution[
  This is kinda not that trivial, so...

  $
    e^(x/2 (t - 1/t)) & = sum_(k = 0)^infinity 1/k! (x/2)^k (t - 1/t)^k \
    &= sum_(k = 0)^infinity 1/k! (x/2)^k sum_(r = 0)^k binom(k, r) (-1)^(k-r) t^(2r - k)
  $
  Now, for a term to contribute to $t^n$, $2r - k = n => r = (k + n)/2 => k + n "must be even"$. From the limits, $ r in [0, k] => 2r - k in [ -k, k ] => -k <= n <= k => k >= |n| $ Using these facts, we can say that the general term for $k$ is $k = n + 2m$ where $m = 0, 1, dots.h$. Thus, the coefficient of $t^n$ is,
  $ sum_(m = 0)^infinity (-1)^m / (m! (n+m)!) (x/2)^(n + 2m) = J_n (x) $
  Thus, for every $n in bb(Z)$,
  $ e^(x/2 (t - 1/t)) = sum_(n = -infinity)^infinity J_n (x) t^n $
]
