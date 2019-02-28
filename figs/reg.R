### SETUP ###

source("~/Dropbox/11_Workflow/source.R")

libs <- c("tidyverse", "patchwork", "ggrepel", "latex2exp")
ipak(libs)

if (dir.exists("temp")) {
  unlink("temp", recursive=TRUE)
}

tradeM <- read_csv("data/tradeM.csv")
wars <- read_csv("data/wars.csv")

### Commercial Peace Regressions

# # note these are regressions for wars, not MIDs
# tradeM$ccode1 <- as.factor(tradeM$ccode1)
# tradeM$ccode2 <- as.factor(tradeM$ccode2)
# tradeM$year <- as.factor(tradeM$year)
# 
# # TradeInt
# lmTradeInt <- glm(war ~ tradeInt.ihs.lag + ccode1 + ccode2 + year, data=tradeM, family="binomial")
# summary(lmTradeInt)
# # negative coefficients with two way fixed effects, but not without
# 
# # Trade Shares
# lmTradeShares <- glm(war ~ share1.ihs.lag + share2.ihs.lag + share1.ihs.lag*share2.ihs.lag + ccode1 + ccode2 + year, 
#                      data=tradeM, family="binomial")
# out <- summary(lmTradeShares)
# out$coefficients[ , 1] / out$coefficients[ , 2]
# # not as strong of results here

# Dyad Fixed Effects (within dyad identification)
tradeMW <- tradeM %>% filter(dyadID %in% unique(wars$dyadID))
tradeMW$dyadID <- as.factor(tradeMW$dyadID)

lmDyadFE <- glm(war ~ tradeInt.ihs.lag + dyadID, data=tradeMW, family="binomial")
summary(lmDyadFE)
