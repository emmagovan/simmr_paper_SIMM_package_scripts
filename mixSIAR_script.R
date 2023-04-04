#MixSIAR script

library(MixSIAR)



mix = load_mix_data(filename = "mix_df.csv",
              iso_names = "iso1",
              fac_random = FALSE,
              factors = "fac",
              fac_nested = FALSE,
              cont_effects = NULL)

source = load_source_data(filename = "source_df.csv",
                          source_factors = NULL,
                          conc_dep = FALSE,
                          data_type = "means",
                          mix)

disc = load_discr_data(filename = "disc_df.csv",
                       mix)

plot_data(filename="isospace_plot", 
          plot_save_pdf = FALSE, 
          plot_save_png = FALSE,
          mix = mix, 
          source = source,
          disc = disc)


model_filename = "MixSIAR_model.txt"   # Name of the JAGS model file

write_JAGS_model(model_filename, 
                 resid_err = FALSE, 
                 process_err = TRUE, 
                 mix, source)

jags.1 = run_model(run="test", 
                   mix, source, disc, 
                   model_filename, 
                   alpha.prior = c(1,1,1), 
                   resid_err = TRUE, 
                   process_err = TRUE)

output_JAGS(jags.1, mix = mix, source = source)

