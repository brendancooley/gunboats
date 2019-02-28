
tradeS %>% ggplot(aes(x=meanPolity.plot, y=tradeInt.plot)) +
  # geom_point(size=.5, alpha=.5) +
  stat_smooth(geom="line", method="lm", se=FALSE, color=lineColor, size=.75, alpha=.75) +
  geom_jitter(aes(text=dyadName), alpha=.2, fill=pointsColor, color=pointsColor, pch=21) +
  geom_jitter(data=tradeFwars, aes(size=deaths, text=dyadName), 
              alpha=1, fill=warsColorFill, color=warsColorBoundary, pch=21, stroke=1.5) +
  # geom_text_repel(data=tradeFwars, size=3) +
  scale_size_continuous(range = c(maxSize / 10, maxSize)) +
  # geom_line(aes(x=meanPolity, y=tradeInt.pred)) +
  labs(x="Dyad Average POLITY Score", y="Dyad Economic Integration") +
  # ggtitle("Political Bias, Trade, and War, 1870-2014") +
  theme_classic() +
  theme(axis.title.y=element_text(size=textSize),
        axis.ticks.y=element_blank(), axis.text.y=element_blank(),
        axis.title.x=element_blank()) +
  theme(axis.text.x=element_text(size=textSize)) +
  # theme(axis.text.x=element_blank(), axis.ticks.x=element_blank(), axis.line.x=element_blank()) +
  guides(size=FALSE)

main <- tradeS %>% ggplot(aes(x=meanPolity.plot, y=tradeInt.plot, size=meanPop)) +
  # geom_point(size=.5, alpha=.5) +
  stat_smooth(geom="line", method="lm", se=FALSE, color=lineColor, size=.75, alpha=.5) +
  geom_jitter(aes(text=dyadName), alpha=.2, color=pointsColor) +
  geom_jitter(data=tradeFwars, aes(text=dyadName), color=warsColor, alpha=.75) +
  scale_size_continuous(range = c(popSummary[1], maxSize)) +
  # geom_line(aes(x=meanPolity, y=tradeInt.pred)) +
  labs(x="Dyad Average POLITY Score", y="Dyad Economic Integration") +
  # ggtitle("Political Bias, Trade, and War, 1870-2014") +
  theme_classic() +
  theme(axis.title.y=element_text(size=textSize),
        axis.ticks.y=element_blank(), axis.text.y=element_blank(),
        axis.title.x=element_blank()) +
  theme(axis.text.x=element_text(size=textSize)) +
  # theme(axis.text.x=element_blank(), axis.ticks.x=element_blank(), axis.line.x=element_blank()) +
  guides(size=FALSE)

tradeFwars$id1 <- paste(tradeFwars$warnum, tradeFwars$ccode1, tradeFwars$ccode2, tradeFwars$year, sep="-")
tradeFwars$id2 <- paste(tradeFwars$warnum, tradeFwars$ccode2, tradeFwars$ccode1, tradeFwars$year, sep="-")

wars$id1 <- paste(wars$warnum, wars$statea, wars$stateb, wars$warstrtyr, sep="-")
wars$id2 <- paste(wars$warnum, wars$stateb, wars$statea, wars$warstrtyr, sep="-")

warsUnmerged <- wars %>% filter(!(id1 %in% tradeFwars$id1) & !(id1 %in% tradeFwars$id2) & 
                                  !(id2 %in% tradeFwars$id1) & !(id2 %in% tradeFwars$id2)) %>% filter(warstrtyr >=1870)

ids <- match(warsUnmerged$id1, warsUnmerged$id2) 
select <- ids > seq(1, length(warsUnmerged$id1))

warsUnmergedD <- warsUnmerged[select, ] 
warsUnmergedD$cnamea <- countrycode(warsUnmergedD$statea, "cown", "country.name")
warsUnmergedD$cnameb <- countrycode(warsUnmergedD$stateb, "cown", "country.name")

warsUnmergedD %>% select(warstrtyr, cnamea, cnameb, everything()) %>% print(n=200)

warsUnmergedD %>% filter(statea==365 | stateb==365) %>% print(n=200)

countrycode("Austria-Hungary", "country.name", "cown")
countrycode("AUT", "iso3c", "cown")

tradeF %>% filter(ccode1==710 & ccode2==740) %>% filter(year==1893) %>% print(n=50)



### TEST BAY ###
tradeMwars %>% filter(cname1 == "Germany" | cname2 == "Germany") %>% select(meanPolity, everything())
tradeMwars %>% filter(year==1931)
wars %>% filter(warstrtyr==1931)

tradeW <- left_join(trade, wars, by=c("ccode1"="statea", "ccode2"="stateb", "year"="warstrtyr"))
tradeW %>% filter(war==1)
wars

test <- tradeM$meanGdp / max(tradeM$meanGdp)
summary(test)

tradeT <- tradeM
tradeT$country1 <- countrycode(tradeT$ccode1, "cown", "country.name")
tradeT$country2 <- countrycode(tradeT$ccode2, "cown", "country.name")
tradeT %>% arrange(desc(tradeInt)) %>% print(n=100)

trade %>% filter(ccode1==450, year==1994) %>% arrange(desc(flow1))
countrycode(522, "cown", "country.name")
countrycode(710, "cown", "country.name")
countrycode(140, "cown", "country.name")
countrycode(56, "cown", "country.name")
countrycode(450, "cown", "country.name")
countrycode(740, "cown", "country.name")
countrycode(732, "cown", "country.name")
countrycode(830, "cown", "country.name")

wars %>% filter(warstrtyr<1870)

# use trade in t minus one for wars
