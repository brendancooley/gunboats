Government $i$'s optimal policy does not depend on the policy choice of $j$. As such, it is sufficient to show that the government's objective function has a negative cross partial with respect to $\tau_i$, $a_i$,
$$
\frac{\partial^2 G_i}{\partial a_i \partial \tau_{ij}} < 0
$$
Here we have
\begin{align*}
\frac{\partial^2 G_i}{\partial a_i \partial \tau_{ij}} &= - \frac{\sigma - 1}{\sigma} n^{\frac{1}{\sigma - 1}} \left( 1 + \tau_i^{1 - \sigma} \right)^{\frac{1}{\sigma - 1} - 1} \tau_i^{- \sigma} \alpha L
\end{align*}
To see that $\tau_i^\star(\bar{a}) = 1$, we can show that the first order condition evaluated at $\tau_i = 1$ equals zero when $a_i = \bar{a}$. From above, the first order condition evaluated at $\tau_i = 1$ is
$$
0 = - a_i p^{-1} (2n)^{\frac{1}{\sigma - 1}} + \sigma + \frac{1}{2} (1 - \sigma) (1 + p^{-1})
$$
Substituting $\bar{a}$ confirms that $\tau_i^\star(\bar{a}) = 1$. $\blacksquare$