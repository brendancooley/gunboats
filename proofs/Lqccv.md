For $G_i(\tau_i)$ to be quasiconcave on $[1, \bar{\tau}]$, its first derivative must have a single root with 
$$
\frac{\partial G_i(\tau_i, \tau_j)}{\partial \tau_i}(1) > 0
$$
and
$$
\lim_{\tau_i \rightarrow \infty} \frac{\partial G_i(\tau_i, \tau_j)}{\partial \tau_i} < 0
$$

I first collect the relevant partial derivatives before proceeding with the proof.

**Government Utility**

$$
\frac{\partial G_i(\tau_i, \tau_j)}{\partial \tau_i} = a_i \frac{\partial V_i}{\partial \tau_i} + \frac{\partial \Pi_i}{\partial \tau_i}
$$

**Consumer Indirect Utility**

$$
\frac{\partial V_i}{\partial \tau_i} = k(\alpha) \alpha P_i(\tau_i)^{\alpha - 1}
$$




Note that given symmetry across countries, price indices can be written 
$$
P_i(\tau_i) = \left( n p^{1 - \sigma} + n (\tau_i p)^{1 - \sigma} \right)^{\frac{1}{1 - \sigma}} = p n^{\frac{1}{1 - \sigma}} \left( 1 + \tau_i^{1 - \sigma} \right)^{\frac{1}{1 - \sigma}}
$$
$G_i(\tau_i, \tau_j)$ can be simplified as follows
\begin{align*}
G_i(\tau_i, \tau_j) &= a_i V_i^x(\tau_i) + \Pi_i(\tau_i, \tau_j) + r(\tau_i) \\
&= a_i \frac{\alpha L}{P_i(\tau_i)} + n (p - 1) \left( x_{ii}^\star(p) + x_{ji}^\star(\tau_j p) \right) + n p (\tau_i - 1) x_{ij}^\star(\tau_i p) \\
&= \alpha L \left[ \frac{a_i}{P_i(\tau_i)} + n p^{1 - \sigma} P_i(\tau_i)^{\sigma - 1} - n p^{-\sigma} P_i(\tau_i)^{\sigma - 1} + n p^{1 - \sigma} P_j(\tau_j)^{\sigma - 1} - n p^{-\sigma} P_j(\tau_j)^{\sigma - 1} + \right. \\
& \bigl. n (\tau_i p)^{1 - \sigma} P_i(\tau_i)^{\sigma - 1} - n \tau_i^{-\sigma} p^{1 - \sigma} P_i(\tau_i)^{\sigma - 1} \biggr] \\
&= \alpha L \left[ \frac{a_i}{P_i(\tau_i)} + n ( p^{1 - \sigma} - p^{-\sigma} ) P_j(\tau_j)^{\sigma - 1} + n ( p^{1 - \sigma} - p^{- \sigma} ) P_i(\tau_i)^{\sigma - 1} \left( 1 + \tau_i^{1 - \sigma} - \tau_i^{-\sigma} \right) \right] \\
&= \alpha L \left[ a_i n^{\frac{1}{\sigma - 1}} p^{-1} \left( 1 + \tau_i^{1 - \sigma} \right)^{\frac{1}{\sigma - 1}} + ( 1 - p^{-1} ) \left( 1 + \tau_j^{1 - \sigma} \right)^{-1} + \right. \\
& \bigl. \left( 1 + \tau_i^{1 - \sigma} \right)^{-1} \left( 1 - p^{-1} + \tau_i^{1 - \sigma}  - \tau_i^{-\sigma} \right) \biggr] \\
&= \alpha L \left[ a_i n^{\frac{1}{\sigma - 1}} p^{-1} \left( 1 + \tau_i^{1 - \sigma} \right)^{\frac{1}{\sigma - 1}} + ( 1 - p^{-1} ) \left( 1 + \tau_j^{1 - \sigma} \right)^{-1} + 1 - ( \tau_i^{-\sigma} + p^{-1} ) \left( 1 + \tau_i^{1 - \sigma} \right)^{-1} \right]
\end{align*}

