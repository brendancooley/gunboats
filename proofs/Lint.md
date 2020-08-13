The first order condition is
\begin{equation} \label{eq:Gfoc}
0 = - \alpha a_i V_i(\tau_i) A(\tau_i) + a_i r_i^\prime(\tau_i) P_i(\tau_i)^{-\alpha} + \Pi_i^\prime(\tau_i) .
\end{equation}

By construction, 
$$
\lim_{\tau_i \rightarrow \infty} \frac{\partial G_i}{\partial \tau_i} < 0
$$
for all $a_i > \ubar{a}$. Additionally,
$$
\evalat[\Big]{ \frac{\partial G_i}{\partial \tau_i} }{\tau_i=1} = \evalat[\Big]{ \frac{\partial \Pi(\tau_i)}{\partial \tau_i} }{\tau_i=1} > 0 .
$$
This precludes $\tau_i \in \left\{ 1, \bar{\tau} \right\}$ from being optimal. From each corner point, the directional derivative toward the interior of the policy space is positive. $\blacksquare$
