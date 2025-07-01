##This code produces summary tables of LPI results
library(tidyr)
setwd("~Data_summary/")
##Terrestrial results
Terrestrial_lpiD_no_conf$group = "Original LPI"
Terrestrial_lpiD_no_reps_no_conf$group  = "Original LPI"
Terrestrial_lpiD_ToszEtal$group = "Toszogyova et al."
Terrestrial_lpiD_ToszEtal_dp5$group = "Toszogyova et al."
Terrestrial_lpiD_ToszEtal_dp5_capped$group = "Toszogyova et al."
Terrestrial_lpiD_ToszEtal_noreps$group = "Toszogyova et al."
Terrestrial_lpiD_ToszEtal_dp5_noreps$group = "Toszogyova et al."
Terrestrial_lpiD_ToszEtal_dp5_capped_noreps$group = "Toszogyova et al."

Terrestrial_lpiD_NA$group = "Zeros -> NAs"
Terrestrial_lpiD_NA_dp5$group = "Zeros -> NAs"
Terrestrial_lpiD_NA_dp5_capped$group = "Zeros -> NAs"
Terrestrial_lpiD_NA_noreps$group = "Zeros -> NAs"
Terrestrial_lpiD_NA_dp5_noreps$group = "Zeros -> NAs"
Terrestrial_lpiD_NA_dp5_capped_noreps$group = "Zeros -> NAs"

Terrestrial_lpiD_no_conf$replicates = "Included"
Terrestrial_lpiD_no_reps_no_conf$replicates  = "Excluded"

Terrestrial_lpiD_ToszEtal$replicates = "Included"
Terrestrial_lpiD_ToszEtal_dp5$replicates = "Included"
Terrestrial_lpiD_ToszEtal_dp5_capped$replicates = "Included"
Terrestrial_lpiD_ToszEtal_noreps$replicates = "Excluded"
Terrestrial_lpiD_ToszEtal_dp5_noreps$replicates = "Excluded"
Terrestrial_lpiD_ToszEtal_dp5_capped_noreps$replicates = "Excluded"

Terrestrial_lpiD_NA$replicates = "Included"
Terrestrial_lpiD_NA_dp5$replicates = "Included"
Terrestrial_lpiD_NA_dp5_capped$replicates = "Included"
Terrestrial_lpiD_NA_noreps$replicates = "Excluded"
Terrestrial_lpiD_NA_dp5_noreps$replicates = "Excluded"
Terrestrial_lpiD_NA_dp5_capped_noreps$replicates = "Excluded"

Terrestrial_lpiD_no_conf$datapoints = "All"
Terrestrial_lpiD_no_reps_no_conf$datapoints  = "All"

Terrestrial_lpiD_ToszEtal$datapoints = "All"
Terrestrial_lpiD_ToszEtal_dp5$datapoints = ">=5"
Terrestrial_lpiD_ToszEtal_dp5_capped$datapoints = "All"
Terrestrial_lpiD_ToszEtal_noreps$datapoints = "All"
Terrestrial_lpiD_ToszEtal_dp5_noreps$datapoints = ">=5"
Terrestrial_lpiD_ToszEtal_dp5_capped_noreps$datapoints = ">=5"

Terrestrial_lpiD_NA$datapoints = "All"
Terrestrial_lpiD_NA_dp5$datapoints = ">=5"
Terrestrial_lpiD_NA_dp5_capped$datapoints = ">=5"
Terrestrial_lpiD_NA_noreps$datapoints = "All"
Terrestrial_lpiD_NA_dp5_noreps$datapoints = ">=5"
Terrestrial_lpiD_NA_dp5_capped_noreps$datapoints = ">=5"

Terrestrial_lpiD_no_conf$capping = "Yes"
Terrestrial_lpiD_no_reps_no_conf$capping  = "Yes"

Terrestrial_lpiD_ToszEtal$capping = "No"
Terrestrial_lpiD_ToszEtal_dp5$capping = "No"
Terrestrial_lpiD_ToszEtal_dp5_capped$capping = "Yes"
Terrestrial_lpiD_ToszEtal_noreps$capping = "No"
Terrestrial_lpiD_ToszEtal_dp5_noreps$capping = "No"
Terrestrial_lpiD_ToszEtal_dp5_capped_noreps$capping = "Yes"