The first derivative is then
\begin{equation*}
\begin{split}
\frac{\partial G_i(\tau_i, \tau_j)}{\partial \tau_i} = \alpha L \left[ - a_i p^{-1} n^{\frac{1}{\sigma - 1}} \left( 1 + \tau_i^{1 - \sigma} \right)^{\frac{1}{\sigma - 1} - 1} \tau_i^{-\sigma} + \sigma \tau_i^{-\sigma - 1} \left( 1 + \tau_i^{1 - \sigma} \right)^{-1} + \right. \\
\left. \left( 1 + \tau_i^{1 - \sigma} \right)^{-2} \tau_i^{-\sigma} (1 - \sigma) ( \tau_i^{-\sigma} + p^{-1} ) \right]
\end{split}
\end{equation*}

At any root, we must have
\begin{align*}
0 &= \frac{\partial G_i(\tau_i, \tau_j)}{\partial \tau_i}  \\
&= \alpha L \left[ - a_i p^{-1} n^{\frac{1}{\sigma - 1}} \left( 1 + \tau_i^{1 - \sigma} \right)^{\frac{1}{\sigma - 1} - 1} \tau_i^{-\sigma} + \sigma \tau_i^{-\sigma - 1} \left( 1 + \tau_i^{1 - \sigma} \right)^{-1} + \right. \\
& \bigl. \left( 1 + \tau_i^{1 - \sigma} \right)^{-2} \tau_i^{-\sigma} (1 - \sigma) ( \tau_i^{-\sigma} + p^{-1} ) \biggr] \\
&= \alpha L \left[ - a_i p^{-1} n^{\frac{1}{\sigma - 1}} \left( 1 + \tau_i^{1 - \sigma} \right)^{\frac{1}{\sigma - 1}} + \sigma \tau_i^{- 1} + \left( 1 + \tau_i^{1 - \sigma} \right)^{-1} (1 - \sigma) ( \tau_i^{-\sigma} + p^{-1} ) \right]
\end{align*}

From this condition it is straightforward to verify that if $a_i < \bar{a}$, then as $\tau_i \rightarrow 1$,
$$
\frac{\partial G_i(\tau_i, \tau_j)}{\partial \tau_i} \rightarrow - a_i p^{-1} (2n)^{\frac{1}{\sigma - 1}} + \sigma + \frac{1}{2} (1 - \sigma) (1 + p^{-1}) > 0
$$
As $\tau_i \rightarrow \infty$, 
$$
\frac{\partial G_i(\tau_i, \tau_j)}{\partial \tau_i} \rightarrow - a_i n^{\frac{1}{\sigma - 1}} p^{-1} + (1 - \sigma) p^{-1} < 0
$$
Since $\frac{\partial G_i(\tau_i, \tau_j)}{\partial \tau_i}$ is a continuous function, it must therefore have at least one root, by the intermediate value theorem. To see that this root is unique, note that the first order condition can be rearranged as follows
$$
\underbrace{a_i n^{\frac{1}{\sigma - 1}} p^{-1} \tau_i}_{\phi(\tau_i; a_i)} = \underbrace{\left( \sigma + \tau_i^{1 - \sigma} + \tau_i p^{-1} ( 1 - \sigma) \right) \left( 1 + \tau_i^{1-\sigma} \right)^{\frac{\sigma}{1 - \sigma}}}_{\psi(\tau_i)}
$$
Note that $\phi(1; a_i) < \psi(1)$ for all $a_i < \bar{a}$. Additionally, $\phi(\tau_i; a_i)$ is a linear function and $\psi(\tau_i)$ is a concave function with
$$
\lim_{\tau_i \rightarrow \infty} \psi(\tau_i) = \sigma
$$
Together these facts imply that the intersection $\frac{\partial G_i(\tau_i, \tau_j)}{\partial \tau_i} = 0$ is unique. $\blacksquare$