It is sufficient to show that 
$$
\frac{\partial G_i(\tau_j)}{\partial \tau_{j}} < 0
$$
Note that 
$$
\frac{\partial G_i(\tau_j)}{\partial \tau_{j}} = \frac{\partial \Pi_i(\tau_i, \tau_j)}{\partial \tau_j} = (p^\star - 1) x_{ji}^{\star \prime}(\tau_j)
$$.
The derivative of home exports with respect to the foreign tariff is
\begin{align*}
x_{ji}^{\star \prime}(\tau_j) &= B(\tau_j) x_{ji}^\star(\tau_j) + \frac{x_{ji}^\star(\tau_j)}{I(\tau_j)} r_j^\prime(\tau_j) \\
&= B(\tau_j) x_{ji}^\star(\tau_j) + \frac{x_{ji}^\star(\tau_j)}{I(\tau_j)} \left( (\tau_j - 1) p^\star x_{ji}^{\star \prime}(\tau_j) + p^\star x_{ji}^\star(\tau_j) \right) \\
&= B(\tau_j) x_{ji}^\star(\tau_j) + \frac{x_{ji}^\star(\tau_j)}{I(\tau_j)} \left( \frac{r_j(\tau_j)}{x_{ji}^\star(\tau_j)} x_{ji}^{\star \prime}(\tau_j) + p^\star x_{ji}^\star(\tau_j) \right) \\
&= B(\tau_j) x_{ji}^\star(\tau_j) + \lambda(\tau_j) x_{ji}^{\star \prime}(\tau_j) + p^\star x_{ji}^\star(\tau_j) + \frac{x_{ji}^\star(\tau_j)}{I(\tau_j)} \\
(1 - \lambda(\tau_j)) x_{ji}^{\star \prime}(\tau_j)&= x_{ji}^\star(\tau_j) \left( B(\tau_j) + p^\star x_{ji}^\star(\tau_j) I(\tau_j)^{-1} \right) \\
&= x_{ji}^\star(\tau_j) \left( B(\tau_j) + \alpha A(\tau_j) \right) \\
&< x_{ji}^\star(\tau_j) \left( B(\tau_j) + A(\tau_j) \right) \\
&= \sigma \tau^{-1} \underbrace{\left( \left( 1 + \tau_j^{1-\sigma} \right)^{-1} \tau_j^{-\sigma - 1} - 1 \right)}_{<0}
\end{align*}
$\blacksquare$