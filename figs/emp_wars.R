### SETUP ###

# helperPath <- "source/R/"
# helperFiles <- list.files(helperPath)
# for (i in helperFiles) {
#   source(paste0(helperPath, i))
# }

# libs <- c("tidyverse", "patchwork", "ggrepel", "latex2exp", "ggpubr", "padr", "countrycode")
# ipak(libs)

# if (dir.exists("temp")) {
#   unlink("temp", recursive=TRUE)
# }

tradeM <- read_csv("https://www.dropbox.com/s/g7e4q94drqbqg6w/trade.csv?dl=1", col_types=list(pop1="n", pop2="n", deaths="n"))
wars <- read_csv("https://www.dropbox.com/s/ry1y4s153mi6v8c/wars.csv?dl=1")

tradeM$deaths <- as.integer(tradeM$deaths)

### PLOT ###

tradeM$zeros <- 0

# choose variables to plot
tradeM$tradeInt.plot <- tradeM$tradeInt.ihs.lag
tradeM$meanPolity.plot <- tradeM$meanPolity

tradeF <- tradeM %>% filter(!is.na(tradeInt.plot) & !is.na(meanPolity.plot)) # filter missing lagged variables
tradeUF <- tradeM %>% filter(is.na(tradeInt.plot) | is.na(meanPolity.plot))

tradeF$cname1 <- countrycode(tradeF$ccode1, "cown", "country.name")
tradeF$cname2 <- countrycode(tradeF$ccode2, "cown", "country.name")

# rename Russia
tradeF$cname1 <- ifelse(tradeF$cname1=="Russian Federation", "Russia", tradeF$cname1)
tradeF$cname2 <- ifelse(tradeF$cname2=="Russian Federation", "Russia", tradeF$cname2)

tradeF$dyadName <- paste0(tradeF$cname1, " - ", tradeF$cname2, ", ", tradeF$year)

tradeFwars <- tradeF %>% filter(war==1)
tradeFpeace <- tradeF %>% filter(war==0)

# add labels to representative observations
tradeFwars$lab <- ifelse(tradeFwars$deaths > 1000000,
                         paste0(tradeFwars$cname1, " - ", tradeFwars$cname2, ", ", tradeFwars$year, "\n",
                         paste(format(round((tradeFwars$deaths) / 1000000, 1), trim = TRUE), "million"),
                         " battle deaths"),
                         paste0(tradeFwars$cname1, " - ", tradeFwars$cname2, ", ", tradeFwars$year, "\n",
                                paste(format(round((tradeFwars$deaths) / 1000, 1), trim = TRUE), "thousand"),
                                " battle deaths")
                         )

keep <- c("Austria-Hungary - Russia, 1914", "Armenia - Azerbaijan, 1993")
tradeFwars$lab <- ifelse(tradeFwars$dyadName %in% keep, tradeFwars$lab, "")

tradeFpeace$lab <- tradeFpeace$dyadName

# unmerged wars
warsUnmerged <- tradeUF %>% filter(war==1)
warsUnmerged$cname1 <- countrycode(warsUnmerged$ccode1, "cown", "country.name")
warsUnmerged$cname2 <- countrycode(warsUnmerged$ccode2, "cown", "country.name")

# get those with polity data available
tradeUFP <- tradeUF %>% filter(!is.na(meanPolity.plot))

N <- 10000
sampleI <- sample(seq(1, nrow(tradeFpeace)), N)

tradeS <- tradeFpeace[sampleI, ]

# add representative dot with label
repPeaceObs <- "France - Germany, 2007"
if (!(repPeaceObs) %in% tradeS$dyadName) {
  toAdd <- tradeFpeace %>% filter(dyadName==repPeaceObs)
  tradeS <- bind_rows(tradeS, toAdd)
}
tradeS$lab <- ifelse(tradeS$lab==repPeaceObs, tradeS$lab, "")

# size bounds
maxSize <- 10
popSummary <- summary(tradeS$meanPop) / max(tradeS$meanPop) * maxSize

warsAll <- bind_rows(tradeFwars, warsUnmerged)

