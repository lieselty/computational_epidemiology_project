################################################################################
#R script for computational epidemiology report, question 3
#Oriane Kopp
################################################################################

#based on  https://cran.r-project.org/web/packages/EpiEstim/vignettes/demo.html 
################################################################################

#load library
library(EpiEstim)

#choose the dataset
data(SARS2003)

################################################################################
#First Estimation of R
################################################################################

## estimate the reproduction number (method "non_parametric_si")
res <- estimate_R(SARS2003$incidence, method="non_parametric_si",
                  config = make_config(list(
                    t_start = seq(14, 101),
                    t_end = seq(20, 107),
                    si_distr = SARS2003$si_distr)))
plot(res,"R")

################################################################################
#Variation of the Assumptions
################################################################################

#change the serial interval by changing the mean
#mean = 2
res_parametric_si <- estimate_R(SARS2003$incidence, 
                                method="parametric_si",
                                config = make_config(list(
                                  mean_si = 2, 
                                  std_si = 3.8,
                                  t_start = seq(14, 101),
                                  t_end = seq(20, 107)))
)
plot(res_parametric_si,"R", legend = FALSE)

#mean and sd of SARS 2003
res_parametric_si <- estimate_R(SARS2003$incidence, 
                                method="parametric_si",
                                config = make_config(list(
                                  mean_si = 8.4, 
                                  std_si = 3.8,
                                  t_start = seq(14, 101),
                                  t_end = seq(20, 107)))
)
plot(res_parametric_si,"R", legend = FALSE)

#mean = 15
res_parametric_si <- estimate_R(SARS2003$incidence, 
                                method="parametric_si",
                                config = make_config(list(
                                  mean_si = 15, 
                                  std_si = 3.8,
                                  t_start = seq(14, 101),
                                  t_end = seq(20, 107)))
)
plot(res_parametric_si,"R", legend = FALSE)

################################################################################
#Estimation of the serial interval
################################################################################

round(discr_si(0:24, mu = 8.4, sigma = 3.8), digits = 3) == SARS2003$si_distr