Terrestrial_lpiD_NA$capping = "Yes"
Terrestrial_lpiD_NA_dp5$capping = "No"
Terrestrial_lpiD_NA_dp5_capped$capping = "Yes"
Terrestrial_lpiD_NA_noreps$capping = "No"
Terrestrial_lpiD_NA_dp5_noreps$capping = "No"
Terrestrial_lpiD_NA_dp5_capped_noreps$capping = "Yes"

Terrestrial_lpiD_no_conf$name = "Terrestrial_lpiD_no_conf"
Terrestrial_lpiD_no_reps_no_conf$name  = "Terrestrial_lpiD_no_reps_no_conf"
Terrestrial_lpiD_ToszEtal$name = "Terrestrial_lpiD_ToszEtal"
Terrestrial_lpiD_ToszEtal_dp5$name = "Terrestrial_lpiD_ToszEtal_dp5"
Terrestrial_lpiD_ToszEtal_dp5_capped$name = "Terrestrial_lpiD_ToszEtal_dp5_capped"
Terrestrial_lpiD_ToszEtal_noreps$name = "Terrestrial_lpiD_ToszEtal_noreps"
Terrestrial_lpiD_ToszEtal_dp5_noreps$name = "Terrestrial_lpiD_ToszEtal_dp5_noreps"
Terrestrial_lpiD_ToszEtal_dp5_capped_noreps$name = "Terrestrial_lpiD_ToszEtal_dp5_capped_noreps"

Terrestrial_lpiD_NA$name = "Terrestrial_lpiD_NA"
Terrestrial_lpiD_NA_dp5$name = "Terrestrial_lpiD_NA_dp5"
Terrestrial_lpiD_NA_dp5_capped$name = "Terrestrial_lpiD_NA_dp5_capped"
Terrestrial_lpiD_NA_noreps$name = "Terrestrial_lpiD_NA_noreps"
Terrestrial_lpiD_NA_dp5_noreps$name = "Terrestrial_lpiD_NA_dp5_noreps"
Terrestrial_lpiD_NA_dp5_capped_noreps$name = "Terrestrial_lpiD_NA_dp5_capped_noreps"

Terrestrial_trends = rbind(
  Terrestrial_lpiD_no_conf,
  Terrestrial_lpiD_no_reps_no_conf,
  Terrestrial_lpiD_ToszEtal,
  Terrestrial_lpiD_ToszEtal_dp5,
  
  Terrestrial_lpiD_ToszEtal_dp5_capped,
  Terrestrial_lpiD_ToszEtal_noreps,
  Terrestrial_lpiD_ToszEtal_dp5_noreps,
  Terrestrial_lpiD_ToszEtal_dp5_capped_noreps,
  
  Terrestrial_lpiD_NA,
  Terrestrial_lpiD_NA_dp5,
  Terrestrial_lpiD_NA_dp5_capped,
  Terrestrial_lpiD_NA_noreps,
  Terrestrial_lpiD_NA_dp5_noreps,
  Terrestrial_lpiD_NA_dp5_capped_noreps
)
Terrestrial_trends_summary <- subset(Terrestrial_trends,Year == "2016")
Terrestrial_trends_summary <- Terrestrial_trends_summary[,c(7,3,4,5,6,2,1)]
write.csv(Terrestrial_trends_summary,"Terrestrial_results_summary.csv")

Terrestrial_trends_simple = Terrestrial_trends[,-(3:6)]
Terrestrial_trends_simple <- pivot_wider(Terrestrial_trends_simple,id_cols = "name",names_from = "Year",values_from = "LPI_final")
write.csv(Terrestrial_trends_simple,"Terrestrial_index_results.csv")

 
##Freshwater results
Freshwater_lpiD_no_conf$group = "Original LPI"
Freshwater_lpiD_no_reps_no_conf$group  = "Original LPI"
Freshwater_lpiD_ToszEtal$group = "Toszogyova et al."
Freshwater_lpiD_ToszEtal_dp5$group = "Toszogyova et al."
Freshwater_lpiD_ToszEtal_dp5_capped$group = "Toszogyova et al."
Freshwater_lpiD_ToszEtal_noreps$group = "Toszogyova et al."
Freshwater_lpiD_ToszEtal_dp5_noreps$group = "Toszogyova et al."
Freshwater_lpiD_ToszEtal_dp5_capped_noreps$group = "Toszogyova et al."

