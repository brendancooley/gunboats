library(tidyverse)
library(latex2exp)

path <- getwd() %>% strsplit("/")
lastPath <- path[[1]][length(path[[1]])]

if (lastPath == "figs") {
  source("source.R")
  source("params.R")
}

a1 <- a2 <- 0

tauStar1 <- optim(par=1, fn=G, tau_j=1, a=a1, sigma=sigma, n=n, alpha=alpha, L=L, method="Brent", lower=1, upper=100, control=list(fnscale=-1))$par
tauStar2 <- optim(par=1, fn=G, tau_j=1, a=a2, sigma=sigma, n=n, alpha=alpha, L=L, method="Brent", lower=1, upper=100, control=list(fnscale=-1))$par

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


# indifference curves from trade war
iso <- function(tau_i, tau_j, a, sigma, n, alpha, L, tauStar_i, tauStar_j) {
  return(abs(G(tau_i, tau_j, a, sigma, n, alpha, L) - G(tauStar_i, tauStar_j, a, sigma, n, alpha, L)))
}

G(tauStar1, tauStar2, a1, sigma, n, alpha, L)

iso1 <- c()
iso2 <- c()

for (i in pFrontier2) {
  O <- optim(par=1, fn=iso, tau_j=i, a=a1, sigma=sigma, n=n, alpha=alpha, L=L, tauStar_i=tauStar1, tauStar_j=tauStar2, lower=1, upper=tauStar1, method="Brent")
  iso1 <- c(iso1, O$par)
}

for (i in pFrontier1) {
  O <- optim(par=1, fn=iso, tau_j=i, a=a2, sigma=sigma, n=n, alpha=alpha, L=L, tauStar_i=tauStar2, tauStar_j=tauStar1, lower=1, upper=tauStar2, method="Brent")
  iso2 <- c(iso2, O$par)
}


pfData <- data.frame(pFrontier1, pFrontier2, iso1, iso2)

barPlot <- ggplot(pfData, aes(x=pFrontier1, y=pFrontier2)) +
  geom_line(size=1.5) + 
  # geom_line(y=iso2, lty=2) +
  # geom_line(aes(x=iso1, y=pFrontier2), lty=2) +
  annotate("text", x=pFrontier1[length(pFrontier1)/2] + .1, y=pFrontier2[length(pFrontier2)/2],
           label=TeX("$\\lambda G_i + (1 - \\lambda) G_j$"), family="Palatino", size=5) +
  annotate("text", x=pFrontier1[length(pFrontier1)] - .04, y=pFrontier2[length(pFrontier2)] + .025,
           label=TeX("$\\lambda = 1$"), family="Palatino", size=5) +
  annotate("text", x=pFrontier1[1] + .04, y=pFrontier2[1] - .025,
           label=TeX("$\\lambda = 0$"), family="Palatino", size=5) +
  geom_vline(xintercept=max(pFrontier1), size=1) +
  geom_hline(yintercept=max(pFrontier2), size=1) +
  scale_x_continuous(expand = c(0, 0), breaks=c(1, tauStar1), labels=c(1, TeX("$\\tau_i^{*}(a_i)$"))) +
  scale_y_continuous(expand = c(0, 0), breaks=c(1, tauStar2), labels=c(1, TeX("$\\tau_j^{*}(a_j)$"))) +
  theme_classic() +
  theme(text=element_text(family="Palatino"), axis.text=element_text(size=12), 
        axis.ticks=element_blank(), axis.title=element_blank(),
        plot.margin=unit(c(.5,.5,.5,.5), "cm"), aspect.ratio=1) +
  labs(title="Bargaining Space")
  
  