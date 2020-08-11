p <- function(sigma) {
  return(sigma / (sigma - 1))
}

P <- function(sigma,  tau_i) {
  return( p(sigma) * (1 + tau_i^(1 - sigma))^(1 / (1 - sigma)) )
}

x <- function(p, tau, sigma, alpha, L) {
  p^(-sigma) * P(sigma, tau)^(sigma - 1) * alpha * L
}

Pi <- function(tau_i, tau_j, sigma, alpha, L) {
  return((p(sigma) - 1) * (x(p(sigma), tau_i, sigma, alpha, L) + x(p(sigma) * tau_j, tau_j, sigma, alpha, L)))
}

r <- function(tau_i, sigma, alpha, L) {
  return((tau_i - 1) * p(sigma) * x(p(sigma) * tau_i, tau_i, sigma, alpha, L) )
}

V <- function(tau_i, sigma, alpha, L) {
  return( alpha^alpha * (1-alpha)^alpha * (L + r(tau_i, sigma, alpha, L)) / P(sigma, tau_i)^alpha )
}

G <- function(tau_i, tau_j, a_i, sigma, alpha, L) {
  return(a_i * V(tau_i, sigma, alpha, L) + Pi(tau_i, tau_j, sigma, alpha, L))
}