Freshwater_lpiD_NA$group = "Zeros -> NAs"
Freshwater_lpiD_NA_dp5$group = "Zeros -> NAs"
Freshwater_lpiD_NA_dp5_capped$group = "Zeros -> NAs"
Freshwater_lpiD_NA_noreps$group = "Zeros -> NAs"
Freshwater_lpiD_NA_dp5_noreps$group = "Zeros -> NAs"
Freshwater_lpiD_NA_dp5_capped_noreps$group = "Zeros -> NAs"

Freshwater_lpiD_no_conf$replicates = "Included"
Freshwater_lpiD_no_reps_no_conf$replicates  = "Excluded"

Freshwater_lpiD_ToszEtal$replicates = "Included"
Freshwater_lpiD_ToszEtal_dp5$replicates = "Included"
Freshwater_lpiD_ToszEtal_dp5_capped$replicates = "Included"
Freshwater_lpiD_ToszEtal_noreps$replicates = "Excluded"
Freshwater_lpiD_ToszEtal_dp5_noreps$replicates = "Excluded"
Freshwater_lpiD_ToszEtal_dp5_capped_noreps$replicates = "Excluded"

Freshwater_lpiD_NA$replicates = "Included"
Freshwater_lpiD_NA_dp5$replicates = "Included"
Freshwater_lpiD_NA_dp5_capped$replicates = "Included"
Freshwater_lpiD_NA_noreps$replicates = "Excluded"
Freshwater_lpiD_NA_dp5_noreps$replicates = "Excluded"
Freshwater_lpiD_NA_dp5_capped_noreps$replicates = "Excluded"

Freshwater_lpiD_no_conf$datapoints = "All"
Freshwater_lpiD_no_reps_no_conf$datapoints  = "All"

Freshwater_lpiD_ToszEtal$datapoints = "All"
Freshwater_lpiD_ToszEtal_dp5$datapoints = ">=5"
Freshwater_lpiD_ToszEtal_dp5_capped$datapoints = "All"
Freshwater_lpiD_ToszEtal_noreps$datapoints = "All"
Freshwater_lpiD_ToszEtal_dp5_noreps$datapoints = ">=5"
Freshwater_lpiD_ToszEtal_dp5_capped_noreps$datapoints = ">=5"

Freshwater_lpiD_NA$datapoints = "All"
Freshwater_lpiD_NA_dp5$datapoints = ">=5"
Freshwater_lpiD_NA_dp5_capped$datapoints = ">=5"
Freshwater_lpiD_NA_noreps$datapoints = "All"
Freshwater_lpiD_NA_dp5_noreps$datapoints = ">=5"
Freshwater_lpiD_NA_dp5_capped_noreps$datapoints = ">=5"

Freshwater_lpiD_no_conf$capping = "Yes"
Freshwater_lpiD_no_reps_no_conf$capping  = "Yes"

Freshwater_lpiD_ToszEtal$capping = "No"
Freshwater_lpiD_ToszEtal_dp5$capping = "No"
Freshwater_lpiD_ToszEtal_dp5_capped$capping = "Yes"
Freshwater_lpiD_ToszEtal_noreps$capping = "No"
Freshwater_lpiD_ToszEtal_dp5_noreps$capping = "No"
Freshwater_lpiD_ToszEtal_dp5_capped_noreps$capping = "Yes"

Freshwater_lpiD_NA$capping = "Yes"
Freshwater_lpiD_NA_dp5$capping = "No"
Freshwater_lpiD_NA_dp5_capped$capping = "Yes"
Freshwater_lpiD_NA_noreps$capping = "No"
Freshwater_lpiD_NA_dp5_noreps$capping = "No"
Freshwater_lpiD_NA_dp5_capped_noreps$capping = "Yes"

Freshwater_lpiD_no_conf$name = "Freshwater_lpiD_no_conf"
Freshwater_lpiD_no_reps_no_conf$name  = "Freshwater_lpiD_no_reps_no_conf"
Freshwater_lpiD_ToszEtal$name = "Freshwater_lpiD_ToszEtal"
Freshwater_lpiD_ToszEtal_dp5$name = "Freshwater_lpiD_ToszEtal_dp5"
Freshwater_lpiD_ToszEtal_dp5_capped$name = "Freshwater_lpiD_ToszEtal_dp5_capped"
Freshwater_lpiD_ToszEtal_noreps$name = "Freshwater_lpiD_ToszEtal_noreps"
Freshwater_lpiD_ToszEtal_dp5_noreps$name = "Freshwater_lpiD_ToszEtal_dp5_noreps"
Freshwater_lpiD_ToszEtal_dp5_capped_noreps$name = "Freshwater_lpiD_ToszEtal_dp5_capped_noreps"

