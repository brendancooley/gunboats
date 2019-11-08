When $G_i^\prime(\tau_i) = 0$, $a_i V_i^\prime(\tau_i) = - \Pi_i^\prime(\tau_i)$. Note also $\Pi_i^\prime(\tau_i) = (\sigma - 1) \Pi_i(\tau_i) A(\tau_i)$ and $A^\prime(\tau_i) = A(\tau_i) B(\tau_i)$.
\begin{align*}
G_i^{\prime \prime}(\tau_i) =& a_i \left[ P_i(\tau_i)^{-\alpha} r_i^{\prime \prime}(\tau_i) - \alpha r_i^\prime(\tau_i) P_i(\tau_i)^{-\alpha} A(\tau_i) - \alpha V_i^\prime(\tau_i) A(\tau_i) - \alpha V_i(\tau_i) A^\prime(\tau_i) \right] + \\
& (\sigma - 1) \Pi_i^\prime(\tau_i) A(\tau_i) + (\sigma - 1) \Pi_i(\tau_i) A^\prime(\tau_i) \\
=& a_i \left[ P_i(\tau_i)^{-\alpha} r_i^{\prime \prime}(\tau_i) - \alpha r_i^\prime(\tau_i) P_i(\tau_i)^{-\alpha} A(\tau_i) - \alpha V_i^\prime(\tau_i) A(\tau_i) - \alpha V_i(\tau_i) A^\prime(\tau_i) \right] - \\
& (\sigma - 1) a_i V_i^\prime(\tau_i) A(\tau_i) - a_i V_i^\prime(\tau_i) B(\tau_i)
\end{align*}

Consider first the case where $a_i = \infty$. Then $V_i^\prime = 0 \implies \alpha V_i(\tau_i) A(\tau_i) = r_i^\prime(\tau_i) P_i(\tau_i)^{-\alpha}$. Then,
\begin{align*}
V_i^{\prime \prime}(\tau_i) &= r_i^{\prime \prime}(\tau_i) P(\tau_i)^{-\alpha} - \alpha r_i^\prime(\tau_i) P_i(\tau_i)^{-\alpha} A(\tau_i) - \alpha V_i^\prime(\tau_i) A(\tau_i) - \alpha V_i(\tau_i) A^\prime(\tau_i) \\
&= r_i^{\prime \prime}(\tau_i) P(\tau_i)^{-\alpha} - \alpha r_i^\prime(\tau_i) P_i(\tau_i)^{-\alpha} A(\tau_i) - \alpha V_i(\tau_i) A^\prime(\tau_i) \\
&= r_i^{\prime \prime}(\tau_i) P(\tau_i)^{-\alpha} - \alpha r_i^\prime(\tau_i) P_i(\tau_i)^{-\alpha} A(\tau_i) - \alpha V_i(\tau_i) A(\tau_i) B(\tau_i) \\
&= r_i^{\prime \prime}(\tau_i) P(\tau_i)^{-\alpha} - \alpha^2 V_i(\tau_i) A(\tau_i)^2 - \alpha V_i(\tau_i) A(\tau_i) B(\tau_i) \\
&= r_i^{\prime \prime}(\tau_i) P(\tau_i)^{-\alpha} - \alpha A(\tau_i) V_i(\tau_i) \left( \alpha A(\tau_i) + B(\tau_i) \right)
\end{align*}

