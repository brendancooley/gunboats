### SETUP ###

# first run Kenkel merge-cow-polity.r to create polityCLEAN.csv

source("~/Dropbox/11_Workflow/source.R")

libs <- c("tidyverse", "readxl", "countrycode", "foreach", "latex2exp", "reader")
ipak(libs)

if (dir.exists("temp")) {
  unlink("temp", recursive=TRUE)
}

### DATA ###

dir.create("temp")

# wars
warsUrl <- "http://www.correlatesofwar.org/data-sets/COW-war/dyadic-inter-state-war-dataset/at_download/file"
temp <- tempfile()
download.file(warsUrl, temp)
unzip(temp, exdir="temp")

wars <- read_csv("temp/directed_dyadic_war.csv") %>% select(warnum, statea, stateb, warstrtyr, warendyr, batdthb, batdtha) %>% unique() # 1816-2007



# trade
tradeUrl <- "http://www.correlatesofwar.org/data-sets/bilateral-trade/cow_trade_4.0/at_download/file"
temp <- tempfile()
download.file(tradeUrl, temp)
unzip(temp, exdir="temp")

trade <- read_csv("temp/COW_Trade_4.0/Dyadic_COW_4.0.csv", 
                  col_types = list(bel_lux_alt_flow1=col_character(),
                                   bel_lux_alt_flow2=col_character(),
                                   china_alt_flow1=col_character(),
                                   china_alt_flow2=col_character(),
                                   source1=col_character())) %>% select(ccode1, ccode2, year, flow1, flow2) # 1870-2014

# polity
wd <- strsplit(getwd(), "/")[[1]][length(strsplit(getwd(), "/")[[1]])]

if (wd=="figs") {
  polity <- read_csv("data/polityCLEAN.csv")
} else {
  polity <- read_csv("figs/data/polityCLEAN.csv")
}

# gdp
temp <- tempfile(fileext=".xlsx")
download.file("https://www.rug.nl/ggdc/historicaldevelopment/maddison/data/mpd2018.xlsx", temp)
maddison <- read_excel(temp, sheet=2) %>% select(countrycode, year, cgdppc, pop)

# clean up
unlink("temp", recursive=TRUE)

### WRANGLE ###

# trade NAs
trade$flow1 <- ifelse(trade$flow1==-9, NA, trade$flow1)
trade$flow2 <- ifelse(trade$flow2==-9, NA, trade$flow2)

# drop trade bizzare observations
# 450 - Liberia
# 56 - St. Lucia
drop <- c(450, 56)
trade <- trade %>% filter(!(ccode1 %in% drop) & !(ccode2 %in% drop))

# drop maddison pre 1870
maddison <- maddison %>% filter(year >= 1870)
maddison$year <- as.integer(maddison$year)

# pad maddison dates
maddison <- maddison %>% group_by(countrycode) %>% complete(year=seq(max(maddison$year), min(maddison$year)))

# correct weird entries in Maddison
# former Soviet Union becomes Russia, corresponds to COW entity
maddison <- maddison %>% filter(countrycode!="RUS")
maddison$countrycode <- ifelse(maddison$countrycode=="SUN", "RUS", maddison$countrycode)

# maddison codes to COW
maddison$ccode <- countrycode(maddison$countrycode, "iso3c", "cown")

# interpolate population and gdp data
maddisonI <- maddison %>% group_by(ccode) %>% 
  mutate(cgdppc_interpolated=approx(year, cgdppc, xout=year)$y,
         pop_interpolated=approx(year, pop, xout=year)$y)

maddisonM <- maddisonI %>% select(ccode, year, cgdppc_interpolated, pop_interpolated) %>% ungroup()
colnames(maddisonM)[colnames(maddisonM) %in% c("cgdppc_interpolated", "pop_interpolated")] <- c("cgdppc", "pop")

# Maddison has separate entries for Austria and Hungary before 1918
# combine populations and average gdp per capita for Austria Hungary
aut1918 <- maddisonM %>% filter(year <= 1918, ccode == 305) %>% select(year, cgdppc, pop)
colnames(aut1918) <- c("year", "aut_cgdppc", "aut_pop")
hun1918 <- maddisonM %>% filter(year <= 1918, ccode == 310) %>% select(year, cgdppc, pop)
colnames(hun1918) <- c("year", "hun_cgdppc", "hun_pop")

authun1918 <- left_join(aut1918, hun1918)
authun1918$cgdppc <- (authun1918$aut_cgdppc * authun1918$aut_pop + authun1918$hun_cgdppc * authun1918$hun_pop) / (authun1918$hun_pop + aut1918$aut_pop)
authun1918$pop <- authun1918$hun_pop + authun1918$aut_pop
authun1918$ccode <- 300

authun1918 <- authun1918 %>% select(ccode, year, cgdppc, pop)