Freshwater_lpiD_NA$name = "Freshwater_lpiD_NA"
Freshwater_lpiD_NA_dp5$name = "Freshwater_lpiD_NA_dp5"
Freshwater_lpiD_NA_dp5_capped$name = "Freshwater_lpiD_NA_dp5_capped"
Freshwater_lpiD_NA_noreps$name = "Freshwater_lpiD_NA_noreps"
Freshwater_lpiD_NA_dp5_noreps$name = "Freshwater_lpiD_NA_dp5_noreps"
Freshwater_lpiD_NA_dp5_capped_noreps$name = "Freshwater_lpiD_NA_dp5_capped_noreps"

Freshwater_trends = rbind(
  Freshwater_lpiD_no_conf,
  Freshwater_lpiD_no_reps_no_conf,
  Freshwater_lpiD_ToszEtal,
  Freshwater_lpiD_ToszEtal_dp5,
  
  Freshwater_lpiD_ToszEtal_dp5_capped,
  Freshwater_lpiD_ToszEtal_noreps,
  Freshwater_lpiD_ToszEtal_dp5_noreps,
  Freshwater_lpiD_ToszEtal_dp5_capped_noreps,
  
  Freshwater_lpiD_NA,
  Freshwater_lpiD_NA_dp5,
  Freshwater_lpiD_NA_dp5_capped,
  Freshwater_lpiD_NA_noreps,
  Freshwater_lpiD_NA_dp5_noreps,
  Freshwater_lpiD_NA_dp5_capped_noreps
)

Freshwater_trends_summary <- subset(Freshwater_trends,Year == "2016")
Freshwater_trends_summary <- Freshwater_trends_summary[,c(7,3,4,5,6,2,1)]
write.csv(Freshwater_trends_summary,"Freshwater_results_summary.csv")

Freshwater_trends_simple = Freshwater_trends[,-(3:6)]
Freshwater_trends_simple <- pivot_wider(Freshwater_trends_simple,id_cols = "name",names_from = "Year",values_from = "LPI_final")
write.csv(Freshwater_trends_simple,"Freshwater_index_results.csv")

##Marine results
Marine_lpiD_no_conf$group = "Original LPI"
Marine_lpiD_no_reps_no_conf$group  = "Original LPI"
Marine_lpiD_ToszEtal$group = "Toszogyova et al."
Marine_lpiD_ToszEtal_dp5$group = "Toszogyova et al."
Marine_lpiD_ToszEtal_dp5_capped$group = "Toszogyova et al."
Marine_lpiD_ToszEtal_noreps$group = "Toszogyova et al."
Marine_lpiD_ToszEtal_dp5_noreps$group = "Toszogyova et al."
Marine_lpiD_ToszEtal_dp5_capped_noreps$group = "Toszogyova et al."

Marine_lpiD_NA$group = "Zeros -> NAs"
Marine_lpiD_NA_dp5$group = "Zeros -> NAs"
Marine_lpiD_NA_dp5_capped$group = "Zeros -> NAs"
Marine_lpiD_NA_noreps$group = "Zeros -> NAs"
Marine_lpiD_NA_dp5_noreps$group = "Zeros -> NAs"
Marine_lpiD_NA_dp5_capped_noreps$group = "Zeros -> NAs"

Marine_lpiD_no_conf$replicates = "Included"
Marine_lpiD_no_reps_no_conf$replicates  = "Excluded"

Marine_lpiD_ToszEtal$replicates = "Included"
Marine_lpiD_ToszEtal_dp5$replicates = "Included"
Marine_lpiD_ToszEtal_dp5_capped$replicates = "Included"
Marine_lpiD_ToszEtal_noreps$replicates = "Excluded"
Marine_lpiD_ToszEtal_dp5_noreps$replicates = "Excluded"
Marine_lpiD_ToszEtal_dp5_capped_noreps$replicates = "Excluded"

