Suppose $\tilde{\bm{\tau}}^\star(a_i) \notin \mathcal{P}$. It is straightforward to show that this produces a contradiction, namely
$$
\tilde{\bm{\tau}}^\star(a_i, c_i, \rho) \notin \argmax_{\tilde{\bm{\tau}} \in [1, \bar{\tau}^2]} \tilde{G}_i \left( \tilde{\bm{\tau}}, \omega^\star(\tilde{\bm{\tau}}; a_j, c_j, \rho); a_i, c_i, \rho \right)
$$

First, if $\tilde{\bm{\tau}}^\star \notin \mathcal{P}$, then there exists $\tilde{\bm{\tau}}^\prime \in [1, \bar{\tau}]^2$ such that either 1) $G_i(\tilde{\bm{\tau}}^\prime) > G_i(\tilde{\bm{\tau}}^\star)$ and $G_j(\tilde{\bm{\tau}}^\prime) \geq G_j(\tilde{\bm{\tau}}^\star)$ or 2) $G_j(\tilde{\bm{\tau}}^\prime) > G_j(\tilde{\bm{\tau}}^\star)$ and $G_i(\tilde{\bm{\tau}}^\prime) \geq G_i(\tilde{\bm{\tau}}^\star)$. 

Take the first case and recall
\begin{equation*}
\begin{split}
\tilde{G}_i \left( \tilde{\bm{\tau}}, \omega^\star(\tilde{\bm{\tau}}; a_j, c_j, \rho); a_i, c_i, \rho \right) = \left( 1 - F \left( W_j(a_j, a_i) - G_j( \tilde{\bm{\tau}}; a_j ) \right) \right) \left( G_i( \tilde{\bm{\tau}}; a_i ) \right) + \\
F \left( W_j(a_j, a_i) - G_j(\tilde{\bm{\tau}}; a_j) \right) \left( \hat{G}_i(a_i, a_j) \right) 
\end{split}
\end{equation*}

In the proof of Proposition `r PeqTau` (below), I show $G_i(\tilde{\bm{\tau}}^\star) > W_i(a_i, a_j) \geq \hat{G}_i(a_i, a_j)$. Also, $F(\tilde{\bm{\tau}}^\star) \leq F(\tilde{\bm{\tau}}^\prime)$. Then, if 1) or 2), then $\tilde{G}_i \left( \tilde{\bm{\tau}}^\prime, \omega^\star(\tilde{\bm{\tau}}; a_j, c_j, \rho) | a_i, c_i, \rho \right) > \tilde{G}_i \left( \tilde{\bm{\tau}}^\star, \omega^\star(\tilde{\bm{\tau}}; a_j, c_j, \rho); a_i, c_i, \rho \right)$, producing the desired contradiction. $\blacksquare$


