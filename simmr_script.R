#simmr script

library(simmr)

#Read in artifical data
y = data.frame(iso1 = c(4, 4.5, 5, 7, 6, 2, 3, 3.5, 5.5, 6.5))
mu_s = matrix(c(-10, 0, 10), ncol = 1, nrow = 3)
sigma_s = matrix(c(1, 1, 1), ncol = 1, nrow = 3)
s_names = c("A", "B", "C")

#Create simmr_in object
simmr_in_1 = simmr_load(
  mixtures = y,
  source_names = s_names,
  source_means = mu_s,
  source_sds = sigma_s) 

#Run model
simmr_out_1 = simmr_mcmc(simmr_in_1)

#Look at convergence
summary(simmr_out_1, type = "diagnostics")

#Plot
plot(simmr_out_1, type = "matrix")
