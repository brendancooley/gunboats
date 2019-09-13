I restrict $j$'s costs of war such that there exists some government $j$ with $a_j \in [0, \bar{a})$ that would be willing to fight if victory were certain and $i$ offered its ideal point. Formally, this requires
$$
\kappa_j = \Gamma_j(0, \bar{a})
$$
I then restrict $i$'s costs of war to ensure that it never offers $j$'s ideal point -- an interior solution exists outside of the zone of peace. Formally, this requires
$$
\kappa_i(\bar{\epsilon}, a_i) = \min_{\tilde{\bm{\tau}} \in \mathcal{P}} - \bar{\epsilon} \left( 1 - F \left( W_j(0, a_i) - G_j(\cdot, \tilde{\tau}_i; a_j) \right) \right) \frac{ \frac{\partial G_i(\tau_i, \cdot; a_i)}{\partial \tau_i} }{ \frac{\partial G_j(\cdot, \tau_i; a_i)}{\partial \tau_i} }
$$
Because $\frac{\partial G_j(\cdot, \tau_i; a_i)}{\partial \tau_i} < 0$, this quantity is guaranteed to be positive.