maddisonM <- bind_rows(maddisonM, authun1918)

# unmatched: 
# PRI: Puerto Rico
# PSE: Palestine
# SRB: Serbia (former Yugoslavia - YUG)
# HKG

# calculate gdp (pop in thousands)
maddisonM$gdp <- maddisonM$cgdppc * (maddisonM$pop*1000) / 1000000  # in millions
maddisonM <- maddisonM %>% select(-cgdppc)

# calculate trade shares
tradeM <- trade
tradeM <- left_join(trade, maddisonM, by=c("ccode1"="ccode", "year"))
colnames(tradeM)[colnames(tradeM)=="gdp"] <- "gdp1"
colnames(tradeM)[colnames(tradeM)=="pop"] <- "pop1"
tradeM <- left_join(tradeM, maddisonM, by=c("ccode2"="ccode", "year"))
colnames(tradeM)[colnames(tradeM)=="gdp"] <- "gdp2"
colnames(tradeM)[colnames(tradeM)=="pop"] <- "pop2"

tradeM$share1 <- tradeM$flow1 / tradeM$gdp1
tradeM$share2 <- tradeM$flow2 / tradeM$gdp2

tradeM$tradeInt <- (tradeM$share1 + tradeM$share2) / 2 # trade integration score
tradeM$meanGdp <- (tradeM$gdp1 + tradeM$gdp2) / 2
tradeM$meanPop <- (tradeM$pop1 + tradeM$pop2) / 2

# append polity
tradeM <- left_join(tradeM, polity, by=c("ccode1"="ccode", "year"))
colnames(tradeM)[colnames(tradeM)=="polity"] <- "polity1"
tradeM <- left_join(tradeM, polity, by=c("ccode2"="ccode", "year"))
colnames(tradeM)[colnames(tradeM)=="polity"] <- "polity2"

tradeM$meanPolity <- (tradeM$polity1 + tradeM$polity2) / 2

tradeM$dyadID <- paste0(tradeM$ccode1, "-", tradeM$ccode2)

# inverse hyperbolic sine transformation
# https://github.com/brentonk/crpn/blob/master/R/00-nmc.r
ks_stat <- function(x) {
  x <- x[!is.na(x)]
  ans <- ecdf(x)(x) - pnorm(x, mean = mean(x), sd = sd(x))
  max(abs(ans))
}

# TradeInt
theta_candidates <- 2^seq(0, 100)
variable <- tradeM$tradeInt
loss <- foreach (s = theta_candidates) %do% {
  ks_stat(asinh(s * variable))
}
thetaStar <- theta_candidates[which.min(loss)]

tradeM$tradeInt.ihs <- asinh(thetaStar * variable)

# check normality
ggplot(tradeM, aes(x=tradeInt.ihs)) + geom_histogram()

# TradeShare
variable <- c(tradeM$share1, tradeM$share2)
loss <- foreach (s = theta_candidates) %do% {
  ks_stat(asinh(s * variable))
}
thetaStar <- theta_candidates[which.min(loss)]

tradeM$share1.ihs <- asinh(thetaStar * tradeM$share1)
tradeM$share2.ihs <- asinh(thetaStar * tradeM$share2)

# check normality
ggplot(tradeM, aes(x=share1.ihs)) + geom_histogram()
ggplot(tradeM, aes(x=share2.ihs)) + geom_histogram()

# lag tradeInt score and meanPolity
tradeM <- tradeM %>% group_by(dyadID) %>%
  mutate(tradeInt.ihs.lag=lag(tradeInt.ihs),
         meanPolity.lag=lag(meanPolity),
         share1.ihs.lag=lag(share1.ihs),
         share2.ihs.lag=lag(share2.ihs))

# append wars
wars$war <- 1

tradeM <- left_join(tradeM, wars, by=c("ccode1"="statea", "ccode2"="stateb", "year"="warstrtyr"))
# Note: wars are double counted, so all are merged, if trade data exist
tradeM$war <- ifelse(is.na(tradeM$war), 0, 1)
tradeM %>% filter(war==1)

tradeM$deaths <- tradeM$batdtha + tradeM$batdthb


tradeM$pop1 <- as.integer(tradeM$pop1)
tradeM$pop2 <- as.integer(tradeM$pop2)
# tradeM$deaths <- as.numeric(tradeM$deaths)

tradeM$iso3c1 <- countrycode(tradeM$ccode1, "cown", "iso3c")
tradeM$iso3c2 <- countrycode(tradeM$ccode2, "cown", "iso3c")
tradeM$cname1 <- countrycode(tradeM$ccode1, "cown", "country.name")
tradeM$cname2 <- countrycode(tradeM$ccode2, "cown", "country.name")

write_csv(tradeM, "../data/tradeM.csv")

wars$dyadID <- paste0(wars$statea, "-", wars$stateb)
write_csv(wars, "../data/wars.csv")
