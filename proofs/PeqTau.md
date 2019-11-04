By Assumption `r AwCosts`, $i$'s first order condition must characterize $\tilde{\tau}_i^\star$ when $a_j < a_j(\ubar{c}_j, a_i)$. Here, we have
$$
\frac{\partial \tilde{G}_i(\tilde{\tau}_i)}{\partial \tilde{\tau}_i} = \left( 1 - F \left( W_j(a_j, a_i) - G_j(\cdot, \tilde{\tau}_i | a_j) \right) \right) \frac{\partial G_i(\tilde{\tau}_i)}{\partial \tau_i} + \frac{1}{\bar{c}_j} \frac{\partial G_j(\tilde{\tau}_i)}{\partial \tilde{\tau}_i} \left( G_i(\tilde{\tau}_i) - \hat{G}_i(a_i, a_j) \right) = 0
$$
Rearranging,
\begin{align*}
\left( 1 - F \left( W_j(a_j, a_i) - G_j(\cdot, \tilde{\tau}_i; a_j) \right) \right) \frac{\partial G_i(\tilde{\tau}_i)}{\partial \tau_i} &= \frac{1}{\bar{c}_j} \frac{\partial G_j(\tilde{\tau}_i)}{\partial \tilde{\tau}_i} \left( \hat{G}_i(a_i, a_j) - G_i(\tilde{\tau}_i) \right) \\
\left( 1 - F \left( W_j(a_j, a_i) - G_j(\cdot, \tilde{\tau}_i; a_j) \right) \right) \frac{\partial G_i(\tilde{\tau}_i)}{\partial \tau_i} &= \frac{1}{\bar{c}_j} \frac{\partial G_j(\tilde{\tau}_i)}{\partial \tilde{\tau}_i} \left( W_i(a_i, a_j) - c_i - G_i(\tilde{\tau}_i) \right) \\
\left( 1 - F \left( W_j(a_j, a_i) - G_j(\cdot, \tilde{\tau}_i; a_j) \right) \right) \frac{\partial G_i(\tilde{\tau}_i)}{\partial \tau_i} &= \frac{1}{\bar{c}_j} \frac{\partial G_j(\tilde{\tau}_i)}{\partial \tilde{\tau}_i} \left( W_i(a_i, a_j) - c_i - G_i(\tilde{\tau}_i) \right) \\
\bar{c}_j \left( 1 - F \left( W_j(0, a_i) - G_j(\cdot, \tilde{\tau}_i; a_j) \right) \right) \frac{ \frac{\partial G_i(\tau_i, \cdot; a_i)}{\partial \tau_i} }{ \frac{\partial G_j(\cdot, \tau_i; a_i)}{\partial \tau_i} } + c_i &= W_i(a_i, a_j) - G_i(\tilde{\tau}_i)
\end{align*}
By Assumption `r AwCosts`, the LHS of this expression must be negative, this ensures that $i$'s payoff at the solution is higher than its war value, 
$$
W_i(a_i, a_j) < G_i(\tilde{\tau}_i)
$$
Now note that 
$$
\frac{\partial W_j}{\partial \rho} = \underline{G}_j - \bar{G}_j < 0
$$
and
$$
\frac{\partial \hat{G}_i}{\partial \rho} = \Gamma_i > 0
$$
We have
$$
\frac{\partial^2 \tilde{G}_i(\tilde{\tau}_i)}{\partial \tilde{\tau}_i \partial \rho} = - \frac{1}{\bar{c}_j} \underbrace{\frac{\partial G_i(\tilde{\tau}_i)}{\partial \tilde{\tau}_i}}_{>0} \underbrace{\frac{\partial W_j}{\partial \rho}}_{<0} - \frac{1}{\bar{c}_j} \underbrace{\frac{\partial G_j(\tilde{\tau}_i)}{\partial \tilde{\tau}_i}}_{<0} \underbrace{\frac{\partial \hat{G}_i}{\partial \rho}}_{>0} > 0
$$
which implies
$$
\frac{\partial \tilde{\tau}_i^\star(a_i)}{\partial \rho} > 0
$$
as desired. $\blacksquare$