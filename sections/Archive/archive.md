```{r bar, echo=FALSE, warning=FALSE, message=FALSE, fig.cap = "Bargaining space and pareto set \\label{fig:bar}", fig.pos="t", fig.height=5, dpi=300}

source("../figs/bar.R")

barPlot

```

The bargaining enviroment is depicted in Figure \ref{fig:bar}. Government $i$'s ideal point lies in the bottom right corner of the bargaining space, in which $j$ opens its markets completely and $i$ implements $\tau_i^\star(a_i, c_i, \rho)$. Government $j$'s ideal point, conversely, lies in the top left corner. By Lemma `r Lpareto`, $i$'s offer will lie along the dark line connecting these ideal points. Government $i$'s utility is strictly decreasing as it moves along the pareto set toward $j$'s ideal point.^[This observation follows from Lemma `r Ltauj`.]