Marine_lpiD_NA$replicates = "Included"
Marine_lpiD_NA_dp5$replicates = "Included"
Marine_lpiD_NA_dp5_capped$replicates = "Included"
Marine_lpiD_NA_noreps$replicates = "Excluded"
Marine_lpiD_NA_dp5_noreps$replicates = "Excluded"
Marine_lpiD_NA_dp5_capped_noreps$replicates = "Excluded"

Marine_lpiD_no_conf$datapoints = "All"
Marine_lpiD_no_reps_no_conf$datapoints  = "All"

Marine_lpiD_ToszEtal$datapoints = "All"
Marine_lpiD_ToszEtal_dp5$datapoints = ">=5"
Marine_lpiD_ToszEtal_dp5_capped$datapoints = "All"
Marine_lpiD_ToszEtal_noreps$datapoints = "All"
Marine_lpiD_ToszEtal_dp5_noreps$datapoints = ">=5"
Marine_lpiD_ToszEtal_dp5_capped_noreps$datapoints = ">=5"

Marine_lpiD_NA$datapoints = "All"
Marine_lpiD_NA_dp5$datapoints = ">=5"
Marine_lpiD_NA_dp5_capped$datapoints = ">=5"
Marine_lpiD_NA_noreps$datapoints = "All"
Marine_lpiD_NA_dp5_noreps$datapoints = ">=5"
Marine_lpiD_NA_dp5_capped_noreps$datapoints = ">=5"

Marine_lpiD_no_conf$capping = "Yes"
Marine_lpiD_no_reps_no_conf$capping  = "Yes"

Marine_lpiD_ToszEtal$capping = "No"
Marine_lpiD_ToszEtal_dp5$capping = "No"
Marine_lpiD_ToszEtal_dp5_capped$capping = "Yes"
Marine_lpiD_ToszEtal_noreps$capping = "No"
Marine_lpiD_ToszEtal_dp5_noreps$capping = "No"
Marine_lpiD_ToszEtal_dp5_capped_noreps$capping = "Yes"

Marine_lpiD_NA$capping = "Yes"
Marine_lpiD_NA_dp5$capping = "No"
Marine_lpiD_NA_dp5_capped$capping = "Yes"
Marine_lpiD_NA_noreps$capping = "No"
Marine_lpiD_NA_dp5_noreps$capping = "No"
Marine_lpiD_NA_dp5_capped_noreps$capping = "Yes"

Marine_lpiD_no_conf$name = "Marine_lpiD_no_conf"
Marine_lpiD_no_reps_no_conf$name  = "Marine_lpiD_no_reps_no_conf"
Marine_lpiD_ToszEtal$name = "Marine_lpiD_ToszEtal"
Marine_lpiD_ToszEtal_dp5$name = "Marine_lpiD_ToszEtal_dp5"
Marine_lpiD_ToszEtal_dp5_capped$name = "Marine_lpiD_ToszEtal_dp5_capped"
Marine_lpiD_ToszEtal_noreps$name = "Marine_lpiD_ToszEtal_noreps"
Marine_lpiD_ToszEtal_dp5_noreps$name = "Marine_lpiD_ToszEtal_dp5_noreps"
Marine_lpiD_ToszEtal_dp5_capped_noreps$name = "Marine_lpiD_ToszEtal_dp5_capped_noreps"

Marine_lpiD_NA$name = "Marine_lpiD_NA"
Marine_lpiD_NA_dp5$name = "Marine_lpiD_NA_dp5"
Marine_lpiD_NA_dp5_capped$name = "Marine_lpiD_NA_dp5_capped"
Marine_lpiD_NA_noreps$name = "Marine_lpiD_NA_noreps"
Marine_lpiD_NA_dp5_noreps$name = "Marine_lpiD_NA_dp5_noreps"
Marine_lpiD_NA_dp5_capped_noreps$name = "Marine_lpiD_NA_dp5_capped_noreps"

Marine_trends = rbind(
  Marine_lpiD_no_conf,
  Marine_lpiD_no_reps_no_conf,
  Marine_lpiD_ToszEtal,
  Marine_lpiD_ToszEtal_dp5,
  
  Marine_lpiD_ToszEtal_dp5_capped,
  Marine_lpiD_ToszEtal_noreps,
  Marine_lpiD_ToszEtal_dp5_noreps,
  Marine_lpiD_ToszEtal_dp5_capped_noreps,
  
  Marine_lpiD_NA,
  Marine_lpiD_NA_dp5,
  Marine_lpiD_NA_dp5_capped,
  Marine_lpiD_NA_noreps,
  Marine_lpiD_NA_dp5_noreps,
  Marine_lpiD_NA_dp5_capped_noreps
)

