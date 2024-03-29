**Government Utility**

$$
\frac{\partial G_i(\tau_i, \tau_j)}{\partial \tau_i} = a_i \frac{\partial V_i}{\partial \tau_i} + \frac{\partial \Pi_i}{\partial \tau_i}
$$

**Price Index**

\begin{align*}
\frac{\partial P_i}{\partial \tau_i} &= p \left( 1 + \tau_i^{1 - \sigma} \right)^{\frac{\sigma}{1 - \sigma}} \tau_i^{-\sigma} \\
&= P_i(\tau_i) \left( 1 + \tau_i^{1 - \sigma} \right)^{-1} \tau_i^{-\sigma} \\
&= P_i(\tau_i) \chi(\tau_i) \tau_i^{-\sigma}
\end{align*}
with
$$
\chi(\tau_i) = \left( 1 + \tau_i^{1 - \sigma} \right)^{-1}
$$

**Consumer Indirect Utility**

\begin{align*}
\frac{\partial V_i}{\partial \tau_i} &= k(\alpha) (-\alpha) P_i(\tau_i)^{-\alpha - 1} \frac{\partial P_i}{\partial \tau_i} \left( L + r_i(\tau_i) \right) + k(\alpha) P_i(\tau_i)^{-\alpha} \frac{\partial r_i}{\partial \tau_i} \\
&= k(\alpha) (-\alpha) P_i(\tau_i)^{-\alpha} \chi(\tau_i) \tau_i^{-\sigma} \left( L + r_i(\tau_i) \right) + k(\alpha) P_i(\tau_i)^{-\alpha} \frac{\partial r_i}{\partial \tau_i} \\
&= - k(\alpha) P_i(\tau_i)^{\sigma - 1} P_i(\tau_i)^{1 - \sigma - \alpha} p^{\sigma} p^{-\sigma} \tau_i^{-\sigma} \chi(\tau_i) \alpha I_i + k(\alpha) P_i(\tau_i)^{-\alpha} \frac{\partial r_i}{\partial \tau_i} \\
&= - k(\alpha) P_i(\tau_i)^{1 - \sigma - \alpha} \chi(\tau_i) p^{\sigma} \tau_i^{-\sigma} x_{ii}^\star(\tau_i) + k(\alpha) P_i(\tau_i)^{-\alpha} \frac{\partial r_i}{\partial \tau_i} \\
&= k(\alpha) P_i(\tau_i)^{-\alpha} p^{\sigma} \tau_i^{-\sigma} x_{ii}^\star(\tau_i) + k(\alpha) P_i(\tau_i)^{-\alpha} \frac{\partial r_i}{\partial \tau_i}
\end{align*}
where
$$
k(\alpha) = \alpha^\alpha (1 - \alpha)^{1 - \alpha}
$$

**Demand**

\begin{align*}
\frac{\partial x_{ii}^\star}{\partial \tau_i} &= p^{-\sigma} (\sigma - 1) P_i(\tau_i)^{\sigma - 2} \frac{\partial P_i}{\partial \tau_i} \alpha I_i \\
&= (\sigma - 1) x_{ii}^\star(\tau_i) \chi(\tau_i) \tau_i^{-\sigma}
\end{align*}

Noting $x_{ij}^\star = \tau_i^{-\sigma} x_{ii}^\star(\tau_i)$,
$$
\frac{\partial x_{ij}^\star}{\partial \tau_i} = - \sigma \tau_i^{-\sigma - 1} x_{ii}^\star(\tau_i) + \tau_i^{-\sigma} \frac{\partial x_{ii}^\star}{\partial \tau_i}
$$

**Firm Profits**

$$
\frac{\partial \Pi_i}{\partial \tau_i} = p \frac{\partial x_{ii}^\star}{\partial \tau_i}
$$

**Tariff Revenue**

\begin{align*}
\frac{\partial r_i}{\partial \tau_i} &= p x_{ij}^\star(\tau_i) + p (\tau_i - 1) \frac{\partial x_{ij}^\star}{\partial \tau_i} \\
&= p \tau_i^{-\sigma} x_{ii}^\star(\tau_i) + p (\tau_i - 1) \left( -\sigma \tau_i^{-\sigma - 1} x_{ii}^\star(\tau_i) + \tau_i^{-\sigma} (\sigma - 1) x_{ii}^\star \chi(\tau_i) \tau_i^{-\sigma} \right) \\
&= x_{ii}^\star(\tau_i) \tau_i^{-\sigma} p \left( 1 + ( \tau_i - 1 ) \left( (\sigma - 1) \chi(\tau_i) \tau_i^{-\sigma} - \sigma \tau_i^{-1} \right) \right)
\end{align*}
