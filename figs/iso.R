library(tidyverse)
library(latex2exp)
library(reshape2)
library(ggthemes)

path <- getwd() %>% strsplit("/")
lastPath <- path[[1]][length(path[[1]])]

if (lastPath == "figs") {
  source("source.R")
  source("params.R")
}

a2 <- a1 <- 0

tauStar1 <- optim(par=1, fn=G, tau_j=1, a=a1, sigma=sigma, n=n, alpha=alpha, L=L, method="Brent", lower=1, upper=100, control=list(fnscale=-1))$par
tauStar2 <- optim(par=1, fn=G, tau_j=1, a=a2, sigma=sigma, n=n, alpha=alpha, L=L, method="Brent", lower=1, upper=100, control=list(fnscale=-1))$par

G1min <-  G(1, tauStar2, a1, sigma, n, alpha, L)
G1max <-  G(tauStar1, 1, a1, sigma, n, alpha, L)

Gseq <- seq(G1min, G1max, length.out=8)

iso <- function(tau_i, tau_j, a, sigma, n, alpha, L, Gbar) {
  return(abs(G(tau_i, tau_j, a, sigma, n, alpha, L) - Gbar))
}

top1 <- 2 * (tauStar1 - 1) + 1
top2 <- 2 * (tauStar2 - 1) + 1
tauSeq <- seq(1, top2, by=.001)

isoListL <- list()
isoListR <- list()
tick <- 1
for (i in Gseq) {
  isoVecL <- c()
  isoVecR <- c()
  for (j in tauSeq) {
    isoVecL <- c(isoVecL, optim(par=1, fn=iso, tau_j=j, a=a1, sigma=sigma, n=n, alpha=alpha, L=L, Gbar=i, lower=1, upper=tauStar1 - .01, method="Brent")$par)
    isoVecR <- c(isoVecR, optim(par=1, fn=iso, tau_j=j, a=a1, sigma=sigma, n=n, alpha=alpha, L=L, Gbar=i, lower=tauStar1 + .01, upper=top1, method="Brent")$par)
  }
  isoListL[[tick]] <- isoVecL
  isoListR[[tick]] <- isoVecR
  tick <- tick + 1
}

isoDataL <- bind_cols(isoListL[seq(2, length(isoListL) - 1)])
isoDataR <- bind_cols(isoListR[seq(2, length(isoListR) - 1)])

isoData <- bind_rows(isoDataL, isoDataR)

isoDataM <- melt(isoData)
isoDataM$value <- ifelse(isoDataM$value < 1.01, NA, isoDataM$value)
isoDataM$value <- ifelse(isoDataM$value > top1 - .0001, NA, isoDataM$value)

isoDataM$variable <- as.numeric(substring(isoDataM$variable, 2))

isoDataM$tau <- rep(tauSeq, length(unique(isoDataM$variable)))
isoDataM$G <- rep(Gseq[seq(2, length(isoListL) - 1)], each=length(tauSeq))

isoDataM <- isoDataM %>% filter(!(value >= tauStar1 - .03 & value <= tauStar1 + .03)) # filter near optimum

# x <- seq(0, 1, length = length(isoDataM$variable %>% unique()))
# colors <- tableau_seq_gradient_pal("Orange-Gold")(x)

isoPlot1 <- ggplot(isoDataM, aes(x=value, y=tau, group=variable, color=variable)) +
  scale_x_continuous(limits=c(1, top1), breaks=c(1, tauStar1), labels=c(1, TeX("$\\tau_i^{*}(a_i)$"))) +
  scale_y_continuous(limits=c(1, top2), breaks=c(1, tauStar2), labels=c(1, TeX("$\\tau_j^{*}(a_j)$"))) +
  theme_classic() +
  labs(x=TeX("$\\tau_i$"), y = TeX("$\\tau_j$"), title = "Government Iso-Welfare Curves") +
  theme(aspect.ratio=1, text=element_text(family="Palatino"), legend.position = "none")

isoPlot2 <- isoPlot1 + 
  geom_line() + 
  annotate("segment", x=top1 - .1, xend = top1 - .1, y = 1.5, yend = 1.3, arrow = arrow(length = unit(1, "lines"))) +
  annotate("text", x = top1-.3, y = 1.4, label = "Increasing \niso-welfare", family="Palatino") + 
  scale_color_gradient_tableau(palette="Blue") 

isoPlot <- isoPlot2


brPlot <- ggplot(isoDataM, aes(x=value, y=tau, group=variable, color=variable)) + 
  geom_line(alpha=.5) + 
  scale_color_gradient_tableau(palette="Blue") +
  geom_vline(xintercept=tauStar1, size=1.25) +
  geom_hline(yintercept=tauStar2, size=1.25) +
  annotate("text", x=tauStar1 + .05, y=tauStar2 + .05, size=4, hjust=0, label=TeX("$\\tau_i^{*}(a_i), \\tau_j^{*}(a_j)$"), family="Palatino") +
  scale_x_continuous(limits=c(1, top1), breaks=c(1, tauStar1), labels=c(1, TeX("$\\tau_i^{*}(a_i)$"))) +
  scale_y_continuous(limits=c(1, top2), breaks=c(1, tauStar2), labels=c(1, TeX("$\\tau_j^{*}(a_j)$"))) +
  theme_classic() +
  labs(x=TeX("$\\tau_i$"), y = TeX("$\\tau_j$"), title = "Government Best Responses") +
  theme(text=element_text(family="Palatino"), axis.text=element_text(size=12),
        legend.position = "none", aspect.ratio=1)
