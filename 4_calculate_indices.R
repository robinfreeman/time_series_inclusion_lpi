###
# This code is for calculating LPIs for combinations of each data set, approach to zero removal, data point removal and capping
###
library(ggplot2)
library(rlpi)

## System LPIs
##TERRESTRIAL
# Using published LPI method settings
setwd("~/rlpi_code/")
Terrestrial_lpiD <- LPIMain('Terrestrial_D_infile.txt', basedir = "Terrestrial_LPID", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, 
                            use_weightings = 1, use_weightings_B = 1, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

setwd("~/rlpi_code_no_conf/")
Terrestrial_lpiD_no_conf <- LPIMain('Terrestrial_D_infile.txt', basedir = "Terrestrial_LPID", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, 
                            use_weightings = 1, use_weightings_B = 1, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

setwd("~/rlpi_code_no_replicates/")
Terrestrial_lpiD_no_reps <- LPIMain('Terrestrial_D_infile.txt', basedir = "Terrestrial_LPID", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, 
                            use_weightings = 1, use_weightings_B = 1, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

setwd("~/rlpi_code_no_replicates_no_conf/")
Terrestrial_lpiD_no_reps_no_conf <- LPIMain('Terrestrial_D_infile.txt', basedir = "Terrestrial_LPID", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, 
                                    use_weightings = 1, use_weightings_B = 1, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

## Zeros removed according to Toszogyova et al method (splitting pops)
setwd("~/rlpi_code_tosz_no_conf/")
file.copy(list.files("~/rlpi_code_no_conf", pattern = "_infile.txt", full.names = T), to = ".")
Terrestrial_lpiD_ToszEtal <- LPIMain('Terrestrial_D_infile.txt', basedir = "Terrestrial_LPID", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, 
                                      use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)
#minimum of 5 data points
Terrestrial_lpiD_ToszEtal_dp5 <- LPIMain('Terrestrial_D_infile.txt', basedir = "Terrestrial_LPID_dp5", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                                          use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)
#minimum of 5 data points and lambdas capped
Terrestrial_lpiD_ToszEtal_dp5_capped <- LPIMain('Terrestrial_D_infile.txt', basedir = "Terrestrial_LPID_dp5_capped", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                                          use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = T, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

## Zeros removed according to Toszogyova et al method (splitting pops): replicates removed
setwd("~/rlpi_code_tosz_no_reps_no_conf/")
file.copy(list.files("~/rlpi_code_no_conf", pattern = "_infile.txt", full.names = T), to = ".")
Terrestrial_lpiD_ToszEtal_noreps <- LPIMain('Terrestrial_D_infile.txt', basedir = "Terrestrial_LPID", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, 
                                      use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

Terrestrial_lpiD_ToszEtal_dp5_noreps <- LPIMain('Terrestrial_D_infile.txt', basedir = "Terrestrial_LPID_dp5", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                                          use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

Terrestrial_lpiD_ToszEtal_dp5_capped_noreps <- LPIMain('Terrestrial_D_infile.txt', basedir = "Terrestrial_LPID_dp5_capped", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                                                 use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = T, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

## Zeros changed to NAs
setwd("~/rlpi_code_zeroToNA_no_conf/")
file.copy(list.files("~/rlpi_code_no_conf", pattern = "_infile.txt", full.names = T), to = ".")
Terrestrial_lpiD_NA <- LPIMain('Terrestrial_D_infile.txt', basedir = "Terrestrial_LPID_NA", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, 
                               use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

Terrestrial_lpiD_NA_dp5 <- LPIMain('Terrestrial_D_infile.txt', basedir = "Terrestrial_LPID_NA_dp5", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                                   use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

Terrestrial_lpiD_NA_dp5_capped <- LPIMain('Terrestrial_D_infile.txt', basedir = "Terrestrial_LPID_NA_dp5_capped", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                                          use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = T, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

# Zeros changed to NAs: replicates removed
setwd("~/rlpi_code_zeroToNA_no_reps_no_conf/")
file.copy(list.files("~/rlpi_code_no_conf", pattern = "_infile.txt", full.names = T), to = ".")
Terrestrial_lpiD_NA_noreps <- LPIMain('Terrestrial_D_infile.txt', basedir = "Terrestrial_LPID_NA", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, 
                               use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

Terrestrial_lpiD_NA_dp5_noreps <- LPIMain('Terrestrial_D_infile.txt', basedir = "Terrestrial_LPID_NA_dp5", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                                   use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

Terrestrial_lpiD_NA_dp5_capped_noreps <- LPIMain('Terrestrial_D_infile.txt', basedir = "Terrestrial_LPID_NA_dp5_capped", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                                          use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = T, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

#change results to dataframe and Year for plotting
Terrestrial_lpiD = as.data.frame(Terrestrial_lpiD)
Terrestrial_lpiD_no_conf = as.data.frame(Terrestrial_lpiD_no_conf)
Terrestrial_lpiD_no_reps = as.data.frame(Terrestrial_lpiD_no_reps)
Terrestrial_lpiD_no_reps_no_conf = as.data.frame(Terrestrial_lpiD_no_reps_no_conf)

Terrestrial_lpiD_ToszEtal = as.data.frame(Terrestrial_lpiD_ToszEtal)
Terrestrial_lpiD_ToszEtal_dp5 = as.data.frame(Terrestrial_lpiD_ToszEtal_dp5)
Terrestrial_lpiD_ToszEtal_dp5_capped = as.data.frame(Terrestrial_lpiD_ToszEtal_dp5_capped)
Terrestrial_lpiD_ToszEtal_noreps = as.data.frame(Terrestrial_lpiD_ToszEtal_noreps)
Terrestrial_lpiD_ToszEtal_dp5_noreps = as.data.frame(Terrestrial_lpiD_ToszEtal_dp5_noreps)
Terrestrial_lpiD_ToszEtal_dp5_capped_noreps = as.data.frame(Terrestrial_lpiD_ToszEtal_dp5_capped_noreps)

Terrestrial_lpiD_NA = as.data.frame(Terrestrial_lpiD_NA)
Terrestrial_lpiD_NA_dp5 = as.data.frame(Terrestrial_lpiD_NA_dp5)
Terrestrial_lpiD_NA_dp5_capped = as.data.frame(Terrestrial_lpiD_NA_dp5_capped)
Terrestrial_lpiD_NA_noreps = as.data.frame(Terrestrial_lpiD_NA_noreps)
Terrestrial_lpiD_NA_dp5_noreps = as.data.frame(Terrestrial_lpiD_NA_dp5_noreps)
Terrestrial_lpiD_NA_dp5_capped_noreps = as.data.frame(Terrestrial_lpiD_NA_dp5_capped_noreps)

Terrestrial_lpiD$Year = as.numeric(rownames(Terrestrial_lpiD))
Terrestrial_lpiD_no_conf$Year = as.numeric(rownames(Terrestrial_lpiD_no_conf))
Terrestrial_lpiD_no_reps$Year = as.numeric(rownames(Terrestrial_lpiD_no_reps))
Terrestrial_lpiD_no_reps_no_conf$Year = as.numeric(rownames(Terrestrial_lpiD_no_reps_no_conf))

Terrestrial_lpiD_NA$Year = as.numeric(rownames(Terrestrial_lpiD_NA))
Terrestrial_lpiD_NA_dp5$Year = as.numeric(rownames(Terrestrial_lpiD_NA_dp5))
Terrestrial_lpiD_NA_dp5_capped$Year = as.numeric(rownames(Terrestrial_lpiD_NA_dp5_capped))
Terrestrial_lpiD_NA_noreps$Year = as.numeric(rownames(Terrestrial_lpiD_NA_noreps))
Terrestrial_lpiD_NA_dp5_noreps$Year = as.numeric(rownames(Terrestrial_lpiD_NA_dp5_noreps))
Terrestrial_lpiD_NA_dp5_capped_noreps$Year = as.numeric(rownames(Terrestrial_lpiD_NA_dp5_capped_noreps))

Terrestrial_lpiD_ToszEtal$Year = as.numeric(rownames(Terrestrial_lpiD_ToszEtal))
Terrestrial_lpiD_ToszEtal_dp5$Year = as.numeric(rownames(Terrestrial_lpiD_ToszEtal_dp5))
Terrestrial_lpiD_ToszEtal_dp5_capped$Year = as.numeric(rownames(Terrestrial_lpiD_ToszEtal_dp5_capped))
Terrestrial_lpiD_ToszEtal_noreps$Year = as.numeric(rownames(Terrestrial_lpiD_ToszEtal_noreps))
Terrestrial_lpiD_ToszEtal_dp5_noreps$Year = as.numeric(rownames(Terrestrial_lpiD_ToszEtal_dp5_noreps))
Terrestrial_lpiD_ToszEtal_dp5_capped_noreps$Year = as.numeric(rownames(Terrestrial_lpiD_ToszEtal_dp5_capped_noreps))

##plot the results
ggplot() + 
  #geom_line(data = Terrestrial_lpiD, aes(x = Year, y = LPI_final, color = "LPI Method (with conf)"), linetype = "solid", linewidth = 2) + 
  geom_line(data = Terrestrial_lpiD_no_conf, aes(x = Year, y = LPI_final, color = "LPI Method"), linetype = "solid", linewidth = 2) + 
  #geom_line(data = Terrestrial_lpiD_no_reps, aes(x = Year, y = LPI_final, color = "LPI Method (with conf)"), linetype = "solid", linewidth = 1) + 
  geom_line(data = Terrestrial_lpiD_no_reps_no_conf, aes(x = Year, y = LPI_final, color = "LPI Method"), linetype = "solid", linewidth = 1) + 
  
  geom_line(data = Terrestrial_lpiD_ToszEtal, aes(x = Year, y = LPI_final, color = "Zeros Removed", linetype = "ToszEtal (with replicates)")) + 
  geom_line(data = Terrestrial_lpiD_ToszEtal_dp5, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5", linetype = "ToszEtal (with replicates)")) + 
  geom_line(data = Terrestrial_lpiD_ToszEtal_dp5_capped, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5 + capping", linetype = "ToszEtal (with replicates)")) + 
  geom_line(data = Terrestrial_lpiD_ToszEtal_noreps, aes(x = Year, y = LPI_final, color = "Zeros Removed", linetype = "ToszEtal (without replicates)")) + 
  geom_line(data = Terrestrial_lpiD_ToszEtal_dp5_noreps, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5", linetype = "ToszEtal (without replicates)")) + 
  geom_line(data = Terrestrial_lpiD_ToszEtal_dp5_capped_noreps, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5 + capping", linetype = "ToszEtal (without replicates)")) + 
  
  geom_line(data = Terrestrial_lpiD_NA, aes(x = Year, y = LPI_final, color = "Zeros Removed", linetype = "NA (with replicates)")) + 
  geom_line(data = Terrestrial_lpiD_NA_dp5, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5", linetype = "NA (with replicates)")) + 
  geom_line(data = Terrestrial_lpiD_NA_dp5_capped, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5 + capping", linetype = "NA (with replicates)")) + 
  geom_line(data = Terrestrial_lpiD_NA_noreps, aes(x = Year, y = LPI_final, color = "Zeros Removed", linetype = "NA (without replicates)")) + 
  geom_line(data = Terrestrial_lpiD_NA_dp5_noreps, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5", linetype = "NA (without replicates)")) + 
  geom_line(data = Terrestrial_lpiD_NA_dp5_capped_noreps, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5 + capping", linetype = "NA (without replicates)")) + 
  
  scale_color_manual(name = "Dataset", values = c(
    "LPI Method" = "#33a02c",
    "LPI Method (with conf)" = "#e31a1c",
    "Zeros Removed" = "#b2df8a",
    "Zeros Removed + dp >= 5" = "#1f78b4",
    "Zeros Removed + dp >= 5 + capping" = "#a6cee3"
  )) + 
  scale_linetype_manual(name = "Zero Removal", values = c(
    "NA (with replicates)" = "solid",
    "ToszEtal (with replicates)" = "dashed",
    "ToszEtal (without replicates)" = "dotdash",
    "NA (without replicates)" = "dotted"
  )) + 
  theme_bw() + 
  labs(y = "Index value (1970 = 1.0)", title = "Terrestrial")+
  ylab("Index value (1970 = 1.0)")
  
setwd("~/Figures")
ggsave("~/Figures/terr_trends_compare_ToszEtal_no_conf.pdf", width = 12, height = 8)
ggsave("~/Figures/terr_trends_compare_ToszEtal_no_conf.png", width = 12, height = 8)

###FRESHWATER
## Running published LPI method
setwd("~/rlpi_code/")
Freshwater_lpiD <- LPIMain('Freshwater_D_infile.txt', basedir = "Freshwater_LPID", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 100, 
                           use_weightings = 1, use_weightings_B = 1, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

setwd("~/rlpi_code_no_conf/")
Freshwater_lpiD_no_conf <- LPIMain('Freshwater_D_infile.txt', basedir = "Freshwater_LPID", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 100, 
                           use_weightings = 1, use_weightings_B = 1, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)


setwd("~/rlpi_code_no_replicates/")
Freshwater_lpiD_no_reps <- LPIMain('Freshwater_D_infile.txt', basedir = "Freshwater_LPID", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, 
                                    use_weightings = 1, use_weightings_B = 1, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

setwd("~/rlpi_code_no_replicates_no_conf/")
Freshwater_lpiD_no_reps_no_conf <- LPIMain('Freshwater_D_infile.txt', basedir = "Freshwater_LPID", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, 
                                   use_weightings = 1, use_weightings_B = 1, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

# Zeros removed according to Toszogyova et al method (splitting pops)
setwd("~/rlpi_code_tosz_no_conf/")
Freshwater_lpiD_ToszEtal <- LPIMain('Freshwater_D_infile.txt', basedir = "Freshwater_LPID", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, 
                                      use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

Freshwater_lpiD_ToszEtal_dp5 <- LPIMain('Freshwater_D_infile.txt', basedir = "Freshwaterl_LPID_dp5", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                                          use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

Freshwater_lpiD_ToszEtal_dp5_capped <- LPIMain('Freshwater_D_infile.txt', basedir = "Freshwater_LPID_dp5_capped", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                                                 use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = T, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

# Zeros removed according to Toszogyova et al method (splitting pops): replicates removed
setwd("~/rlpi_code_tosz_no_reps_no_conf/")
Freshwater_lpiD_ToszEtal_noreps <- LPIMain('Freshwater_D_infile.txt', basedir = "Freshwater_LPID", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, 
                                     use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

Freshwater_lpiD_ToszEtal_dp5_noreps <- LPIMain('Freshwater_D_infile.txt', basedir = "Freshwaterl_LPID_dp5", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                                         use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

Freshwater_lpiD_ToszEtal_dp5_capped_noreps <- LPIMain('Freshwater_D_infile.txt', basedir = "Freshwater_LPID_dp5_capped", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                                                use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = T, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)


## Zeros changed to NAs
setwd("~/rlpi_code_zeroToNA_no_conf/")
Freshwater_lpiD_NA <- LPIMain('Freshwater_D_infile.txt', basedir = "Freshwater_LPID_NA", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, 
                               use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

Freshwater_lpiD_NA_dp5 <- LPIMain('Freshwater_D_infile.txt', basedir = "Freshwater_LPID_NA_dp5", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                                   use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

Freshwater_lpiD_NA_dp5_capped <- LPIMain('Freshwater_D_infile.txt', basedir = "Freshwater_LPID_NA_dp5_capped", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                                          use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = T, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)
# Zeros changed to NAs: replicates removed
setwd("~/rlpi_code_zeroToNA_no_reps_no_conf/")
Freshwater_lpiD_NA_noreps <- LPIMain('Freshwater_D_infile.txt', basedir = "Freshwater_LPID_NA", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, 
                              use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

Freshwater_lpiD_NA_dp5_noreps <- LPIMain('Freshwater_D_infile.txt', basedir = "Freshwater_LPID_NA_dp5", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                                  use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

Freshwater_lpiD_NA_dp5_capped_noreps <- LPIMain('Freshwater_D_infile.txt', basedir = "Freshwater_LPID_NA_dp5_capped", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                                         use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = T, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

#change results to dataframe and Year for plotting
Freshwater_lpiD = as.data.frame(Freshwater_lpiD)
Freshwater_lpiD_no_conf = as.data.frame(Freshwater_lpiD_no_conf)
Freshwater_lpiD_no_reps = as.data.frame(Freshwater_lpiD_no_reps)
Freshwater_lpiD_no_reps_no_conf = as.data.frame(Freshwater_lpiD_no_reps_no_conf)

Freshwater_lpiD_ToszEtal = as.data.frame(Freshwater_lpiD_ToszEtal)
Freshwater_lpiD_ToszEtal_dp5 = as.data.frame(Freshwater_lpiD_ToszEtal_dp5)
Freshwater_lpiD_ToszEtal_dp5_capped = as.data.frame(Freshwater_lpiD_ToszEtal_dp5_capped)
Freshwater_lpiD_ToszEtal_noreps = as.data.frame(Freshwater_lpiD_ToszEtal_noreps)
Freshwater_lpiD_ToszEtal_dp5_noreps = as.data.frame(Freshwater_lpiD_ToszEtal_dp5_noreps)
Freshwater_lpiD_ToszEtal_dp5_capped_noreps = as.data.frame(Freshwater_lpiD_ToszEtal_dp5_capped_noreps)

Freshwater_lpiD_NA = as.data.frame(Freshwater_lpiD_NA)
Freshwater_lpiD_NA_dp5 = as.data.frame(Freshwater_lpiD_NA_dp5)
Freshwater_lpiD_NA_dp5_capped = as.data.frame(Freshwater_lpiD_NA_dp5_capped)
Freshwater_lpiD_NA_noreps = as.data.frame(Freshwater_lpiD_NA_noreps)
Freshwater_lpiD_NA_dp5_noreps = as.data.frame(Freshwater_lpiD_NA_dp5_noreps)
Freshwater_lpiD_NA_dp5_capped_noreps = as.data.frame(Freshwater_lpiD_NA_dp5_capped_noreps)

Freshwater_lpiD$Year = as.numeric(rownames(Freshwater_lpiD))
Freshwater_lpiD_no_conf$Year = as.numeric(rownames(Freshwater_lpiD_no_conf))
Freshwater_lpiD_no_reps$Year = as.numeric(rownames(Freshwater_lpiD_no_reps))
Freshwater_lpiD_no_reps_no_conf$Year = as.numeric(rownames(Freshwater_lpiD_no_reps_no_conf))

Freshwater_lpiD_NA$Year = as.numeric(rownames(Freshwater_lpiD_NA))
Freshwater_lpiD_NA_dp5$Year = as.numeric(rownames(Freshwater_lpiD_NA_dp5))
Freshwater_lpiD_NA_dp5_capped$Year = as.numeric(rownames(Freshwater_lpiD_NA_dp5_capped))
Freshwater_lpiD_NA_noreps$Year = as.numeric(rownames(Freshwater_lpiD_NA_noreps))
Freshwater_lpiD_NA_dp5_noreps$Year = as.numeric(rownames(Freshwater_lpiD_NA_dp5_noreps))
Freshwater_lpiD_NA_dp5_capped_noreps$Year = as.numeric(rownames(Freshwater_lpiD_NA_dp5_capped_noreps))

Freshwater_lpiD_ToszEtal$Year = as.numeric(rownames(Freshwater_lpiD_ToszEtal))
Freshwater_lpiD_ToszEtal_dp5$Year = as.numeric(rownames(Freshwater_lpiD_ToszEtal_dp5))
Freshwater_lpiD_ToszEtal_dp5_capped$Year = as.numeric(rownames(Freshwater_lpiD_ToszEtal_dp5_capped))
Freshwater_lpiD_ToszEtal_noreps$Year = as.numeric(rownames(Freshwater_lpiD_ToszEtal_noreps))
Freshwater_lpiD_ToszEtal_dp5_noreps$Year = as.numeric(rownames(Freshwater_lpiD_ToszEtal_dp5_noreps))
Freshwater_lpiD_ToszEtal_dp5_capped_noreps$Year = as.numeric(rownames(Freshwater_lpiD_ToszEtal_dp5_capped_noreps))

##Plot the results
ggplot() + 
  #geom_line(data = Freshwater_lpiD, aes(x = Year, y = LPI_final, color = "LPI Method (with conf)"), linetype = "solid", linewidth = 2) +
  geom_line(data = Freshwater_lpiD_no_conf, aes(x = Year, y = LPI_final, color = "LPI Method"), linetype = "solid", linewidth = 2) +
  #geom_line(data = Freshwater_lpiD_no_reps, aes(x = Year, y = LPI_final, color = "LPI Method (with conf)"), linetype = "solid", linewidth = 1) +
  geom_line(data = Freshwater_lpiD_no_reps_no_conf, aes(x = Year, y = LPI_final, color = "LPI Method"), linetype = "solid", linewidth = 1) + 
  
  geom_line(data = Freshwater_lpiD_ToszEtal, aes(x = Year, y = LPI_final, color = "Zeros Removed", linetype = "ToszEtal (with replicates)")) + 
  geom_line(data = Freshwater_lpiD_ToszEtal_dp5, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5", linetype = "ToszEtal (with replicates)")) + 
  geom_line(data = Freshwater_lpiD_ToszEtal_dp5_capped, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5 + capping", linetype = "ToszEtal (with replicates)")) + 
  geom_line(data = Freshwater_lpiD_ToszEtal_noreps, aes(x = Year, y = LPI_final, color = "Zeros Removed", linetype = "ToszEtal (without replicates)")) + 
  geom_line(data = Freshwater_lpiD_ToszEtal_dp5_noreps, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5", linetype = "ToszEtal (without replicates)")) + 
  geom_line(data = Freshwater_lpiD_ToszEtal_dp5_capped_noreps, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5 + capping", linetype = "ToszEtal (without replicates)")) + 
  
  geom_line(data = Freshwater_lpiD_NA, aes(x = Year, y = LPI_final, color = "Zeros Removed", linetype = "NA (with replicates)")) + 
  geom_line(data = Freshwater_lpiD_NA_dp5, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5", linetype = "NA (with replicates)")) + 
  geom_line(data = Freshwater_lpiD_NA_dp5_capped, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5 + capping", linetype = "NA (with replicates)")) + 
  geom_line(data = Freshwater_lpiD_NA_noreps, aes(x = Year, y = LPI_final, color = "Zeros Removed", linetype = "NA (without replicates)")) + 
  geom_line(data = Freshwater_lpiD_NA_dp5_noreps, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5", linetype = "NA (without replicates)")) + 
  geom_line(data = Freshwater_lpiD_NA_dp5_capped_noreps, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5 + capping", linetype = "NA (without replicates)")) + 
  
  scale_color_manual(name = "Dataset", values = c(
    "LPI Method" = "#33a02c",
    "LPI Method (with conf)" = "#e31a1c",
    "Zeros Removed" = "#b2df8a",
    "Zeros Removed + dp >= 5" = "#1f78b4",
    "Zeros Removed + dp >= 5 + capping" = "#a6cee3"
  )) + 
  scale_linetype_manual(name = "Zero Removal", values = c(
    "NA (with replicates)" = "solid",
    "ToszEtal (with replicates)" = "dashed",
    "ToszEtal (without replicates)" = "dotdash",
    "NA (without replicates)" = "dotted"
  )) + 
theme_bw()+ 
  labs(title = "Freshwater")+
  ylab("Index value (1970 = 1.0)")

setwd("~/Figures/")
ggsave("~/Figures/freshwater_trends_compare_ToszEtal_no_conf.pdf", width = 12, height = 8)
ggsave("~/Figures/freshwater_trends_compare_ToszEtal_no_conf.png", width = 12, height = 8)


##MARINE
##Run published LPI method
setwd("~/rlpi_code/")
Marine_lpiD <- LPIMain('marine_infile.txt', basedir = "Marine_LPID", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 100, 
                       use_weightings = 1, use_weightings_B = 1, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

setwd("~/rlpi_code_no_conf/")
Marine_lpiD_no_conf <- LPIMain('marine_infile.txt', basedir = "Marine_LPID", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 100, 
                       use_weightings = 1, use_weightings_B = 1, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

setwd("~/rlpi_code_no_replicates/")
Marine_lpiD_no_reps <- LPIMain('marine_infile.txt', basedir = "Marine_LPID", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, 
                                   use_weightings = 1, use_weightings_B = 1, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

setwd("~/rlpi_code_no_replicates_no_conf/")
Marine_lpiD_no_reps_no_conf <- LPIMain('marine_infile.txt', basedir = "Marine_LPID", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, 
                               use_weightings = 1, use_weightings_B = 1, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

##Zeros removed according to Toszogyova et al method (splitting pops)
setwd("~/rlpi_code_tosz_no_conf/")
Marine_lpiD_ToszEtal <- LPIMain('marine_infile.txt', basedir = "Marine_LPID", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, 
                                     use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

Marine_lpiD_ToszEtal_dp5 <- LPIMain('marine_infile.txt', basedir = "Marine_LPID_dp5", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                                         use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

Marine_lpiD_ToszEtal_dp5_capped <- LPIMain('marine_infile.txt', basedir = "Marine_LPID_dp5_capped", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                                                use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = T, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)
#Zeros removed according to Toszogyova et al method (splitting pops): replicates removed
setwd("~/rlpi_code_tosz_no_reps_no_conf/")
Marine_lpiD_ToszEtal_noreps <- LPIMain('marine_infile.txt', basedir = "Marine_LPID", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, 
                                 use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

Marine_lpiD_ToszEtal_dp5_noreps <- LPIMain('marine_infile.txt', basedir = "Marine_LPID_dp5", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                                     use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

Marine_lpiD_ToszEtal_dp5_capped_noreps <- LPIMain('marine_infile.txt', basedir = "Marine_LPID_dp5_capped", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                                            use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = T, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

## Zeros changed to NAs
setwd("~/rlpi_code_zeroToNA_no_conf//")
Marine_lpiD_NA <- LPIMain('marine_infile.txt', basedir = "Marine_LPID_NA", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, 
                          use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

Marine_lpiD_NA_dp5 <- LPIMain('marine_infile.txt', basedir = "Marine_LPID_NA_dp5", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                              use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

Marine_lpiD_NA_dp5_capped <- LPIMain('marine_infile.txt', basedir = "Marine_LPID_NA_dp5_capped", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                                     use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = T, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)
# Zeros changed to NAs: replicates removed
setwd("~/rlpi_code_zeroToNA_no_reps_no_conf/")
Marine_lpiD_NA_noreps <- LPIMain('marine_infile.txt', basedir = "Marine_LPID_NA", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, 
                          use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

Marine_lpiD_NA_dp5_noreps <- LPIMain('marine_infile.txt', basedir = "Marine_LPID_NA_dp5", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                              use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

Marine_lpiD_NA_dp5_capped_noreps <- LPIMain('marine_infile.txt', basedir = "Marine_LPID_NA_dp5_capped", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                                     use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = T, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

#change results to dataframe and Year for plotting
Marine_lpiD = as.data.frame(Marine_lpiD)
Marine_lpiD_no_conf = as.data.frame(Marine_lpiD_no_conf)
Marine_lpiD_no_reps = as.data.frame(Marine_lpiD_no_reps)
Marine_lpiD_no_reps_no_conf = as.data.frame(Marine_lpiD_no_reps_no_conf)

Marine_lpiD_ToszEtal = as.data.frame(Marine_lpiD_ToszEtal)
Marine_lpiD_ToszEtal_dp5 = as.data.frame(Marine_lpiD_ToszEtal_dp5)
Marine_lpiD_ToszEtal_dp5_capped = as.data.frame(Marine_lpiD_ToszEtal_dp5_capped)
Marine_lpiD_ToszEtal_noreps = as.data.frame(Marine_lpiD_ToszEtal_noreps)
Marine_lpiD_ToszEtal_dp5_noreps = as.data.frame(Marine_lpiD_ToszEtal_dp5_noreps)
Marine_lpiD_ToszEtal_dp5_capped_noreps = as.data.frame(Marine_lpiD_ToszEtal_dp5_capped_noreps)

Marine_lpiD_NA = as.data.frame(Marine_lpiD_NA)
Marine_lpiD_NA_dp5 = as.data.frame(Marine_lpiD_NA_dp5)
Marine_lpiD_NA_dp5_capped = as.data.frame(Marine_lpiD_NA_dp5_capped)
Marine_lpiD_NA_noreps = as.data.frame(Marine_lpiD_NA_noreps)
Marine_lpiD_NA_dp5_noreps = as.data.frame(Marine_lpiD_NA_dp5_noreps)
Marine_lpiD_NA_dp5_capped_noreps = as.data.frame(Marine_lpiD_NA_dp5_capped_noreps)

Marine_lpiD$Year = as.numeric(rownames(Marine_lpiD))
Marine_lpiD_no_conf$Year = as.numeric(rownames(Marine_lpiD_no_conf))
Marine_lpiD_no_reps$Year = as.numeric(rownames(Marine_lpiD_no_reps))
Marine_lpiD_no_reps_no_conf$Year = as.numeric(rownames(Marine_lpiD_no_reps_no_conf))

Marine_lpiD_NA$Year = as.numeric(rownames(Marine_lpiD_NA))
Marine_lpiD_NA_dp5$Year = as.numeric(rownames(Marine_lpiD_NA_dp5))
Marine_lpiD_NA_dp5_capped$Year = as.numeric(rownames(Marine_lpiD_NA_dp5_capped))
Marine_lpiD_NA_noreps$Year = as.numeric(rownames(Marine_lpiD_NA_noreps))
Marine_lpiD_NA_dp5_noreps$Year = as.numeric(rownames(Marine_lpiD_NA_dp5_noreps))
Marine_lpiD_NA_dp5_capped_noreps$Year = as.numeric(rownames(Marine_lpiD_NA_dp5_capped_noreps))

Marine_lpiD_ToszEtal$Year = as.numeric(rownames(Marine_lpiD_ToszEtal))
Marine_lpiD_ToszEtal_dp5$Year = as.numeric(rownames(Marine_lpiD_ToszEtal_dp5))
Marine_lpiD_ToszEtal_dp5_capped$Year = as.numeric(rownames(Marine_lpiD_ToszEtal_dp5_capped))
Marine_lpiD_ToszEtal_noreps$Year = as.numeric(rownames(Marine_lpiD_ToszEtal_noreps))
Marine_lpiD_ToszEtal_dp5_noreps$Year = as.numeric(rownames(Marine_lpiD_ToszEtal_dp5_noreps))
Marine_lpiD_ToszEtal_dp5_capped_noreps$Year = as.numeric(rownames(Marine_lpiD_ToszEtal_dp5_capped_noreps))

## plot the results
ggplot() + 
  #geom_line(data = Marine_lpiD, aes(x = Year, y = LPI_final, color = "LPI Method (with conf)"), linetype = "solid", linewidth = 2) + 
  geom_line(data = Marine_lpiD_no_conf, aes(x = Year, y = LPI_final, color = "LPI Method"), linetype = "solid", linewidth = 2) + 
  #geom_line(data = Marine_lpiD_no_reps, aes(x = Year, y = LPI_final, color = "LPI Method (with conf)"), linetype = "solid", linewidth = 1) + 
  geom_line(data = Marine_lpiD_no_reps_no_conf, aes(x = Year, y = LPI_final, color = "LPI Method"), linetype = "solid", linewidth = 1) + 
  
  geom_line(data = Marine_lpiD_ToszEtal, aes(x = Year, y = LPI_final, color = "Zeros Removed", linetype = "ToszEtal (with replicates)")) + 
  geom_line(data = Marine_lpiD_ToszEtal_dp5, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5", linetype = "ToszEtal (with replicates)")) + 
  geom_line(data = Marine_lpiD_ToszEtal_dp5_capped, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5 + capping", linetype = "ToszEtal (with replicates)")) + 
  geom_line(data = Marine_lpiD_ToszEtal_noreps, aes(x = Year, y = LPI_final, color = "Zeros Removed", linetype = "ToszEtal (without replicates)")) + 
  geom_line(data = Marine_lpiD_ToszEtal_dp5_noreps, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5", linetype = "ToszEtal (without replicates)")) + 
  geom_line(data = Marine_lpiD_ToszEtal_dp5_capped_noreps, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5 + capping", linetype = "ToszEtal (without replicates)")) + 
  
  geom_line(data = Marine_lpiD_NA, aes(x = Year, y = LPI_final, color = "Zeros Removed", linetype = "NA (with replicates)")) + 
  geom_line(data = Marine_lpiD_NA_dp5, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5", linetype = "NA (with replicates)")) + 
  geom_line(data = Marine_lpiD_NA_dp5_capped, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5 + capping", linetype = "NA (with replicates)")) + 
  geom_line(data = Marine_lpiD_NA_noreps, aes(x = Year, y = LPI_final, color = "Zeros Removed", linetype = "NA (without replicates)")) + 
  geom_line(data = Marine_lpiD_NA_dp5_noreps, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5", linetype = "NA (without replicates)")) + 
  geom_line(data = Marine_lpiD_NA_dp5_capped_noreps, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5 + capping", linetype = "NA (without replicates)")) + 
  scale_color_manual(name = "Dataset", values = c(
    "LPI Method" = "#33a02c",
    "LPI Method (with conf)" = "#e31a1c",
    "Zeros Removed" = "#b2df8a",
    "Zeros Removed + dp >= 5" = "#1f78b4",
    "Zeros Removed + dp >= 5 + capping" = "#a6cee3"
  )) + 
  scale_linetype_manual(name = "Zero Removal", values = c(
    "NA (with replicates)" = "solid",
    "ToszEtal (with replicates)" = "dashed",
    "ToszEtal (without replicates)" = "dotdash",
    "NA (without replicates)" = "dotted"
  )) + 
  scale_x_continuous(limits = c(1970, 2015)) + 
theme_bw() + 
  labs(title = "Marine")+
  ylab("Index value (1970 = 1.0)")

setwd("~/Figures/")
ggsave("~/Figures/marine_trends_compare_ToszEtal_no_conf.pdf", width = 12, height = 8)
ggsave("~/Figures/marine_trends_compare_ToszEtal_no_conf.png", width = 12, height = 8)

## Global
##Apply published LPI method
setwd("~/rlpi_code/")
Global_lpiD <- LPIMain('global_infile.txt', basedir = "Global_LPID", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 100, 
                       use_weightings = 1, use_weightings_B = 1, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

setwd("~/rlpi_code_no_conf/")
Global_lpiD_no_conf <- LPIMain('global_infile.txt', basedir = "Global_LPID", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 100, 
                       use_weightings = 1, use_weightings_B = 1, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

setwd("~/rlpi_code_no_replicates/")
Global_lpiD_no_reps <- LPIMain('global_infile.txt', basedir = "Global_LPID", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, 
                               use_weightings = 1, use_weightings_B = 1, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

setwd("~/rlpi_code_no_replicates_no_conf/")
Global_lpiD_no_reps_no_conf <- LPIMain('global_infile.txt', basedir = "Global_LPID", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, 
                                       use_weightings = 1, use_weightings_B = 1, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

#Global_lpiD_dp5 <- LPIMain('global_infile.txt', basedir = "Global_LPID_dp5", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 100, DATA_LENGTH_MIN = 5,
                       #use_weightings = 1, use_weightings_B = 1, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

## Zeros removed according to Toszgoyova et al method (splitting pops)
setwd("~/rlpi_code_tosz_no_conf/")
Global_lpiD_ToszEtal <- LPIMain('global_infile.txt', basedir = "Global_LPID", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, 
                                 use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

Global_lpiD_ToszEtal_dp5 <- LPIMain('global_infile.txt', basedir = "Global_LPID_dp5", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                                     use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

Global_lpiD_ToszEtal_dp5_capped <- LPIMain('global_infile.txt', basedir = "Global_LPID_dp5_capped", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                                            use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = T, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

# Zeros removed according to Toszgoyova et al method (splitting pops): replicates removed
setwd("~/rlpi_code_tosz_no_reps_no_conf/")
Global_lpiD_ToszEtal_noreps <- LPIMain('global_infile.txt', basedir = "Global_LPID", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, 
                                 use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

Global_lpiD_ToszEtal_dp5_noreps <- LPIMain('global_infile.txt', basedir = "Global_LPID_dp5", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                                     use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

Global_lpiD_ToszEtal_dp5_capped_noreps <- LPIMain('global_infile.txt', basedir = "Global_LPID_dp5_capped", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                                            use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = T, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)


## Zeros changed to NAs
setwd("~/rlpi_code_zeroToNA_no_conf")
Global_lpiD_NA <- LPIMain('global_infile.txt', basedir = "Global_LPID_NA", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, 
                          use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

Global_lpiD_NA_dp5 <- LPIMain('global_infile.txt', basedir = "Global_LPID_NA_dp5", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                              use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

Global_lpiD_NA_dp5_capped <- LPIMain('global_infile.txt', basedir = "Global_LPID_NA_dp5_capped", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                                     use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = T, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

# Zeros changed to NAs: replicates removed
setwd("~/rlpi_code_zeroToNA_no_reps_no_conf")
Global_lpiD_NA_noreps <- LPIMain('global_infile.txt', basedir = "Global_LPID_NA", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, 
                          use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

Global_lpiD_NA_dp5_noreps <- LPIMain('global_infile.txt', basedir = "Global_LPID_NA_dp5", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                              use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

Global_lpiD_NA_dp5_capped_noreps <- LPIMain('global_infile.txt', basedir = "Global_LPID_NA_dp5_capped", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                                     use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = T, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

#change results to dataframe and Year for plotting
Global_lpiD = as.data.frame(Global_lpiD)
Global_lpiD_no_conf = as.data.frame(Global_lpiD_no_conf)
Global_lpiD_no_reps = as.data.frame(Global_lpiD_no_reps)
Global_lpiD_no_reps_no_conf = as.data.frame(Global_lpiD_no_reps_no_conf)

Global_lpiD_ToszEtal = as.data.frame(Global_lpiD_ToszEtal)
Global_lpiD_ToszEtal_dp5 = as.data.frame(Global_lpiD_ToszEtal_dp5)
Global_lpiD_ToszEtal_dp5_capped = as.data.frame(Global_lpiD_ToszEtal_dp5_capped)
Global_lpiD_ToszEtal_noreps = as.data.frame(Global_lpiD_ToszEtal_noreps)
Global_lpiD_ToszEtal_dp5_noreps = as.data.frame(Global_lpiD_ToszEtal_dp5_noreps)
Global_lpiD_ToszEtal_dp5_capped_noreps = as.data.frame(Global_lpiD_ToszEtal_dp5_capped_noreps)

Global_lpiD_NA = as.data.frame(Global_lpiD_NA)
Global_lpiD_NA_dp5 = as.data.frame(Global_lpiD_NA_dp5)
Global_lpiD_NA_dp5_capped = as.data.frame(Global_lpiD_NA_dp5_capped)
Global_lpiD_NA_noreps = as.data.frame(Global_lpiD_NA_noreps)
Global_lpiD_NA_dp5_noreps = as.data.frame(Global_lpiD_NA_dp5_noreps)
Global_lpiD_NA_dp5_capped_noreps = as.data.frame(Global_lpiD_NA_dp5_capped_noreps)

Global_lpiD$Year = as.numeric(rownames(Global_lpiD))
Global_lpiD_no_conf$Year = as.numeric(rownames(Global_lpiD_no_conf))
Global_lpiD_no_reps$Year = as.numeric(rownames(Global_lpiD_no_reps))
Global_lpiD_no_reps_no_conf$Year = as.numeric(rownames(Global_lpiD_no_reps_no_conf))

Global_lpiD_NA$Year = as.numeric(rownames(Global_lpiD_NA))
Global_lpiD_NA_dp5$Year = as.numeric(rownames(Global_lpiD_NA_dp5))
Global_lpiD_NA_dp5_capped$Year = as.numeric(rownames(Global_lpiD_NA_dp5_capped))
Global_lpiD_NA_noreps$Year = as.numeric(rownames(Global_lpiD_NA_noreps))
Global_lpiD_NA_dp5_noreps$Year = as.numeric(rownames(Global_lpiD_NA_dp5_noreps))
Global_lpiD_NA_dp5_capped_noreps$Year = as.numeric(rownames(Global_lpiD_NA_dp5_capped_noreps))

Global_lpiD_ToszEtal$Year = as.numeric(rownames(Global_lpiD_ToszEtal))
Global_lpiD_ToszEtal_dp5$Year = as.numeric(rownames(Global_lpiD_ToszEtal_dp5))
Global_lpiD_ToszEtal_dp5_capped$Year = as.numeric(rownames(Global_lpiD_ToszEtal_dp5_capped))
Global_lpiD_ToszEtal_noreps$Year = as.numeric(rownames(Global_lpiD_ToszEtal_noreps))
Global_lpiD_ToszEtal_dp5_noreps$Year = as.numeric(rownames(Global_lpiD_ToszEtal_dp5_noreps))
Global_lpiD_ToszEtal_dp5_capped_noreps$Year = as.numeric(rownames(Global_lpiD_ToszEtal_dp5_capped_noreps))

#plot the results
ggplot() + 
  #geom_line(data = Global_lpiD, aes(x = Year, y = LPI_final, color = "LPI Method (with conf)"), linetype = "solid", linewidth = 2) + 
  geom_line(data = Global_lpiD_no_conf, aes(x = Year, y = LPI_final, color = "LPI Method"), linetype = "solid", linewidth = 2) + 
  #geom_line(data = Global_lpiD_no_reps, aes(x = Year, y = LPI_final, color = "LPI Method (with conf)"), linetype = "solid", linewidth = 1) + 
  geom_line(data = Global_lpiD_no_reps_no_conf, aes(x = Year, y = LPI_final, color = "LPI Method"), linetype = "solid", linewidth = 1) + 
  #geom_line(data = Global_lpiD_dp5, aes(x = Year, y = LPI_final, color = "LPI Method + dp >= 5"), linetype = "solid", linewidth = 1) + 
  
  #geom_line(data = Global_lpiD_no_reps, aes(x = Year, y = LPI_final, color = "LPI Method"), linetype = "dotted", linewidth = 1) + 
  
  geom_line(data = Global_lpiD_ToszEtal, aes(x = Year, y = LPI_final, color = "Zeros Removed", linetype = "ToszEtal (with replicates)")) + 
  geom_line(data = Global_lpiD_ToszEtal_dp5, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5", linetype = "ToszEtal (with replicates)")) + 
  geom_line(data = Global_lpiD_ToszEtal_dp5_capped, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5 + capping", linetype = "ToszEtal (with replicates)")) + 
  geom_line(data = Global_lpiD_ToszEtal_noreps, aes(x = Year, y = LPI_final, color = "Zeros Removed", linetype = "ToszEtal (without replicates)")) + 
  geom_line(data = Global_lpiD_ToszEtal_dp5_noreps, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5", linetype = "ToszEtal (without replicates)")) + 
  geom_line(data = Global_lpiD_ToszEtal_dp5_capped_noreps, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5 + capping", linetype = "ToszEtal (without replicates)")) + 
  
  geom_line(data = Global_lpiD_NA, aes(x = Year, y = LPI_final, color = "Zeros Removed", linetype = "NA (with replicates)")) + 
  geom_line(data = Global_lpiD_NA_dp5, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5", linetype = "NA (with replicates)")) + 
  geom_line(data = Global_lpiD_NA_dp5_capped, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5 + capping", linetype = "NA (with replicates)")) + 
  geom_line(data = Global_lpiD_NA_noreps, aes(x = Year, y = LPI_final, color = "Zeros Removed", linetype = "NA (without replicates)")) + 
  geom_line(data = Global_lpiD_NA_dp5_noreps, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5", linetype = "NA (without replicates)")) + 
  geom_line(data = Global_lpiD_NA_dp5_capped_noreps, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5 + capping", linetype = "NA (without replicates)")) + 
  
  scale_color_manual(name = "Dataset", values = c(
    "LPI Method" = "#33a02c",
    "LPI Method (with conf)" = "#e31a1c",
    "LPI Method + dp >= 5" = "#33a02c",
    "Zeros Removed" = "#b2df8a",
    "Zeros Removed + dp >= 5" = "#1f78b4",
    "Zeros Removed + dp >= 5 + capping" = "#a6cee3"
  )) + 
  scale_linetype_manual(name = "Zero Removal", values = c(
    "NA (with replicates)" = "solid",
    "ToszEtal (with replicates)" = "dashed",
    "ToszEtal (without replicates)" = "dotdash",
    "NA (without replicates)" = "dotted"
  )) + 
theme_bw()+ 
  labs(title = "Global")+
  ylab("Index value (1970 = 1.0)")

setwd("~/Figures/")
ggsave("~/Figures/global_trends_compare_ToszEtal_no_conf.pdf", width = 12, height = 8)
ggsave("~/Figures/global_trends_compare_ToszEtal_no_conf.png", width = 12, height = 8)

##Plot simplified version for manuscript
ggplot() + 
  geom_line(data = Global_lpiD_no_conf, aes(x = Year, y = LPI_final, color = "LPI Method"), linetype = "solid", linewidth = 2) + 
  #geom_line(data = Global_lpiD_dp5, aes(x = Year, y = LPI_final, color = "LPI Method (dp >= 5)"), linetype = "solid", linewidth = 1) + 
  
  geom_line(data = Global_lpiD_ToszEtal, aes(x = Year, y = LPI_final, color = "Zeros Removed", linetype = "ToszEtal (with replicates)"), linewidth = 1) + 
  geom_line(data = Global_lpiD_ToszEtal_dp5, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5", linetype = "ToszEtal (with replicates)"), linewidth = 1) + 
  geom_line(data = Global_lpiD_ToszEtal_dp5_capped, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5 + capping", linetype = "ToszEtal (with replicates)"), linewidth = 1) + 
  
  geom_line(data = Global_lpiD_NA, aes(x = Year, y = LPI_final, color = "Zeros Removed", linetype = "NA (with replicates)"), linewidth = 1) + 
  geom_line(data = Global_lpiD_NA_dp5, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5", linetype = "NA (with replicates)"), linewidth = 1) + 
  geom_line(data = Global_lpiD_NA_dp5_capped, aes(x = Year, y = LPI_final, color = "Zeros Removed + dp >= 5 + capping", linetype = "NA (with replicates)"), linewidth = 1) + 
  scale_color_manual(name = "Dataset", values = c(
    "LPI Method" = "#33a02c",
    "LPI Method (dp >= 5)" = "#33a02c",
    "Zeros Removed" = "#b2df8a",
    "Zeros Removed + dp >= 5" = "#1f78b4",
    "Zeros Removed + dp >= 5 + capping" = "#a6cee3"
  )) + 
  scale_linetype_manual(name = "Zero Removal", values = c(
    "NA (with replicates)" = "solid",
    "ToszEtal (with replicates)" = "dashed"
  )) + 
  theme_bw() + 
  theme(legend.key.width = unit(1.25, units = "cm")) + 
  labs(title = "Global")+
  ylab("Index value (1970 = 1.0)")

ggsave("~/Figures/global_trends_compare_ToszEtal_simplified_no_conf.pdf", width = 12, height = 8)
ggsave("~/Figures/global_trends_compare_ToszEtal_simplified_no_conf.png", width = 12, height = 8)

#############
#############
##Global - calculate LPIs with zeros removed according to position
setwd("~/rlpi_code_tosz_no_end_no_conf/")
file.copy(list.files("~/rlpi_code_no_conf", pattern = "_infile.txt", full.names = T), to = ".")
Global_lpiD_ToszEtal_no_end <- LPIMain('global_infile.txt', basedir = "Global_LPID_no_end", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, 
                                use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)
 
Global_lpiD_ToszEtal_dp5_no_end <- LPIMain('global_infile.txt', basedir = "Global_LPID_no_end_dp5", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                                            use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)
 
 
setwd("~/rlpi_code_tosz_no_mid_no_conf/")
file.copy(list.files("~/rlpi_code_no_conf", pattern = "_infile.txt", full.names = T), to = ".")
Global_lpiD_ToszEtal_no_mid <- LPIMain('global_infile.txt', basedir = "Global_LPID_no_mid", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, 
                                          use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)

Global_lpiD_ToszEtal_dp5_no_mid <- LPIMain('global_infile.txt', basedir = "Global_LPID_no_mid_dp5", PLOT_MAX = 2015, BOOT_STRAP_SIZE = 1, DATA_LENGTH_MIN = 5,
                                              use_weightings = T, use_weightings_B = T, CAP_LAMBDAS = F, save_plots = 0, plot_lpi = 0, VERBOSE = F, CI_FLAG = 0)
##Change results to dataframe for plotting
Global_lpiD_ToszEtal_no_end = as.data.frame(Global_lpiD_ToszEtal_no_end)
Global_lpiD_ToszEtal_dp5_no_end = as.data.frame(Global_lpiD_ToszEtal_dp5_no_end)
Global_lpiD_ToszEtal_no_mid = as.data.frame(Global_lpiD_ToszEtal_no_mid)
Global_lpiD_ToszEtal_dp5_no_mid = as.data.frame(Global_lpiD_ToszEtal_dp5_no_mid)

Global_lpiD_ToszEtal_no_end$Year = as.numeric(rownames(Global_lpiD_ToszEtal_no_end))
Global_lpiD_ToszEtal_dp5_no_end$Year = as.numeric(rownames(Global_lpiD_ToszEtal_dp5_no_end))
Global_lpiD_ToszEtal_no_mid$Year = as.numeric(rownames(Global_lpiD_ToszEtal_no_mid))
Global_lpiD_ToszEtal_dp5_no_mid$Year = as.numeric(rownames(Global_lpiD_ToszEtal_dp5_no_mid))

library(khroma)
bright <- color("bright")

#plot the results
ggplot() + 
  geom_line(data = Global_lpiD, aes(x = Year, y = LPI_final, color = "LPI Method"), linetype = "solid", linewidth = 2) + 
  
  geom_line(data = Global_lpiD_ToszEtal, aes(x = Year, y = LPI_final, color = "Zeros Removed", linetype = "ToszEtal"), linewidth = 1.5) + 
  geom_line(data = Global_lpiD_ToszEtal_dp5, aes(x = Year, y = LPI_final, color = "Zeros Removed", linetype = "ToszEtal (dp >= 5)"), linewidth = 1.5) + 
  
  geom_line(data = Global_lpiD_ToszEtal_no_end, aes(x = Year, y = LPI_final, color = "Leading/Trailing Zeros Removed", linetype = "ToszEtal"), linewidth = 1.5) + 
  geom_line(data = Global_lpiD_ToszEtal_dp5_no_end, aes(x = Year, y = LPI_final, color = "Leading/Trailing Zeros Removed", linetype = "ToszEtal (dp >= 5)"), linewidth = 1.5) + 
  
  geom_line(data = Global_lpiD_ToszEtal_no_mid, aes(x = Year, y = LPI_final, color = "Middle Zeros Removed", linetype = "ToszEtal"), linewidth = 1.5) + 
  geom_line(data = Global_lpiD_ToszEtal_dp5_no_mid, aes(x = Year, y = LPI_final, color = "Middle Zeros Removed", linetype = "ToszEtal (dp >= 5)"), linewidth = 1.5) + 
  
  scale_color_manual(name = "Dataset", values = c(
    "LPI Method" = bright(4)[1],
    "Zeros Removed" = bright(4)[2],
    "Leading/Trailing Zeros Removed" = bright(4)[3],
    "Middle Zeros Removed" = bright(4)[4]
  )) + 
  scale_linetype_manual(name = "Zero Removal", values = c(
    "NA (with replicates)" = "solid",
    "ToszEtal" = "dashed",
    "ToszEtal (dp >= 5)" = "dotdash"
  )) + 
  theme_bw()+ 
  labs(title = "Global") 

setwd("~/Figures/")
ggsave("~/Figures/global_trends_compare_ToszEtal_zero_position_no_conf.pdf", width = 12, height = 8)
ggsave("~/Figures/global_trends_compare_ToszEtal_zero_position_no_conf.png", width = 12, height = 8)

global_trends_final_values = lapply(global_trends, function (x) tail(x, 1))
