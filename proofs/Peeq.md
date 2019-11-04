A competitive agricultural sector guarantees that agricultural producers make zero profits. This zero profit condition implies
$$
\left( 1 - w_i \right) Y_i = 0
$$
which implies $w_i = 1$ whenever the agricultural sector is active, $Y_i > 0$. From Equation \ref{eq:prices}, this implies $p_i^\star = p_j^\star = p^\star = \frac{\sigma}{\sigma - 1}$. Suppose for now that the agricultural sector is active in both countries, implying wages are equalized across countries and sectors. Below, we verify that this is the case if Assumption `r Aalpha` is satisfied. 

Labor allocations to each sector depend on tariff levels. The labor allocation in country $i$ to sector $k \in \left\{ x, y \right\}$ can then be written $L_i^k(\bm{\tau})$. The total labor allocation to the manufacturing sector in country $i$ is
$$
L_i^x(\bm{\tau}) = x_{ii}^\star(\tau_i) + x_{ji}^\star(\tau_j)
$$
Because $x_{ii}^\star(\tau_i)$ is increasing in $\tau_i$ and $x_{ji}^\star(\tau_j)$ is decreasing in $\tau_j$ (see Lemma `r Ltauj`.), $L_i^x(\bm{\tau})$ is monotone increasing in $\tau_i$ and monotone decreasing in $\tau_j$. This implies $L_i^x(\bm{\tau})$ attains its maximum at $\left\{ \bar{\tau}, 1 \right\}$^[Here we note the dependence of the price index on the home tariff $P_i(\tau_i)$.]
\begin{align*}
L_i^x(\bar{\tau}, 1) &= p^{-\sigma} P_i(\bar{\tau})^{\sigma - 1} \alpha L + (1 p)^{-\sigma} P_j(1)^{\sigma - 1} \alpha L \\
&= \frac{p^{-\sigma} \alpha L}{p^{1 - \sigma}} + \frac{p^{-\sigma} \alpha L}{2 p^{1 - \sigma}} \\
&= \frac{\alpha L}{p} + \frac{1}{2} \frac{\alpha L}{p} \\
&= \frac{3}{2} \frac{\sigma - 1}{\sigma} \alpha L
\end{align*}
Allocation to the agricultural sector is then, by the labor market clearing condition, 
$$
L_i^y(\bar{\tau}, 1) = L - L_i^x(\bar{\tau}, 1)
$$
If $\alpha < \frac{2}{3} \frac{\sigma}{\sigma - 1}$, then $L_i^y(\bar{\tau}, 1) > 0$. Because total labor allocation to the manufacturing sector achieves its maximum at $\left\{ \bar{\tau}, 1 \right\}$, $L_i^y(\bm{\tau}) > 0$ for all $\bm{\tau} \in [1, \bar{\tau}]^2$. Moreover, $L_i^x(\bm{\tau}) > 0$ for all $\bm{\tau} \in [1, \bar{\tau}]^2$.^[This follows from the fact that $L_i^x(1, \bar{\tau}) > 0$ and the monotonicities established above.] This demonstrates the proposition. $\blacksquare$