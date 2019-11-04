To establish that $\Gamma_i(a_i, a_j)$ is decreasing in $a_i$, note that derivative of $\Gamma_i(a_i, a_j)$ taken with respect to $a_i$ is
\begin{align*}
\frac{\partial \Gamma_i(a_i, a_j)}{\partial a_i} &= \left. \frac{\partial G_i(\tau_i^\star(a_i), 1; a_i)}{\partial a_i} \right|_{\left\{ \tau_i^\star(a_i), 1 \right\}} + \underbrace{\frac{\partial G_i(\tau_i^\star(a_i), 1; a_i)}{\partial \tau_i^\star(a_i)}}_{=0} \frac{\partial \tau_i^\star(a_i)}{\partial a_i} - \left. \frac{\partial G_i(1, \tau_j^\star(a_j); a_i)}{\partial a_i} \right|_{\left\{ 1, \tau_j^\star(a_j) \right\}} \\
&= \underbrace{V_i^x(P_i(\tau_i^\star(a_i))) - V_i^x(P_i(1))}_{<0}
\end{align*}
where the final inequality holds because $\tau_i^\star(a_i) > 1$ for all $a_i < \bar{a}$. To see that $\Gamma_i(a_i, a_j)$ is decreasing in $a_j$, note
\begin{align*}
\frac{\partial \Gamma_i(a_i, a_j)}{\partial a_j} &= - \underbrace{\frac{\partial G_i(1, \tau_j^\star(a_j); a_i)}{\partial \tau_j^\star(a_j)}}_{<0} \underbrace{\frac{\partial \tau_j^\star(a_j)}{\partial a_j}}_{<0}
\end{align*}
where the inequalities follow from Lemma `r Ltauj` and Lemma `r Ltaui`. $\blacksquare$