Marine_trends_summary <- subset(Marine_trends,Year == "2016")
Marine_trends_summary <- Marine_trends_summary[,c(7,3,4,5,6,2,1)]
write.csv(Marine_trends_summary,"Marine_results_summary.csv")

Marine_trends_simple = Marine_trends[,-(3:6)]
Marine_trends_simple <- pivot_wider(Marine_trends_simple,id_cols = "name",names_from = "Year",values_from = "LPI_final")
write.csv(Marine_trends_simple,"Marine_index_results.csv")

##Global results
Global_lpiD_no_conf$group = "Original LPI"
Global_lpiD_no_reps_no_conf$group  = "Original LPI"
Global_lpiD_ToszEtal$group = "Toszogyova et al."
Global_lpiD_ToszEtal_dp5$group = "Toszogyova et al."
Global_lpiD_ToszEtal_dp5_capped$group = "Toszogyova et al."
Global_lpiD_ToszEtal_noreps$group = "Toszogyova et al."
Global_lpiD_ToszEtal_dp5_noreps$group = "Toszogyova et al."
Global_lpiD_ToszEtal_dp5_capped_noreps$group = "Toszogyova et al."

Global_lpiD_NA$group = "Zeros -> NAs"
Global_lpiD_NA_dp5$group = "Zeros -> NAs"
Global_lpiD_NA_dp5_capped$group = "Zeros -> NAs"
Global_lpiD_NA_noreps$group = "Zeros -> NAs"
Global_lpiD_NA_dp5_noreps$group = "Zeros -> NAs"
Global_lpiD_NA_dp5_capped_noreps$group = "Zeros -> NAs"

Global_lpiD_no_conf$replicates = "Included"
Global_lpiD_no_reps_no_conf$replicates  = "Excluded"

Global_lpiD_ToszEtal$replicates = "Included"
Global_lpiD_ToszEtal_dp5$replicates = "Included"
Global_lpiD_ToszEtal_dp5_capped$replicates = "Included"
Global_lpiD_ToszEtal_noreps$replicates = "Excluded"
Global_lpiD_ToszEtal_dp5_noreps$replicates = "Excluded"
Global_lpiD_ToszEtal_dp5_capped_noreps$replicates = "Excluded"

Global_lpiD_NA$replicates = "Included"
Global_lpiD_NA_dp5$replicates = "Included"
Global_lpiD_NA_dp5_capped$replicates = "Included"
Global_lpiD_NA_noreps$replicates = "Excluded"
Global_lpiD_NA_dp5_noreps$replicates = "Excluded"
Global_lpiD_NA_dp5_capped_noreps$replicates = "Excluded"

Global_lpiD_no_conf$datapoints = "All"
Global_lpiD_no_reps_no_conf$datapoints  = "All"

Global_lpiD_ToszEtal$datapoints = "All"
Global_lpiD_ToszEtal_dp5$datapoints = ">=5"
Global_lpiD_ToszEtal_dp5_capped$datapoints = "All"
Global_lpiD_ToszEtal_noreps$datapoints = "All"
Global_lpiD_ToszEtal_dp5_noreps$datapoints = ">=5"
Global_lpiD_ToszEtal_dp5_capped_noreps$datapoints = ">=5"

Global_lpiD_NA$datapoints = "All"
Global_lpiD_NA_dp5$datapoints = ">=5"
Global_lpiD_NA_dp5_capped$datapoints = ">=5"
Global_lpiD_NA_noreps$datapoints = "All"
Global_lpiD_NA_dp5_noreps$datapoints = ">=5"
Global_lpiD_NA_dp5_capped_noreps$datapoints = ">=5"

Global_lpiD_no_conf$capping = "Yes"
Global_lpiD_no_reps_no_conf$capping  = "Yes"

Global_lpiD_ToszEtal$capping = "No"
Global_lpiD_ToszEtal_dp5$capping = "No"
Global_lpiD_ToszEtal_dp5_capped$capping = "Yes"
Global_lpiD_ToszEtal_noreps$capping = "No"
Global_lpiD_ToszEtal_dp5_noreps$capping = "No"
Global_lpiD_ToszEtal_dp5_capped_noreps$capping = "Yes"