Now examine $r_i^{\prime \prime}(\tau_i) P(\tau_i)^{-\alpha}$
\begin{align*}
P_i(\tau_i)^{-\alpha} r_i^{\prime \prime}(\tau_i) =& P_i(\tau_i)^{-\alpha} \left( r_i^\prime(\tau_i) B(\tau_i) + r_i(\tau_i) B^\prime(\tau_i) + x_{ij}^\star(\tau_i) B(\tau_i) + \lambda^\prime(\tau_i) r_i^\prime(\tau_i) + \lambda(\tau_i) r_i^{\prime \prime}(\tau_i) + p x_{ij}^{\star}(\tau_i) \left( \alpha I_i(\tau_i) \right)^{-1} r_i^\prime(\tau_i) \right) \\
=& P_i(\tau_i)^{-\alpha} \left( r_i^\prime(\tau_i) B(\tau_i) + r_i(\tau_i) B^\prime(\tau_i) + p x_{ij}^\star(\tau_i) B(\tau_i) + \lambda^\prime(\tau_i) r_i^\prime(\tau_i) + \lambda(\tau_i) r_i^{\prime \prime}(\tau_i) + A(\tau_i) r_i^\prime(\tau_i) \right) \\
=& P_i(\tau_i)^{-\alpha} r_i(\tau_i) B^\prime(\tau_i) + P_i(\tau_i)^{-\alpha} r_i^\prime(\tau_i) \left( A(\tau_i) + B(\tau_i) \right) + \alpha I(\tau_i) P_i(\tau_i)^{-\alpha} A(\tau_i) B(\tau_i) + \\
& P_i(\tau_i)^{-\alpha} \left( \lambda^\prime(\tau_i) r_i^\prime(\tau_i) + \lambda(\tau_i) r_i^{\prime \prime}(\tau_i) \right) \\
=& P_i(\tau_i)^{-\alpha} r_i(\tau_i) B^\prime(\tau_i) + \alpha V(\tau_i) A(\tau_i) \left( A(\tau_i) + B(\tau_i) \right) + \alpha V(\tau_i) B(\tau_i) + \\
& P_i(\tau_i)^{-\alpha} \left( \lambda^\prime(\tau_i) r_i^\prime(\tau_i) + \lambda(\tau_i) r_i^{\prime \prime}(\tau_i) \right) \\
=& P_i(\tau_i)^{-\alpha} r_i(\tau_i) B^\prime(\tau_i) + \alpha V(\tau_i) A(\tau_i) \left( A(\tau_i) + B(\tau_i) \right) + \alpha V(\tau_i) B(\tau_i) + \\
& \alpha V(\tau_i) A(\tau_i) I(\tau_i)^{-1} (1 - \lambda(\tau_i)) + P_i(\tau_i)^{-\alpha} \lambda(\tau_i) r_i^{\prime \prime}(\tau_i)
\end{align*}

Finally note $B^\prime(\tau_i) < - B(\tau_i)$ and 
$$
r_i(\tau_i) = B(\tau_i)^{-1} \left( r_i^\prime(\tau_i) - p x_{ij}^\star(\tau_i) \right)
$$
Then, 
\begin{align*}
P_i(\tau_i)^{-\alpha} r_i(\tau_i) B(\tau_i) =& P_i(\tau_i)^{-\alpha} r_i^\prime(\tau_i) - P_i(\tau_i)^{-\alpha} p x_{ij}^\star(\tau_i) \\
=& \alpha V_i(\tau_i) A(\tau_i) - P_i(\tau_i)^{-\alpha} A(\tau_i) \alpha I(\tau_i) \\
=& 0
\end{align*}

## Attempt $\infty$

**Lemmas**

$$
r^\prime(\tau_i) + r(\tau_i) > 0
$$
$$
B(\tau_i) + B^\prime(\tau_i) < 0
$$
$$
(\sigma - 1) A(\tau_i) + B(\tau_i) + \alpha A(x) < 0
$$
$$
\frac{1}{1 - \lambda(\tau_i)} > \frac{\lambda(\tau_i)}{1-\lambda(\tau_i)} r_i^\prime(\tau_i)
$$

*At the moment I can kill everything except the indirect effects (note that these operate on profit derivative too, but aren't shown here. Write this up and put it down for a little while.**

**Derivations**
$$
\Pi^{\prime \prime} = \left( (\sigma - 1) A(\tau_i) + B(\tau_i) \right) x_{ii}^\star(\tau_i) A(\tau_i)
$$
$$
V_i^{\prime \prime}(\tau_i) = r_i^{\prime \prime}(\tau_i) P(\tau_i)^{-\alpha} - \alpha r_i^\prime(\tau_i) P_i(\tau_i)^{-\alpha} A(\tau_i) - \alpha V_i^\prime(\tau_i) A(\tau_i) - \alpha V_i(\tau_i) A^\prime(\tau_i)
$$
(without indirect effects)
$$
r_i^{\prime \prime}(\tau_i) = B^\prime(\tau_i) P(\tau_i)^{-\alpha} r_i(\tau_i) + B(\tau_i) + \alpha V_i(\tau_i) A(\tau_i) B(\tau_i)
$$
(indirect effect from imports...kills second term in $V^{\prime \prime})
$$
\alpha A(\tau_i) r_i^\prime(\tau_i)
$$
