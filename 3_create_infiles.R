###Creating infiles###
# Purpose of this script is to create infiles for calculating LPIs
#####
# * RUN 2_subsetting_2024.R first
#source("../2_subsetting_2024.R")

##For each run, change lpi_data_no_conf_no_reps to appropriate data sets: lpi_data_no_reps and lpi_data_no_conf
##For each run, change to appropriate working directory
#setwd("~/rlpi_code_no_conf/") 
#setwd("~/rlpi_code_no_replicates/")
setwd("~/rlpi_code_no_replicates_no_conf/")

#AFT, Freshwater, Class
FW_AFT_Fishes_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=FW_AFT_Fishes, start_col_name = "X1950",end_col_name = "X2018",name="FW_AFT_Fishes")
FW_AFT_Mammalia_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=FW_AFT_Mammalia, start_col_name = "X1950",end_col_name = "X2018",name="FW_AFT_Mammalia")
FW_AFT_Herps_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=FW_AFT_Herps, start_col_name = "X1950",end_col_name = "X2018",name="FW_AFT_Herps")
FW_AFT_Aves_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=FW_AFT_Aves, start_col_name = "X1950",end_col_name = "X2018",name="FW_AFT_Aves")

#AFT, Terrestrial, Class
T_AFT_Mammalia_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=T_AFT_Mammalia, start_col_name = "X1950",end_col_name = "X2018",name="T_AFT_Mammalia")
T_AFT_Herps_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=T_AFT_Herps, start_col_name = "X1950",end_col_name = "X2018",name="T_AFT_Herps")
T_AFT_Aves_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=T_AFT_Aves, start_col_name = "X1950",end_col_name = "X2018",name="T_AFT_Aves")

#IPA, Freshwater, Class
FW_IPA_Fishes_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=FW_IPA_Fishes, start_col_name = "X1950",end_col_name = "X2018",name="FW_IPA_Fishes")
FW_IPA_Mammalia_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=FW_IPA_Mammalia, start_col_name = "X1950",end_col_name = "X2018",name="FW_IPA_Mammalia")
FW_IPA_Herps_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=FW_IPA_Herps, start_col_name = "X1950",end_col_name = "X2018",name="FW_IPA_Herps")
FW_IPA_Aves_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=FW_IPA_Aves, start_col_name = "X1950",end_col_name = "X2018",name="FW_IPA_Aves")

#IPA, Terrestrial, Class
T_IPA_Mammalia_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=T_IPA_Mammalia, start_col_name = "X1950",end_col_name = "X2018",name="T_IPA_Mammalia")
T_IPA_Herps_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=T_IPA_Herps, start_col_name = "X1950",end_col_name = "X2018",name="T_IPA_Herps")
T_IPA_Aves_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=T_IPA_Aves, start_col_name = "X1950",end_col_name = "X2018",name="T_IPA_Aves")

#Nearctic, Freshwater, Class
FW_NEA_Fishes_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=FW_NEA_Fishes, start_col_name = "X1950",end_col_name = "X2018",name="FW_NEA_Fishes")
FW_NEA_Mammalia_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=FW_NEA_Mammalia, start_col_name = "X1950",end_col_name = "X2018",name="FW_NEA_Mammalia")
FW_NEA_Herps_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=FW_NEA_Herps, start_col_name = "X1950",end_col_name = "X2018",name="FW_NEA_Herps")
FW_NEA_Aves_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=FW_NEA_Aves, start_col_name = "X1950",end_col_name = "X2018",name="FW_NEA_Aves")

#NEA, Terrestrial, Class
T_NEA_Mammalia_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=T_NEA_Mammalia, start_col_name = "X1950",end_col_name = "X2018",name="T_NEA_Mammalia")
T_NEA_Herps_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=T_NEA_Herps, start_col_name = "X1950",end_col_name = "X2018",name="T_NEA_Herps")
T_NEA_Aves_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=T_NEA_Aves, start_col_name = "X1950",end_col_name = "X2018",name="T_NEA_Aves")

#NEO, Freshwater, Class
FW_NEO_Fishes_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=FW_NEO_Fishes, start_col_name = "X1950",end_col_name = "X2018",name="FW_NEO_Fishes")
FW_NEO_Mammalia_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=FW_NEO_Mammalia, start_col_name = "X1950",end_col_name = "X2018",name="FW_NEO_Mammalia")
FW_NEO_Herps_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=FW_NEO_Herps, start_col_name = "X1950",end_col_name = "X2018",name="FW_NEO_Herps")
FW_NEO_Aves_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=FW_NEO_Aves, start_col_name = "X1950",end_col_name = "X2018",name="FW_NEO_Aves")

#NEO, Terrestrial, Class
T_NEO_Mammalia_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=T_NEO_Mammalia, start_col_name = "X1950",end_col_name = "X2018",name="T_NEO_Mammalia")
T_NEO_Herps_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=T_NEO_Herps, start_col_name = "X1950",end_col_name = "X2018",name="T_NEO_Herps")
T_NEO_Aves_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=T_NEO_Aves, start_col_name = "X1950",end_col_name = "X2018",name="T_NEO_Aves")