deathsSummary <- summary(warsAll$deaths) / max(warsAll$deaths, na.rm=T) * maxSize

# colors: https://picular.co/volcano
# colors2: https://picular.co/war
# lineColor <- "#34556D"
lineColor <- "#191309"
# pointsColor <- "#CCA686"
pointsColor <- "#A8BFD9"
# warsColor <- "#DD2E2B"
# warsColor <- "#B15740"
warsColor <- bcOrange
# warsColorBoundary <- "#C7502B"
# warsColorFill <- "#F17929"
warsColorBoundary <- "#C7502B"
warsColorFill <- "#F17929"

labelSize <- 11
titleSize <- 16
captionSize <- 9
annotationSize <- 4

### Commercial-Democratic Peace ###

pos <- position_jitter()
main <- tradeS %>% ggplot(aes(x=meanPolity.plot, y=tradeInt.plot, label=lab)) +
  # geom_point(size=.5, alpha=.5) +
  stat_smooth(geom="line", method="lm", se=FALSE, color=lineColor, size=.75, alpha=1) +
  geom_point( alpha=.2, fill=pointsColor, color=pointsColor, pch=21,
             position=pos) +
  geom_point(data=tradeFwars, aes(size=deaths, text=dyadName),
             alpha=1, fill=warsColor, color="black", pch=21, stroke=.5,
             position=pos) +
  geom_text_repel(data=tradeFwars, size=3, box.padding = unit(0.75, "lines"), position=pos) +
  geom_text_repel(data=tradeS, size=3, box.padding = unit(0.75, "lines"), position=pos) +
  scale_size_continuous(range = c(maxSize / 10, maxSize)) +
  # annotate("text", x=-5, y=max(tradeS$tradeInt.plot), label="More Autocratic", size=annotationSize, hjust=0, vjust=.5) +
  # annotate("segment", x=-5.5, xend=-8, y=max(tradeS$tradeInt.plot), yend=max(tradeS$tradeInt.plot), arrow=arrow(), size=.5) +
  # annotate("text", x=5, y=max(tradeS$tradeInt.plot), label="More Democratic", size=annotationSize, hjust=1, vjust=.5) +
  # annotate("segment", x=5.5, xend=8, y=max(tradeS$tradeInt.plot), yend=max(tradeS$tradeInt.plot), arrow=arrow(), size=.5) +
  # geom_line(aes(x=meanPolity, y=tradeInt.pred)) +
  labs(x="Dyad-Year Average POLITY Score", y="Dyad-Year Economic Integration") +
  # ggtitle("Political Bias, Trade, and War, 1870-2014") +
  theme_classic() +
  theme(axis.title.y=element_text(size=labelSize),
        axis.ticks.y=element_blank(), axis.text.y=element_blank(),
        axis.title.x=element_blank()) +
  theme(axis.text.x=element_text(size=labelSize)) +
  # theme(axis.text.x=element_blank(), axis.ticks.x=element_blank(), axis.line.x=element_blank()) +
  guides(size=FALSE)

polityDensity <- tradeS %>% ggplot(aes(x=meanPolity.plot)) +
  geom_line(stat="density", color=pointsColor) +
  labs(title="The Commercial-Democratic Peace, 1870-2014") +
  theme_classic() +
  theme(axis.text=element_blank(), axis.ticks=element_blank(),
        axis.title=element_blank(), axis.line=element_blank(),
        plot.title=element_text(size=titleSize))

tradeIntDensity <- tradeS %>% ggplot(aes(x=tradeInt.plot)) +
  geom_line(stat="density", color=pointsColor) +
  theme_classic() +
  theme(axis.text=element_blank(), axis.ticks=element_blank(), axis.title=element_blank(), axis.line=element_blank()) +
  # theme(plot.margin = unit(c(0, 0, 0, 0), "cm")) +
  coord_flip()

