For $G_i(\tau_i)$ to be quasiconcave on $[1, \bar{\tau}]$, its first derivative must have a single root with 
$$
\frac{\partial G_i(\tau_i, \tau_j)}{\partial \tau_i}(1) > 0
$$
and
$$
\lim_{\tau_i \rightarrow \infty} \frac{\partial G_i(\tau_i, \tau_j)}{\partial \tau_i} < 0
$$

Simplifying the derivative of the objective function gives
\begin{equation*}
\begin{split}
\frac{\partial G_i}{\partial \tau_i} =& - a k(\alpha) P_i(\tau_i)^{-\alpha} p^{\sigma - 1} + a k(\alpha) P_i(\tau_i)^{-\alpha} \left( 1 + (\tau_i - 1) \left( (\sigma - 1) \chi(\tau_i) \tau_i^{-\sigma} - \sigma \tau_i^{-1} \right) \right) + \\
& (\sigma - 1) \chi_i(\tau_i)
\end{split}
\end{equation*}

It is straightforward to verify that for all $a_i > \ubar{a}$,
$$
\evalat[\Big]{ \frac{\partial G_i}{\partial \tau_i} }{\tau_i=1} > 0
$$
and
$$
\lim_{\tau_i \rightarrow \infty} \frac{\partial G_i}{\partial \tau_i} < 0
$$

Since $\frac{\partial G_i(\tau_i, \tau_j)}{\partial \tau_i}$ is a continuous function, it must therefore have at least one root, by the intermediate value theorem. To see that this root is unique, note that the first order condition can be rearranged as 
$$
\underbrace{\left( p^{1-\sigma} + \sigma - 1 \right)}_{\psi(\tau_i)} = \underbrace{ (\sigma - 1) \left( \tau_i^{1-\sigma} - \tau_i^{\sigma} \right) + \sigma \tau_i^{-1} \chi(\tau_i) + (\sigma - 1) \left( a_i k(\alpha) \right)^{-1} \chi(\tau_i) P(\tau_i)^\alpha }_{\phi(\tau_i)}
$$
where $\psi(\tau_i)$ is monotonically increasing and $\phi(\tau_i)$ is monotonically decreasing for all $a_i > \ubar{a}$. $\blacksquare$
