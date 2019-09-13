library(tidyverse)

path <- getwd() %>% strsplit("/")
lastPath <- path[[1]][length(path[[1]])]

if (lastPath == "figs") {
  source("source.R")
  source("params.R")
}

aj <- ai <- 0
rho <- .5

tauStari <- optim(par=1, fn=G, tau_j=1, a=a1, sigma=sigma, n=n, alpha=alpha, L=L, method="Brent", lower=1, upper=100, control=list(fnscale=-1))$par
tauStarj <- optim(par=1, fn=G, tau_j=1, a=a2, sigma=sigma, n=n, alpha=alpha, L=L, method="Brent", lower=1, upper=100, control=list(fnscale=-1))$par

cbar <- G(tauStarj, tauStari, aj, sigma, n, alpha, L) / 4

prWar <- function(tauj, taui, tauStarj, tauStari, a_j, sigma, n, alpha, L, cbar, rho) {
  return((1/cbar)*(((1-rho)*G(tauStarj, 1, a_j, sigma, n, alpha, L) + rho * G(1, tauStari, a_j, sigma, n, alpha, L)) - G(tauj, taui, a_j, sigma, n, alpha, L)))
}

pareto <- function(taus, a1, a2, sigma, n, alpha, L, lambda) {
  return(-1*(lambda * G(taus[1], taus[2], a1, sigma, n, alpha, L) + (1 - lambda) * G(taus[2], taus[1], a2, sigma, n, alpha, L)))
}

pFrontier1 <- c()
pFrontier2 <- c()

lambdaV <- seq(0, 1, .01)

for (i in lambdaV) {
  O <- optim(par=c(1,1), fn=pareto, a1=a1, a2=a2, sigma=sigma, n=n, alpha=alpha, L=L, lambda=i, lower=c(1,1), method="L-BFGS-B")
  pFrontier1 <- c(pFrontier1, O$par[1])
  pFrontier2 <- c(pFrontier2, O$par[2])
}

prWar(pFrontier2[length(pFrontier2) / 2], pFrontier1[length(pFrontier1) / 2], tauStarj, tauStari, aj, sigma, n, alpha, L, cbar, rho)
prWar(pFrontier2[length(pFrontier2)], pFrontier1[length(pFrontier1)], tauStarj, tauStari, aj, sigma, n, alpha, L, cbar, rho)
prWar(pFrontier2[1], pFrontier1[1], tauStarj, tauStari, aj, sigma, n, alpha, L, cbar, rho)
prWar(pFrontier2, pFrontier1, tauStarj, tauStari, aj, sigma, n, alpha, L, cbar, rho)


objective <- function(tauj, taui, tauStarj, tauStari, aj, sigma, n, alpha, L, cbar, rho, ci, ai) {
  o <- prWar(tauj, taui, tauStarj, tauStari, aj, sigma, n, alpha, L, cbar, rho) * (rho*G(tauStari, 1, ai, sigma, n, alpha, L) + (1 - rho)*G(1, tauStarj, ai, sigma, n, alpha, L) - ci) +
    (1 - prWar(tauj, taui, tauStarj, tauStari, aj, sigma, n, alpha, L, cbar, rho)) * G(taui, tauj, ai, sigma, n, alpha, L)
  return(o)
}

ci <- cbar / 5

prWar(pFrontier2, pFrontier1, tauStarj, tauStari, aj, sigma, n, alpha, L, cbar, rho) * (rho*G(tauStari, 1, ai, sigma, n, alpha, L) + (1 - rho)*G(1, tauStarj, ai, sigma, n, alpha, L) - ci)
(1 - prWar(pFrontier2, pFrontier1, tauStarj, tauStari, aj, sigma, n, alpha, L, cbar, rho)) * G(pFrontier1, pFrontier2, ai, sigma, n, alpha, L)


G(pFrontier1, pFrontier2, ai, sigma, n, alpha, L)

prWar(pFrontier2, pFrontier1, tauStarj, tauStari, aj, sigma, n, alpha, L, cbar, .5)

obj1 <- objective(pFrontier2, pFrontier1, tauStarj, tauStari, aj, sigma, n, alpha, L, cbar, rho, ci, ai)
obj2 <- objective(pFrontier2, pFrontier1, tauStarj, tauStari, aj, sigma, n, alpha, L, cbar, rho, ci,  a_bar)

which.max(obj1)
which.max(obj2)

data <- data.frame(lambdaV, obj1, obj2)

ggplot(data, aes(x=lambdaV, y=obj1)) +
  geom_line() +
  geom_line(aes(y=obj2)) +
  theme_classic()
