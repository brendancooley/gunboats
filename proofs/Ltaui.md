Government $i$'s optimal policy does not depend on the policy choice of $j$. As such, it is sufficient to show that the government's objective function has a negative cross partial with respect to $\tau_i$, $a_i$,
$$
\frac{\partial^2 G_i}{\partial a_i \partial \tau_{ij}} < 0
$$
Applying derivations from the proof of Lemma `r Lqccv`,
\begin{align*}
\frac{\partial^2 G_i}{\partial a_i \partial \tau_{ij}} &= V_i^\prime(\tau_i) \\
&= r^\prime(\tau_i) P_i(\tau_i)^{\alpha} - \alpha P_i(\tau_i)^{\alpha} I(\tau_i) A(\tau_i) \\
&= \alpha P_i(\tau_i)^{\alpha} I(\tau_i) \left( (\alpha I(\tau_i))^{-1} r^\prime(\tau_i) - A(\tau_i) \right) \\ 
&= \alpha P_i(\tau_i)^{\alpha} I(\tau_i) \left( (\alpha I(\tau_i))^{-1} \left( (\tau_i - 1) p^\star x_{ij}^{\star \prime}(\tau_i) + p^\star x_{ij}^\star(\tau_i) \right) - A(\tau_i) \right) \\
&= P_i(\tau_i)^{\alpha} I(\tau_i) \left( (\alpha I(\tau_i))^{-1} (\tau_i - 1) p^\star x_{ij}^{\star \prime}(\tau_i) + A(\tau)_i - A(\tau_i) \right) \\
&= P_i(\tau_i)^{\alpha} \alpha^{-1} (\tau_i - 1) p^\star \underbrace{x_{ij}^{\star \prime}(\tau_i)}_{<0}
\end{align*}
where the final inequality follows from Lemma `r Ltauj`. $\blacksquare$