#PAL, Freshwater, Class
FW_PAL_Fishes_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=FW_PAL_Fishes, start_col_name = "X1950",end_col_name = "X2018",name="FW_PAL_Fishes")
FW_PAL_Mammalia_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=FW_PAL_Mammalia, start_col_name = "X1950",end_col_name = "X2018",name="FW_PAL_Mammalia")
FW_PAL_Aves_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=FW_PAL_Aves, start_col_name = "X1950",end_col_name = "X2018",name="FW_PAL_Aves")
FW_PAL_Herps_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=FW_PAL_Herps, start_col_name = "X1950",end_col_name = "X2018",name="FW_PAL_Herps")

#PAL, Terrestrial, Class
T_PAL_Mammalia_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=T_PAL_Mammalia, start_col_name = "X1950",end_col_name = "X2018",name="T_PAL_Mammalia")
T_PAL_Aves_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=T_PAL_Aves, start_col_name = "X1950",end_col_name = "X2018",name="T_PAL_Aves")
T_PAL_Herps_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=T_PAL_Herps, start_col_name = "X1950",end_col_name = "X2018",name="T_PAL_Herps")

closeAllConnections()

#IPA, Marine, Class
M_IPA_Fishes_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=M_IPA_Fishes, start_col_name = "X1950",end_col_name = "X2018",name="M_IPA_Fishes")
M_IPA_Mammalia_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=M_IPA_Mammalia, start_col_name = "X1950",end_col_name = "X2018",name="M_IPA_Mammalia")
M_IPA_Herps_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=M_IPA_Herps, start_col_name = "X1950",end_col_name = "X2018",name="M_IPA_Herps")
M_IPA_Aves_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=M_IPA_Aves, start_col_name = "X1950",end_col_name = "X2018",name="M_IPA_Aves")

#ATR, Marine, Class
M_ATR_Fishes_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=M_ATR_Fishes, start_col_name = "X1950",end_col_name = "X2018",name="M_ATR_Fishes")
M_ATR_Mammalia_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=M_ATR_Mammalia, start_col_name = "X1950",end_col_name = "X2018",name="M_ATR_Mammalia")
M_ATR_Herps_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=M_ATR_Herps, start_col_name = "X1950",end_col_name = "X2018",name="M_ATR_Herps")
M_ATR_Aves_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=M_ATR_Aves, start_col_name = "X1950",end_col_name = "X2018",name="M_ATR_Aves")

#ATE, Marine, Class
M_ATE_Fishes_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=M_ATE_Fishes, start_col_name = "X1950",end_col_name = "X2018",name="M_ATE_Fishes")
M_ATE_Mammalia_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=M_ATE_Mammalia, start_col_name = "X1950",end_col_name = "X2018",name="M_ATE_Mammalia")
M_ATE_Herps_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=M_ATE_Herps, start_col_name = "X1950",end_col_name = "X2018",name="M_ATE_Herps")
M_ATE_Aves_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=M_ATE_Aves, start_col_name = "X1950",end_col_name = "X2018",name="M_ATE_Aves")

#ARC, Marine, Class
M_ARC_Fishes_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=M_ARC_Fishes, start_col_name = "X1950",end_col_name = "X2018",name="M_ARC_Fishes")
M_ARC_Mammalia_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=M_ARC_Mammalia, start_col_name = "X1950",end_col_name = "X2018",name="M_ARC_Mammalia")
M_ARC_Herps_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=M_ARC_Herps, start_col_name = "X1950",end_col_name = "X2018",name="M_ARC_Herps")
M_ARC_Aves_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=M_ARC_Aves, start_col_name = "X1950",end_col_name = "X2018",name="M_ARC_Aves")

#PAC, Marine, Class
M_PAC_Fishes_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=M_PAC_Fishes, start_col_name = "X1950",end_col_name = "X2018",name="M_PAC_Fishes")
M_PAC_Mammalia_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=M_PAC_Mammalia, start_col_name = "X1950",end_col_name = "X2018",name="M_PAC_Mammalia")
M_PAC_Herps_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=M_PAC_Herps, start_col_name = "X1950",end_col_name = "X2018",name="M_PAC_Herps")
M_PAC_Aves_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=M_PAC_Aves, start_col_name = "X1950",end_col_name = "X2018",name="M_PAC_Aves")

#ANT, Marine, Class
M_ANT_Fishes_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=M_ANT_Fishes, start_col_name = "X1950",end_col_name = "X2018",name="M_ANT_Fishes")
M_ANT_Mammalia_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=M_ANT_Mammalia, start_col_name = "X1950",end_col_name = "X2018",name="M_ANT_Mammalia")
M_ANT_Herps_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=M_ANT_Herps, start_col_name = "X1950",end_col_name = "X2018",name="M_ANT_Herps")
M_ANT_Aves_index <- create_infile(lpi_data_no_conf_no_reps, index_vector=M_ANT_Aves, start_col_name = "X1950",end_col_name = "X2018",name="M_ANT_Aves")

closeAllConnections()

