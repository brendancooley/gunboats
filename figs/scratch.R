library(cowplot)
library(grid)
library(gridExtra)
library(ggpubr)


### Commercial Peace ###

pos <- position_jitter()
TT <- tradeS %>% ggplot(aes(x=share1.ihs.lag, y=share2.ihs.lag)) +
  geom_point(alpha=.2, fill=pointsColor, color=pointsColor, pch=21,
             position=pos) +
  geom_point(data=tradeFwars, aes(size=deaths), 
             alpha=1, fill=warsColor, color="black", pch=21, stroke=.5,
             position=pos) +
  labs(x="", y="") +
  theme_classic() +
  theme(axis.ticks=element_blank(), axis.text=element_blank()) +
  guides(size=FALSE)


### Dyad Fixed Effects ###

tradeMW <- tradeM %>% filter(dyadID %in% unique(wars$dyadID))
tradeMW$dyadChar <- paste0(tradeMW$iso3c1, "-", tradeMW$iso3c2)
tradeMW$year <- as.Date(ISOdate(tradeMW$year, 1, 1))  # beginning of year

tradeMW <- tradeMW %>% pad(group="dyadChar")

include <- c("GBR-CHN", "USA-JPN", "USA-DEU", "USA-IRQ", "CHN-IND", "IND-PAK")

tradeMWtest <- tradeMW %>% filter(dyadChar %in% include)

ggplot(data=tradeMWtest, aes(x=year, y=tradeInt.ihs)) +
  geom_line() +
  geom_vline(data=filter(tradeMWtest, war==1), aes(xintercept=year), color="red") +
  labs(x="Year", y="Economic Integration") +
  theme_classic() + 
  facet_wrap(~dyadChar)

# # get font
# font_add_google("Open Sans Condensed", regular.wt = 300, bold.wt = 700)
# 
# showtext.auto()

# trade %>% filter(ccode1==450, year==1994) %>% arrange(desc(flow1)) %>% select(source1, source2, everything())
# trade %>% filter(year==1920, ccode1==2, ccode2==20)
# trade %>% filter(year==1920, ccode1==20, ccode2==2)

# polity
# temp <- tempfile(fileext=".xls")
# download.file("http://www.systemicpeace.org/inscr/p4v2017.xls", temp)
# polity <- read_excel(temp) %>% select(ccode, year, polity)


# maddison %>% filter(countrycode=="USA") %>% print(n=100)

# convert wars to dyad-years
# warsY <- wars %>%
#   rowwise() %>%
#   do(data.frame(warnum=.$warnum, statea=.$statea, stateb=.$stateb,
#                 year=seq(.$warstrtyr,.$warendyr)))

# countrycode(700, "cown", "country.name")

# maddison %>% filter(ccode==450) %>% print(n=100)
# maddison %>% filter(countrycode=="RUS") %>% print(n=100)
# popRussia <- maddison %>% filter(countrycode=="RUS") %>% pull(pop)
# yRussia <- maddison %>% filter(countrycode=="RUS") %>% pull(year)
# approx(yRussia, popRussia, xout=yRussia)
# popRussia
# popRussia[1] <- NA
# approx(yRussia, popRussia, xout=yRussia)

# tradeM %>% filter(ccode1==450, year==1994) %>% print(n=100)


# tradeM %>% arrange(desc(tradeInt)) %>% print(n=100)

# summary(tradeM)
# tradeM %>% filter(ccode1==365 | ccode2==365) %>% filter(year==1899) %>% print(n=100)


# taken care of by Kenkel script
# # clean polity interregnum/transition
# polity$polity <- ifelse(polity$polity < -10, NA, polity$polity)
# polity %>% filter(year==1900) %>% print(n=100)
# countrycode("Russian Federation", "country.name", "cown")
# 
# # combine autria and hungary in polity
# polityAUT <- polity %>% filter(year <= 1918, ccode==305) %>% select(year, polity)
# colnames(polityAUT) <- c("year", "polityAUT")
# polityHUN <- polity %>% filter(year <= 1918, ccode==305) %>% select(year, polity)
# colnames(polityHUN) <- c("year", "polityHUN")
# 
# polityAUTHUN <- left_join(polityAUT, polityHUN)
# polityAUTHUN$polity <- (polityAUTHUN$polityAUT + polityAUTHUN$polityHUN) / 2
# polityAUTHUN$ccode <- 300
# polityAUTHUN <- polityAUTHUN %>% select(ccode, year, polity)
# 
# polity <- bind_rows(polity, polityAUTHUN)
# polity %>% filter(year==1918) %>% print(n=100)
# 
# # convert USSR to Russia ccode
# polity$ccode <- ifelse(polity$ccode==364, 365, polity$ccode)

# tradeM %>% filter(ccode1==300) %>% select(polity1, polity2, everything())

# compute log tradeInt score
tradeM$tradeInt.log <- log(tradeM$tradeInt)
# summary(tradeM$tradeInt.lag.log)

# compute log tradeInt score
tradeM$tradeInt.lag.log <- log(tradeM$tradeInt.lag)
# summary(tradeM$tradeInt.lag.log)

# summary(tradeM$tradeInt.lag.ihs)
# density(tradeM$tradeInt.lag.ihs) %>% plot()

# jitter points
# jF <- 10
# tradeM$tradeInt.plot <- tradeM$tradeInt.plot %>% jitter(factor=jF)
# tradeM$meanPolity.plot <- tradeM$meanPolity.plot %>% jitter(factor=jF)

