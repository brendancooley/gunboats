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
&= r_i^{\prime \prime}(\tau_i) P(\tau_i)^{-\alpha} - \alpha A(\tau_i) V_i(\tau_i) \underbrace{\left( \alpha A(\tau_i) + B(\tau_i) \right)}_{<0}
\end{align*}
Moreover since $r_i^{\prime}(\tau_i) > 0$ then $r_i^{\prime \prime}(\tau_i) < 0$.