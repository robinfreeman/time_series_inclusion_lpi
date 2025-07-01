###
# This code creates the data files needed for calculating LPIs by removing replicates, confidential data and applying zero removal processes
###

library(dplyr)
library(tidyr)
library(readr)

###Read in file
lpi_data = read.csv("~/lpi_pops_20220209.csv")
###
# Create 4 data sets for analysis
# First make a folder for the published LPI calculation
###
setwd("~/rlpi_code/")
# Then we run the 2_subsetting.R and 3_create_infiles.R scripts to create pops and infiles in that directory
###
#Then remove Confidential data as those records not available to Toszogyova et al
setwd("~/rlpi_code_no_conf/") 
lpi_data_no_conf <- subset(lpi_data,lpi_data$Confidential == 0)  ## To exclude the Confidential records
# Then we run the 2_subsetting.R and 3_create_infiles.R scripts to create pops and infiles in that directory
###
#Finally remove replicates with and without Confidential 
setwd("~/rlpi_code_no_replicates/")
lpi_data_no_reps <- subset(lpi_data,lpi_data$Replicate == '0')  ## To exclude the replicates for global level
# Then we run the 2_subsetting.R and 3_create_infiles.R scripts to create pops and infiles in that directory

setwd("~/rlpi_code_no_replicates_no_conf/")
lpi_data_no_conf_no_reps <- subset(lpi_data_no_conf,lpi_data_no_conf$Replicate == '0')  ## To exclude the replicates for global level/Classes
# Then we run the 2_subsetting.R and 3_create_infiles.R scripts to create pops and infiles in that directory

###
# Applying two zero removal processes to each directory
# Add remove_zero function written by Toszogyova et al
source("~/remove_zeros.R")
###
# For each popfile in each directory, we apply the Toszogyova et al process to remove zeros
###
#
pop_files = list.files("~/rlpi_code_no_conf", pattern = "*_pops.txt", full.names = TRUE)

for (f in pop_files) {
  print(sprintf("Processing: %s", f))
  pop_data = read.table(f, header = TRUE)
  
  if (nrow(pop_data) > 0) {
    # Need to clear out pops with just 0s or pops with no-data for 'remove_zeros' to work
    pops_with_2n = pop_data %>% group_by(ID) %>% drop_na() %>% summarise(n = n()) %>% filter(n > 1) %>% arrange(n)
    pops_with_0n = pop_data %>% group_by(ID) %>% drop_na() %>% summarise(n0 = sum(popvalue == 0), n = n(), prop0 = n0/n) %>% filter(prop0 < 1) %>% arrange(-prop0)
    
    pop_data = filter(pop_data, ID %in% pops_with_2n$ID)
    pop_data = filter(pop_data, ID %in% pops_with_0n$ID)
    
    res = remove_zeros(pop_data)
    pop_data_nz = res$tabulka_no0 %>% select(Binomial, ID, year, popvalue,orig_id) # remove 'orig_id' if not needed
    write_tsv(pop_data_nz, gsub("rlpi_code", "rlpi_code_tosz_keepIDs", f))
    #write_tsv(pop_data_nz, gsub("rlpi_code", "rlpi_code_tosz", f))
  }
}

###
# And, for each popfile in that directory, we also try simply turning zeros to NAs
###
pop_files = list.files("C:/Users/mcrae.l/OneDrive - Zoological Society of London/Desktop/matters_arising_final/rlpi_code_no_conf", pattern = "*_pops.txt", full.names = TRUE)

for (f in pop_files) {
  #if (startsWith(basename(f), "T_")) {
  pop_data = read.table(f, header = TRUE)
  
  # Make all zeros NAs
  pop_data$popvalue[pop_data$popvalue == 0] = NA
  # Drop NAs
  pop_data = pop_data %>% drop_na(popvalue)
  
  write.table(pop_data, gsub("rlpi_code", "rlpi_code_zeroToNA", f))
  #}
}

###
# Repeat the above but with replicates removed 
###
###
# For each popfile in that directory, we apply the Toszogyova et al process to remove zeros
###
pop_files = list.files("~/rlpi_code_no_replicates_no_conf", pattern = "*_pops.txt", full.names = TRUE)

