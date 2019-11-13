source("source.R")
source("params.R")

library(tidyverse)

a_i <- 1
a_j <- 1
a_i2 <- 2
a_j2 <- 2
sigma <- 4
alpha <- .5
L <- 1
cj_diff <- .1
rho <- .5
c_i <- .01

tau_i_vec <- seq(1, 3, .05)
G(tau_i_vec, 1, a_i, sigma, alpha, L)
  
tau_i_star <- optim(par=1, fn=G, tau_j=1, a=a_i, sigma=sigma, alpha=alpha, L=L,  lower=1, upper=10, method="Brent", 
                    control=list(fnscale=-1))$par
tau_j_star <- optim(par=1, fn=G, tau_j=1, a=a_j, sigma=sigma, alpha=alpha, L=L,  lower=1, upper=10, method="Brent", 
                    control=list(fnscale=-1))$par

Gbar_i1 <- G(tau_i_star, 1, a_i, sigma, alpha, L)
Gbar_j1 <- G(tau_j_star, 1, a_j, sigma, alpha, L)
Gubar_i1 <- G(1, tau_j_star, a_i, sigma, alpha, L)
Gubar_j1 <- G(1, tau_i_star, a_j, sigma, alpha, L)

Gbar_i2 <- G(tau_i_star, 1, a_i2, sigma, alpha, L)
Gbar_j2 <- G(tau_j_star, 1, a_j2, sigma, alpha, L)
Gubar_i2 <- G(1, tau_j_star, a_i2, sigma, alpha, L)
Gubar_j2 <- G(1, tau_i_star, a_j2, sigma, alpha, L)

Gtilde <- function(tau_i, tau_j, Gbar_i, Gbar_j, Gubar_i, Gubar_j, rho, cj_diff, c_i, a_i, a_j) {
  A <- (1 - ((1-rho)*Gbar_j + rho*Gubar_j - G(tau_j, tau_i, a_j, sigma, alpha, L)) / cj_diff) * G(tau_i, tau_j, a_i, sigma, alpha, L)
  B <- (((1-rho)*Gbar_j + rho*Gubar_j - G(tau_j, tau_i, a_j, sigma, alpha, L)) / cj_diff) * (rho*Gbar_i + (1-rho)*Gubar_i - c_i)
  return(A + B)
}

gtilde1 <- Gtilde(tau_i_vec, 1, Gbar_i1, Gbar_j1, Gubar_i1, Gubar_j1, rho, cj_diff, c_i, a_i, a_j)
gtilde2 <- Gtilde(tau_i_vec, 1, Gbar_i2, Gbar_j2, Gubar_i2, Gubar_j2, rho, cj_diff, c_i, a_i2, a_j2)

data <- data.frame(tau_i_vec, gtilde1, gtilde2)

optim(par=1, fn=Gtilde, tau_j=1, Gbar_i=Gbar_i1, Gbar_j=Gbar_j1, Gubar_i=Gubar_i1, Gubar_j=Gubar_j1, 
      rho=rho, cj_diff=cj_diff, c_i=c_i, a_i=a_i, a_j=a_j,  lower=1, upper=10, method="Brent", 
      control=list(fnscale=-1))$par

optim(par=1, fn=Gtilde, tau_j=1, Gbar_i=Gbar_i2, Gbar_j=Gbar_j2, Gubar_i=Gubar_i2, Gubar_j=Gubar_j2, 
      rho=rho, cj_diff=cj_diff, c_i=c_i, a_i=a_i2, a_j=a_j2,  lower=1, upper=10, method="Brent", 
      control=list(fnscale=-1))$par

ggplot(data=data, aes(x=tau_i_vec, y=gtilde1)) +
  geom_line() +
  geom_line(aes(x=tau_i_vec, y=gtilde2)) +
  theme_classic()