text.a <- paste0("Notes: Each point is one dyad-year. Red-orange points are dyad-years in which a war began, ",
                 "sized by the number of battle deaths each side incurred during that war. ",
                 "Light blue points are a sample of 10,000 dyad-years in which no wars occured. ",
                 "Economic integration is measured as the average of the countries' directed imports to gdp ratio. ",
                 "An inverse hyperbolic sine transformation was applied to normalize the economic integration measure. ",
                 "Economic Integration score lagged by one year. ",
                 "Margin plots show the density of the transformed economic integration measure and the average POLITY score. ",
                 "A trend line shows the correlation between economic integration and average POLITY score in the sample of peaceful dyads. ",
                 "The distribution of average POLITY scores for war dyads for which trade or gdp data were not available ",
                 "is plotted in a histogram below the scatterplot.")
text.b <- paste0("Data Sources: ",
                 "(Wars) Sarkees, Meredith Reid and Frank Wayman (2010). Resort to War: 1816-2007. Washington DC: CQ Press. ",
                 "(Trade) Barbieri, Katherine and Omar M. G. Omar Keshk. 2016. Correlates of War Project Trade Data Set Codebook, Version 4.0. Online: http://correlatesofwar.org. ",
                 "Barbieri, Katherine, Omar M. G. Keshk, and Brian Pollins. 2009. ",
                 "'TRADING DATA: Evaluating our Assumptions and Coding Rules.' Conflict Management and Peace Science. 26(5): 471-491. ",
                 "(GDP) Maddison Project Database, version 2018. Bolt, Jutta, Robert Inklaar, Herman de Jong and Jan Luiten van Zanden (2018), ",
                 "'Rebasing Maddison: new income comparisons and the shape of long-run economic development', Maddison Project Working paper 10. ",
                 "(POLITY) Marshall, M. G., Jaggers, K., & Gurr, T. R. (2002). Polity IV project: Dataset users' manual. College Park: University of Maryland.")

caption.a <- ggparagraph(text.a, size=captionSize)
caption.b <- ggparagraph(text.b, size=captionSize)

caption <- caption.a + caption.b + plot_layout(ncol=1)

polityRail <- warsUnmerged %>% ggplot(aes(x=meanPolity.plot)) +
  geom_histogram(fill=warsColor, alpha=1) +
  xlim(-10, 10) +
  labs(x="Dyad-Year Average POLITY Score", y="Wars with\nMissing Trade") +
  theme(axis.title.x=element_text(size=labelSize), axis.title.y=element_text(size=labelSize),
        axis.text.x=element_text(size=labelSize), axis.line.x=element_line(),
        axis.ticks.y=element_blank(), panel.background=element_blank(),
        axis.text.y=element_blank(), axis.line.y=element_blank(),
        plot.caption=element_text(size=captionSize, hjust=0))

polityRailCaption <- polityRail + caption.a + plot_layout(ncol=1)

empty <- ggplot() + geom_point(aes(1,1), colour="white")+
  theme(axis.ticks=element_blank(), panel.background=element_blank(),
        axis.text=element_blank(), axis.line=element_blank(),
        axis.title=element_blank())

### "Regression Discontinuity" ###

tradeRDlist <- list()

window <- 10

for (i in 1:nrow(wars)) {
  w <- wars$dyadID[i]
  y <- wars$warstrtyr[i]

  tradeW <- tradeM %>% filter(dyadID == w & year >= y - window & year <= y + window)

  if (nrow(tradeW) > 0) {
    tradeW$t <- tradeW$year - y
  }

  tradeRDlist[[i]] <- tradeW

}

tradeRD <- bind_rows(tradeRDlist)

tradeRDplot <- ggplot(data=tradeRD, aes(x=t, y=tradeInt.ihs)) +
  geom_jitter(size=.5, alpha=.2, width=.2) +
  geom_smooth(data=filter(tradeRD, t<=0), method="lm", se=FALSE, color=bcOrange) +
  geom_smooth(data=filter(tradeRD, t>=0), method="lm", se=FALSE, color=bcOrange) +
  geom_vline(xintercept=0, lty=2) +
  labs(x="Years After Beginning of War", y="Dyadic Economic Integration", title="Trade and War",
       caption="") +
  theme_classic() +
  theme(aspect.ratio=1) +
  theme(axis.ticks.y=element_blank(), axis.text.y=element_blank())
