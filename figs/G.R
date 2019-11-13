library(tidyverse)
library(latex2exp)

path <- getwd() %>% strsplit("/")
lastPath <- path[[1]][length(path[[1]])]

if (lastPath == "figs") {
  source("source.R")
  source("params.R")
}

tau_i <- seq(1, 2, .01)
tau_j <- 1

G_vals1 <- G(tau_i, tau_j, a1, sigma, alpha, L)
G_vals2 <- G(tau_i, tau_j, a2, sigma, alpha, L)
G_vals1_n <- (G_vals1 - min(G_vals1)) / (max(G_vals1) - min(G_vals1))
G_vals2_n <- (G_vals2 - min(G_vals2)) / (max(G_vals2) - min(G_vals2))

tauStar1 <- tau_i[which.max(G_vals1)]
tauStar2 <- tau_i[which.max(G_vals2)]

G_data <- data.frame(tau_i, G_vals1, G_vals2)

tick <- .1

aprimecolor <- "steelblue4"

Gplot1 <- ggplot(G_data, aes(x=tau_i, y=G_vals1_n)) + 
  scale_x_continuous(limits=c(1, tau_i[length(tau_i)] + tick / 2), breaks=c(1, tauStar1, tauStar2), labels=c(1, "", "")) +
  theme_classic() +
  theme(aspect.ratio=1) +
  theme(text=element_text(family="Palatino"), axis.text.y=element_blank(), axis.text.x=element_text(size=12), axis.title.x=element_text(size=12, hjust=1), axis.title.y=element_text(size=12), axis.ticks.y=element_blank()) +
  labs(x=TeX("$\\tau_i$"), y = TeX("$G(\\tau_i)$"), title = "Government Objective Function") +
  coord_equal()

Gplot2 <- Gplot1 + 
  geom_vline(xintercept=tauStar1, lty=2, alpha=.5) +
  geom_line(size=1.25) +
  annotate("text", x=2, y=G_vals1_n[length(G_vals1_n)] + tick, label=TeX("$G(\\tau_i | a)$"), family="Palatino") +
  scale_x_continuous(limits=c(1, tau_i[length(tau_i)] + tick / 2), breaks=c(1, tauStar1, tauStar2), labels=c(1, TeX("$\\tau_i^{*}(a)$"), ""))

Gplot3 <- Gplot2 + 
  geom_vline(xintercept=tauStar2, lty=2, alpha=.5) +
  geom_line(aes(y=G_vals2_n), color=aprimecolor, size=1.25) +
  annotate("text", x=2, y=G_vals2_n[length(G_vals2_n)] + tick, label=TeX("$G(\\tau_i | a`)$"), family="Palatino", color=aprimecolor) +
  scale_x_continuous(limits=c(1, tau_i[length(tau_i)] + tick / 2), breaks=c(1, tauStar1, tauStar2), labels=c(1, TeX("$\\tau_i^{*}(a)$"), TeX("$\\tau_i^{*}(a`)$")))

Gplot <- Gplot3