# add labels to most deadly wars
# deathsArr <- tradeFwars %>% arrange(desc(deaths)) %>% pull(deaths)
# deathThres <- deathsArr[5]
# tradeFwars$lab <- ifelse(tradeFwars$deaths > deathThres, tradeFwars$dyadName, "")
# tradeFpeace$lab <- ""

# tradeFwars %>% filter(dyadName=="Hungary-Russian Federation, 1956") %>% select(deaths)

# tradeFwars %>% select(cname1, cname2, year) %>% print(n=150)

# warsUnmerged %>% select(polity1, polity2, meanPolity.lag, everything()) %>% print(n=150)

# warsUnmerged %>% select(cname1, cname2, year, tradeInt.lag, meanPolity.lag, everything()) %>% print(n=150)
# polity %>% filter(year==1938) %>% print(n=100)

# tradeS <- bind_rows(tradeS, tradeMwars)
# tradeS %>% filter(tradeInt < 0)

# regression line
# tradePolityReg <- lm(tradeInt.plot ~ meanPolity, data=tradeM)
# tradeS$tradeInt.pred <- predict(tradePolityReg, newdata=tradeS)
# summary(tradeS$tradeInt.pred)
# summary(tradeS$tradeInt.plot)

# unplotted wars with polity data
# polityRail <- warsUnmerged %>% ggplot(aes(x=meanPolity.plot, y=zeros, size=meanPop)) +
#   geom_jitter(color=warsColor, alpha=.75, width=.01) +
#   xlim(-10, 10) +
#   labs(x="Dyad Average POLITY Score") +
#   theme(axis.ticks.y=element_blank(), panel.background=element_blank(), 
#         axis.text.y=element_blank(), axis.line.y=element_blank(),
#         axis.title.y=element_blank()) +
#   guides(size=FALSE)

# C <- paste("first line \n second line", expression(frac("x","y")))
# 
# plot(expression("some text frac(x,y) \n some more text"))
# plot(1, main=expression(frac(x,y)))
# 
# plot(TeX(expression(paste0(bold("Unit of observation: dyad-year"), "\n", "Economic integration:",
#                 "more stuff \n", "test"))))

# C <- expression(paste(bold("Data Sources: \n"), "test1 \n", "test2 \n", "test3"))
# doesn't seem to be working with more than one layer

# C <- "test1 \ntest2 \ntest3 \nbold('fancy one')"

# https://stackoverflow.com/questions/36001047/n-command-not-working-to-make-2-or-3-line-long-figure-caption-using-textgrob/36004120#36004120
# table_label <- function(label, params=list())  {
#   
#   params <- modifyList(list(hjust=0, x=0), params)
#   
#   mytheme <- ttheme_minimal(core = list(fg_params = params), parse=TRUE)
#   disect <- strsplit(label, "\\n")[[1]]
#   m <- as.matrix(disect)
#   tableGrob(m, theme=mytheme)
#   
# }
# 
# txt <- 'bold("Figure 1")\nThis is another line.\n alpha~beta*" are greek letters"'
# g <- table_label(txt)

# text.b <- paste0("This is a test")



# caption.b <- ggparagraph("Data Sources", size=captionSize, face="bold")
# 
# caption.c <- ggparagraph("Wars: test", size=captionSize, face="bold")
# 
# caption.d <- ggparagraph("Trade: test", size=captionSize, face="bold")
# 
# caption.e <- ggparagraph("GDP: test", size=captionSize, face="bold")
# 
# caption.f <- ggparagraph("POLITY: test", size=captionSize, face="bold")

# caption <- caption.a + caption.b + caption.c + plot_layout(ncol=1, heights=c(2, 1, 1))
# caption <- ggarrange(caption.a, caption.b, caption.c, caption.d, caption.e, caption.f, 
#                      ncol=1, nrow=6)



# captionBlockSize <- 4
# 
# leftPanel <- polityDensity + main + polityRail + caption + plot_layout(ncol=1, heights=c(1, 10, 2, captionBlockSize)) 
# rightPanel <- empty + tradeIntDensity + empty + empty + plot_layout(ncol=1, heights=c(1, 10, 2, captionBlockSize))
# all <- leftPanel - rightPanel + plot_layout(widths=c(8, 1))
# all

# mainRight <- main + tradeIntDensity + plot_layout(widths=c(8,1))
# top <- polityDensity + empty + plot_layout(widths=c(8,1))
# top + mainRight + plot_layout(ncol=1, heights=c(1,10))
# 
# leftPanel <- polityDensity + main + polityRail + caption.a + plot_layout(ncol=1, heights=c(1, 10, 2, 4)) 
# rightPanel <- empty + tradeIntDensity + empty + empty + plot_layout(ncol=1, heights=c(1, 10, 2, 4))
# all <- leftPanel - rightPanel + plot_layout(widths=c(8, 1))
# all

# polityDensity + empty + main + tradeIntDensity + polityRail + empty + caption.a + empty + plot_layout(ncol=2, widths=c(8,1), heights=c(1,10,2,4))



# captionBlockSize <- 2
# 
# leftPanel <- polityDensity + main + polityRailCaption + plot_layout(ncol=1, heights=c(1, 10, 4)) 
# rightPanel <- empty + tradeIntDensity + empty + plot_layout(ncol=1, heights=c(1, 10, 4))
# all <- leftPanel - rightPanel + plot_layout(widths=c(8, 1))
# all

# ggarrange(polityDensity, main, polityRail, caption, ncol=1, nrow=4, heights=c(1, 10, 2, captionBlockSize))

# finalPlot <- all


# write caption with information directly into figure
# add individual polity and tradeshares to tooltip

ggplotly(main, tooltip=c("text"))





# alternative: let tradeInt denominator be sum of all recorded world trade that year?
# but then measure depends on country size


###






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