Global_lpiD_NA$capping = "Yes"
Global_lpiD_NA_dp5$capping = "No"
Global_lpiD_NA_dp5_capped$capping = "Yes"
Global_lpiD_NA_noreps$capping = "No"
Global_lpiD_NA_dp5_noreps$capping = "No"
Global_lpiD_NA_dp5_capped_noreps$capping = "Yes"

Global_lpiD_no_conf$name = "Global_lpiD_no_conf"
Global_lpiD_no_reps_no_conf$name  = "Global_lpiD_no_reps_no_conf"
Global_lpiD_ToszEtal$name = "Global_lpiD_ToszEtal"
Global_lpiD_ToszEtal_dp5$name = "Global_lpiD_ToszEtal_dp5"
Global_lpiD_ToszEtal_dp5_capped$name = "Global_lpiD_ToszEtal_dp5_capped"
Global_lpiD_ToszEtal_noreps$name = "Global_lpiD_ToszEtal_noreps"
Global_lpiD_ToszEtal_dp5_noreps$name = "Global_lpiD_ToszEtal_dp5_noreps"
Global_lpiD_ToszEtal_dp5_capped_noreps$name = "Global_lpiD_ToszEtal_dp5_capped_noreps"

Global_lpiD_NA$name = "Global_lpiD_NA"
Global_lpiD_NA_dp5$name = "Global_lpiD_NA_dp5"
Global_lpiD_NA_dp5_capped$name = "Global_lpiD_NA_dp5_capped"
Global_lpiD_NA_noreps$name = "Global_lpiD_NA_noreps"
Global_lpiD_NA_dp5_noreps$name = "Global_lpiD_NA_dp5_noreps"
Global_lpiD_NA_dp5_capped_noreps$name = "Global_lpiD_NA_dp5_capped_noreps"

Global_trends = rbind(
  Global_lpiD_no_conf,
  Global_lpiD_no_reps_no_conf,
  Global_lpiD_ToszEtal,
  Global_lpiD_ToszEtal_dp5,
  
  Global_lpiD_ToszEtal_dp5_capped,
  Global_lpiD_ToszEtal_noreps,
  Global_lpiD_ToszEtal_dp5_noreps,
  Global_lpiD_ToszEtal_dp5_capped_noreps,
  
  Global_lpiD_NA,
  Global_lpiD_NA_dp5,
  Global_lpiD_NA_dp5_capped,
  Global_lpiD_NA_noreps,
  Global_lpiD_NA_dp5_noreps,
  Global_lpiD_NA_dp5_capped_noreps
)

Global_trends_summary <- subset(Global_trends,Year == "2016")
Global_trends_summary <- Global_trends_summary[,c(7,3,4,5,6,2,1)]
write.csv(Global_trends_summary,"Global_results_summary.csv")

Global_trends_simple = Global_trends[,-(3:6)]
Global_trends_simple <- pivot_wider(Global_trends_simple,id_cols = "name",names_from = "Year",values_from = "LPI_final")
write.csv(Global_trends_simple,"Global_index_results.csv")

############################
############################
##Counting zeros in full data set
#Create pops file for full data set
lpi_data_no_conf_infile <- create_infile(lpi_data_no_conf, start_col_name = "X1950",end_col_name = "X2018",name="Global_no_conf")
lpi_data_no_conf_pops <- read.delim("Global_no_conf_pops.txt")
#Run remove zeros
if (nrow(lpi_data_no_conf_pops) > 0) {
  # Need to clear out pops with just 0s or pops with no-data for 'remove_zeros' to work
  pops_with_2n = lpi_data_no_conf_pops %>% group_by(ID) %>% drop_na() %>% summarise(n = n()) %>% filter(n > 1) %>% arrange(n)
  pops_with_0n = lpi_data_no_conf_pops %>% group_by(ID) %>% drop_na() %>% summarise(n0 = sum(popvalue == 0), n = n(), prop0 = n0/n) %>% filter(prop0 < 1) %>% arrange(-prop0)
  
  lpi_data_no_conf_pops = filter(lpi_data_no_conf_pops, ID %in% pops_with_2n$ID)
  lpi_data_no_conf_pops = filter(lpi_data_no_conf_pops, ID %in% pops_with_0n$ID)
  
  Global_Tosz = remove_zeros(lpi_data_no_conf_pops)
}
 write.csv(Global_Tosz$zeros,"Global_zero_position_counts.csv") 
