First order condition of the pareto problem gives
$$
\lambda \frac{\partial G_i}{\partial \tau_i} + (1 - \lambda) \frac{\partial G_j}{\partial \tau_i} = f(\tau_i, \lambda) = 0
$$
and analagously for $\tau_j$. IFT implies there exists a function $\tau_i(\lambda)$ with
$$
\tau_i^\prime(\lambda) = \frac{ \frac{\partial f(\tau_i, \lambda)}{\partial \lambda} }{ \frac{\partial f(\tau_i, \lambda)}{\partial \tau_i} } = - \frac{\frac{\partial G_i}{\partial \tau_i} - \frac{\partial G_j}{\partial \tau_i}}{\lambda \frac{\partial^2 G_i}{\partial \tau_i^2} + (1 - \lambda) \frac{\partial^2 G_j}{\partial \tau_j^2} }
$$
and
$$
\tau_j^\prime(\lambda) = \frac{ \frac{\partial f(\tau_j, \lambda)}{\partial \lambda} }{ \frac{\partial f(\tau_j, \lambda)}{\partial \tau_j} } = - \frac{\frac{\partial G_i}{\partial \tau_j} - \frac{\partial G_j}{\partial \tau_j}}{\lambda \frac{\partial^2 G_i}{\partial \tau_j^2} + (1 - \lambda) \frac{\partial^2 G_j}{\partial \tau_j^2} }
$$

The numerators are positive and negative respectively. The denominators are not unambiguosly signed. Concavity of the objective requires
$$
\lambda \frac{\partial^2 G_i}{\partial \tau_i^2} + (1 - \lambda) \frac{\partial^2 G_j}{\partial \tau_j^2} + \lambda \frac{\partial^2 G_i}{\partial \tau_j^2} + (1 - \lambda) \frac{\partial^2 G_j}{\partial \tau_j^2} < 0
$$
So $\lambda \frac{\partial^2 G_i}{\partial \tau_i^2} + (1 - \lambda) \frac{\partial^2 G_j}{\partial \tau_j^2} > 0 \implies \lambda \frac{\partial^2 G_i}{\partial \tau_j^2} + (1 - \lambda) \frac{\partial^2 G_j}{\partial \tau_j^2} < 0$. This yields three possibilities. If both denominators are negative, then $\tau_i(\lambda) > 0$ and $\tau_j(\lambda) < 0$ (as desired). If the top denominator is positive then $\tau_i(\lambda) < 0$ and $\tau_j(\lambda) < 0$. If the bottom denominator is positive then $\tau_i(\lambda) > 0$ and $\tau_j(\lambda) > 0$.

**Conjecture:** Either denominator positive implies corner solution $\tau_i^\star = 1$ or $\tau_j^\star = 1$.