for (f in pop_files) {
  #if (startsWith(basename(f), "T_")) {
  pop_data = read.table(f, header = TRUE)
  
  if (nrow(pop_data) > 0) {
    # Need to clear out pops with just 0s or pops with no-data for 'remove_zeros' to work
    pops_with_2n = pop_data %>% group_by(ID) %>% drop_na() %>% summarise(n = n()) %>% filter(n > 1) %>% arrange(n)
    pops_with_0n = pop_data %>% group_by(ID) %>% drop_na() %>% summarise(n0 = sum(popvalue == 0), n = n(), prop0 = n0/n) %>% filter(prop0 < 1) %>% arrange(-prop0)
    
    pop_data = filter(pop_data, ID %in% pops_with_2n$ID)
    pop_data = filter(pop_data, ID %in% pops_with_0n$ID)
    
    res = remove_zeros(pop_data)
    pop_data_nz = res$tabulka_no0 %>% select(Binomial, ID, year, popvalue) # remove 'orig_id' if not needed
    write.table(pop_data_nz, gsub("rlpi_code_no_replicates", "rlpi_code_tosz_no_reps", f))
  }
  #}
}


###
# And, for each popfile in that directory, we also try simply turning zeros to NAs
###
pop_files = list.files("~/rlpi_code_no_replicates_no_conf", pattern = "*_pops.txt", full.names = TRUE)

for (f in pop_files) {
  #if (startsWith(basename(f), "T_")) {
  pop_data = read.table(f, header = TRUE)
  
  # Make all zeros NAs
  pop_data$popvalue[pop_data$popvalue == 0] = NA
  # Drop NAs
  pop_data = pop_data %>% drop_na(popvalue)
  
  write.table(pop_data, gsub("rlpi_code_no_replicates", "rlpi_code_zeroToNA_no_reps", f))
  #}
}

######
#Removal of zeros depending on position in the time-series
#######

###
# Then for each popfile in the first directory, we apply modified Toszgoyova et al process to remove just middle or leading/trailing zeros
###
pop_files = list.files("~/rlpi_code_no_conf", pattern = "*_pops.txt", full.names = TRUE)

for (f in pop_files) {
  pop_data = read.table(f, header = TRUE)
  
  if (nrow(pop_data) > 0) {
    # Need to clear out pops with just 0s or pops with no-data for 'remove_zeros' to work
    pops_with_2n = pop_data %>% group_by(ID) %>% drop_na() %>% summarise(n = n()) %>% filter(n > 1) %>% arrange(n)
    pops_with_0n = pop_data %>% group_by(ID) %>% drop_na() %>% summarise(n0 = sum(popvalue == 0), n = n(), prop0 = n0/n) %>% filter(prop0 < 1) %>% arrange(-prop0)
    
    pop_data = filter(pop_data, ID %in% pops_with_2n$ID)
    pop_data = filter(pop_data, ID %in% pops_with_0n$ID)
    
    #res = remove_zeros(pop_data)
    #res_no_mid = remove_zeros(pop_data, remove_mid = TRUE)
    res_with_mid = remove_zeros(pop_data, remove_mid = FALSE)
    
    #datapoints in leading trailing zeres are those that are removed by the code above from pop_data
    #res_leading_trailing_zeros = dplyr::setdiff(pop_data, res_with_mid$tabulka_no0)
    
    # datapoints with leading/trailing but no mid zeros are the combination of the 'no_mid' and the leading and trailing zeros
    #pop_data_no_mid_zeros = rbind(res_no_mid$tabulka_no0, res_leading_trailing_zeros) %>% arrange(ID, year)
    
    #write.table(pop_data_no_mid_zeros, gsub("rlpi_code", "rlpi_code_tosz_no_mid", f))
    write.table(res_with_mid$tabulka_no0 %>% select(Binomial, ID, year, popvalue), gsub("rlpi_code", "rlpi_code_tosz_no_end", f))
    #write.table(res, gsub("rlpi_code", "rlpi_code_toszgoyova", f))
  }
}
