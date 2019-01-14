p <- function(sigma) {
  return(sigma / (sigma - 1))
}

P <- function(sigma, n, tau_i) {
  return( p(sigma) * n^(1/(1-sigma)) * (1 + tau_i^(1 - sigma))^(1 / (1 - sigma)) )
}

x <- function(p, tau, sigma, n, alpha, L) {
  p^(-sigma) * P(sigma, n, tau)^(sigma - 1) * alpha * L
}

Pi <- function(tau_i, tau_j, sigma, n, alpha, L) {
  return(n * (p(sigma) - 1) * (x(p(sigma), tau_i, sigma, n, alpha, L) + x(p(sigma) * tau_j, tau_j, sigma, n, alpha, L)))
}

r <- function(tau_i, sigma, n, alpha, L) {
  return(n * (tau_i - 1) * p(sigma) * x(p(sigma) * tau_i, tau_i, sigma, n, alpha, L) )
}

V <- function(tau_i, sigma, n, alpha, L) {
  return( (alpha * L) / P(sigma, n, tau_i) )
}

G <- function(tau_i, tau_j, a_i, sigma, n, alpha, L) {
  return(a_i * V(tau_i, sigma, n, alpha, L) + Pi(tau_i, tau_j, sigma, n, alpha, L) + r(tau_i, sigma, n, alpha, L))
}

