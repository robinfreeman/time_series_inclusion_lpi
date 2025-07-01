# Purpose of this script is to subset the data according to LPI aggregation
library(rlpi)
##For each run, change lpi_data_no_conf to appropriate data sets: lpi_data_no_reps and lpi_data_no_conf_no_reps

##Simplify Class names
lpi_data_no_conf_no_reps$Taxa <- lpi_data_no_conf_no_reps$Class
lpi_data_no_conf_no_reps$Taxa <- gsub("Actinopteri", "Fishes",lpi_data_no_conf_no_reps$Taxa)
lpi_data_no_conf_no_reps$Taxa <- gsub("Coelacanthi", "Fishes",lpi_data_no_conf_no_reps$Taxa)
lpi_data_no_conf_no_reps$Taxa <- gsub("Elasmobranchii", "Fishes",lpi_data_no_conf_no_reps$Taxa)
lpi_data_no_conf_no_reps$Taxa <- gsub("Dipneusti", "Fishes",lpi_data_no_conf_no_reps$Taxa)
lpi_data_no_conf_no_reps$Taxa <- gsub("Petromyzonti", "Fishes",lpi_data_no_conf_no_reps$Taxa)
lpi_data_no_conf_no_reps$Taxa <- gsub("Holocephali", "Fishes",lpi_data_no_conf_no_reps$Taxa)
lpi_data_no_conf_no_reps$Taxa <- gsub("Myxini", "Fishes",lpi_data_no_conf_no_reps$Taxa)
lpi_data_no_conf_no_reps$Taxa <- gsub("Aves", "Birds",lpi_data_no_conf_no_reps$Taxa)
lpi_data_no_conf_no_reps$Taxa <- gsub("Mammalia", "Mammals",lpi_data_no_conf_no_reps$Taxa)
lpi_data_no_conf_no_reps$Taxa <- gsub("Amphibia", "Amphibians",lpi_data_no_conf_no_reps$Taxa)
lpi_data_no_conf_no_reps$Taxa <- gsub("Reptilia", "Reptiles",lpi_data_no_conf_no_reps$Taxa)


##Class
Taxa = lpi_data_no_conf_no_reps$Taxa
Mammalia <- Taxa == 'Mammals'
Aves <- Taxa == 'Birds'
Fishes <- Taxa == 'Fishes'
Amphibians <- Taxa == 'Amphibians'
Reptiles <- Taxa == 'Reptiles'
Herps = Amphibians | Reptiles


## Realms

#Marine
MRealm = lpi_data_no_conf_no_reps$M_realm
M_IPA <- MRealm == 'Tropical and subtropical Indo-Pacific'
M_ATR <- MRealm == 'Atlantic tropical and subtropical'
M_ATE <- MRealm == 'Atlantic north temperate'
M_ARC <- MRealm == 'Arctic'
M_PAC <- MRealm == 'Pacific north temperate'
M_ANT <- MRealm == 'South temperate and Antarctic'

#Terrestrial
TRealm = lpi_data_no_conf_no_reps$T_realm
T_AFT <- TRealm == 'Afrotropical'
T_AUS <- TRealm == 'Australasia'
T_IMY <- TRealm == 'Indo-Malayan'
T_NEA <- TRealm == 'Nearctic'
T_NEO <- TRealm == 'Neotropical'
T_OCN <- TRealm == 'Oceania'
T_PAL <- TRealm == "Palearctic"
T_IPA = T_AUS | T_IMY | T_OCN

#Freshwater
FWRealm = lpi_data_no_conf_no_reps$FW_realm
FW_AFT <- FWRealm == 'Afrotropical'
FW_AUS <- FWRealm == 'Australasia'
FW_IMY <- FWRealm == 'Indo-Malayan'
FW_NEA <- FWRealm == 'Nearctic'
FW_NEO <- FWRealm == 'Neotropical'
FW_OCN <- FWRealm == 'Oceania'
FW_PAL <- FWRealm == 'Palearctic'
FW_IPA = FW_AUS | FW_IMY | FW_OCN


## Systems
System = lpi_data_no_conf_no_reps$System
Terrestrial <- System == 'Terrestrial'
Freshwater <- System == 'Freshwater'
Marine <- System == 'Marine'


## Class by realm & system

#Marine

M_IPA_Fishes = M_IPA & Fishes
M_IPA_Mammalia = M_IPA & Mammalia
M_IPA_Herps = M_IPA & Herps
M_IPA_Aves = M_IPA & Aves
M_ATR_Fishes = M_ATR & Fishes
M_ATR_Mammalia = M_ATR & Mammalia
M_ATR_Herps = M_ATR & Herps
M_ATR_Aves = M_ATR & Aves
M_ATE_Fishes = M_ATE & Fishes
M_ATE_Mammalia = M_ATE & Mammalia
M_ATE_Herps = M_ATE & Herps
M_ATE_Aves = M_ATE & Aves
M_ARC_Fishes = M_ARC & Fishes
M_ARC_Mammalia = M_ARC & Mammalia
M_ARC_Herps = M_ARC & Herps
M_ARC_Aves = M_ARC & Aves
M_PAC_Fishes = M_PAC & Fishes
M_PAC_Mammalia = M_PAC & Mammalia
M_PAC_Herps = M_PAC & Herps
M_PAC_Aves = M_PAC & Aves
M_ANT_Fishes = M_ANT & Fishes
M_ANT_Mammalia = M_ANT & Mammalia
M_ANT_Herps = M_ANT & Herps
M_ANT_Aves = M_ANT & Aves

#Freshwater
FW_AFT_Fishes = FW_AFT & Fishes
FW_AFT_Mammalia = FW_AFT & Mammalia
FW_AFT_Herps = FW_AFT & Herps
FW_AFT_Aves = FW_AFT & Aves
FW_IPA_Fishes = FW_IPA & Fishes
FW_IPA_Mammalia = FW_IPA & Mammalia
FW_IPA_Herps = FW_IPA & Herps
FW_IPA_Aves = FW_IPA & Aves
FW_NEA_Fishes = FW_NEA & Fishes
FW_NEA_Mammalia = FW_NEA & Mammalia
FW_NEA_Herps = FW_NEA & Herps
FW_NEA_Aves = FW_NEA & Aves
FW_NEO_Fishes = FW_NEO & Fishes
FW_NEO_Mammalia = FW_NEO & Mammalia
FW_NEO_Herps = FW_NEO & Herps
FW_NEO_Aves = FW_NEO & Aves
FW_PAL_Fishes = FW_PAL & Fishes
FW_PAL_Mammalia = FW_PAL & Mammalia
FW_PAL_Herps = FW_PAL & Herps
FW_PAL_Aves = FW_PAL & Aves

#Terrestrial
T_AFT_Mammalia = T_AFT & Mammalia
T_AFT_Herps = T_AFT & Herps
T_AFT_Aves = T_AFT & Aves
T_IPA_Mammalia = T_IPA & Mammalia
T_IPA_Herps = T_IPA & Herps
T_IPA_Aves = T_IPA & Aves
T_NEA_Mammalia = T_NEA & Mammalia
T_NEA_Herps = T_NEA & Herps
T_NEA_Aves = T_NEA & Aves
T_NEO_Mammalia = T_NEO & Mammalia
T_NEO_Herps = T_NEO & Herps
T_NEO_Aves = T_NEO & Aves
T_PAL_Mammalia = T_PAL & Mammalia
T_PAL_Herps = T_PAL & Herps
T_PAL_Aves = T_PAL & Aves
