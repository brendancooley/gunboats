Let $q_i^y$ denote the quantity of the agricultural good produced in country $i$. A competitive agricultural sector guarantees that agricultural producers make zero profits. This zero profit condition implies
\begin{align*}
\left( p_i^y - w_i \right) q_i^y &= 0 \\
\left( 1 - w_i \right) q_i^y &= 0
\end{align*}
which implies $w_i = 1$ whenever the agricultural sector is active, $q_i^y > 0$. From Equation \ref{eq:prices}, this implies $p_i = p_j = p = \frac{\sigma}{\sigma - 1}$. Suppose for now that the agricultural sector is active in both countries, implying wages are equalized across countries and sectors. Below, we verify that this is the case if Assumption `r aAlpha` is satisfied. 

Labor allocations to each sector depend on tariff levels. The labor allocation in country $i$ to sector $k \in \left\{ x, y \right\}$ can then be written $L_i^k(\tau_i, \tau_j)$. Total allocation to the manufacturing sector can be written
$$
L_i^x(\tau_i, \tau_j) = n \left( x_{ii}^\star(\tau_i) + x_{ji}^\star(\tau_j) \right)
$$
Because $x_{ii}^\star(\tau_i)$ is increasing in $\tau_i$ and $x_{ji}^\star(\tau_j)$ is decreasing in $\tau_j$, $L_i^x(\tau_i, \tau_j)$ is increasing in $\tau_i$ and decreasing in $\tau_j$. This implies $L_i^x(\tau_i, \tau_j)$ attains its maximum at $\left\{ \bar{\tau}, 1 \right\}$
\begin{align*}
L_i^x(\bar{\tau}, 1) &= n \left( p^{-\sigma} P_i(\bar{\tau})^{\sigma - 1} \alpha L + p^{-\sigma} P_j(1)^{\sigma - 1} \alpha L \right) \\
&= n \left( \frac{p^{-\sigma} \alpha L}{n p^{1 - \sigma}} + \frac{p^{-\sigma} \alpha L}{2 n p^{1 - \sigma}} \right) \\
&= \left( \frac{\alpha L}{p} + \frac{1}{2} \frac{\alpha L}{p} \right) \\
&= \frac{3}{2} \frac{\sigma - 1}{\sigma} \alpha L
\end{align*}
Allocation to the agricultural sector is then, by the labor market clearing condition, 
$$
L_i^y(\bar{\tau}, 1) = L - L_i^x((\bar{\tau}, 1))
$$
If $\alpha < \frac{2}{3} \frac{\sigma}{\sigma - 1}$, then $L_i^y(\bar{\tau}, 1) > 0$. Because total labor allocation to the manufacturing sector achieves its maximum at $\left\{ \bar{\tau}, 1 \right\}$, $L_i^y(\tau_i, \tau_j) > 0$ for all $\left\{ \tau_i, \tau_j \right\} \in [1, \bar{\tau}]^2$. $\blacksquare$