#Project Computational Epidemiology
#Load EpiEstim
library(EpiEstim)
library(incidence)

#Choose the data and look at it
data(SARS2003)


## estimate the reproduction number (method "non_parametric_si")
res <- estimate_R(SARS2003$incidence, method="non_parametric_si",
                  config = make_config(list(
                    t_start = seq(14, 101),
                    t_end = seq(20, 107),
                    si_distr = SARS2003$si_distr)))
plot(res,"R")
## the plot produced shows, at each each day,
## the estimate of the reproduction number
## over the 7-day window finishing on that day.
