## The following code provides some validation steps to check zero removal worked as expected
library(data.table)
library(dplyr)
library(tidyr)
library(stringr)
library(patchwork)

####The following creates the summaries of data removal (Table 1, Table S3)
###SUMMARY AFTER TOSZ APPROACH TO ZERO REMOVAL
#Create list of files after zero removal
pop_files_tosz_origID = list.files("~/rlpi_code_tosz_keepIDs_no_conf", pattern = "*_pops.txt", full.names = TRUE)
list_tosz_origID = list()
for (f in pop_files_tosz_origID) {
  print(sprintf("Processing: %s", f))
  pops_subset = read.table(f, header = TRUE)
  list_tosz_origID[[f]] = pops_subset
}

#Create dataframe from the list - long and summarise to create a short dataframe
all_pops_tosz_origID_df_long = rbindlist(list_tosz_origID, idcol = "filename")
all_pops_tosz_origID_df = all_pops_tosz_origID_df_long %>% 
  filter(startsWith(basename(filename), "T_") | startsWith(basename(filename), "FW_") | startsWith(basename(filename), "M_")) %>% 
  group_by(filename, Binomial, ID,orig_id) %>%
  summarise(dp_number = n())

##Numbers of pops by dp after zero removal
table_tosz_pops_by_dp <- all_pops_tosz_origID_df %>%
  dplyr::group_by(filename, dp_number) %>% 
  dplyr::summarise(orig_id=length(unique(orig_id)),ID=length(unique(ID)))
table_tosz_pops_by_dp_simple <- all_pops_tosz_origID_df %>%
  dplyr::group_by(dp_number) %>% 
  dplyr::summarise(orig_id=length(unique(orig_id)),ID=length(unique(ID)))

table_tosz_pops <- all_pops_tosz_origID_df %>% 
  dplyr::group_by(filename) %>% 
  dplyr::summarise(orig_id=length(unique(orig_id)),ID=length(unique(ID))) 
table_tosz_pops$filename <- str_remove(table_tosz_pops$filename,"~/rlpi_code_tosz_keepIDs_no_conf/")
table_tosz_pops$filename <- str_remove(table_tosz_pops$filename,"_pops.txt")
table_tosz_pops <- separate(table_tosz_pops,filename,into = c("system","realm","taxa"),sep = "_")

#filter pops after zero removal to only 5dp
  all_pops_tosz_origID_dp5_df = filter(all_pops_tosz_origID_df,dp_number >=5)
##Numbers by dp after zero removal and dp<5 removal
table_tosz_pops_by_dp_dp5 <- all_pops_tosz_origID_dp5_df %>%
  dplyr::group_by(filename, dp_number) %>% 
  dplyr::summarise(orig_id=length(unique(orig_id)),ID=length(unique(ID)))
table_tosz_pops_by_dp_dp5_simple <- all_pops_tosz_origID_dp5_df %>%
  dplyr::group_by(dp_number) %>% 
  dplyr::summarise(orig_id=length(unique(orig_id)),ID=length(unique(ID)))

table_tosz_pops_dp5 <- all_pops_tosz_origID_dp5_df %>% 
  dplyr::group_by(filename) %>% 
  dplyr::summarise(orig_id=length(unique(orig_id)),ID=length(unique(ID)))
table_tosz_pops_dp5$filename <- str_remove(table_tosz_pops_dp5$filename,"~/rlpi_code_tosz_keepIDs_no_conf/")
table_tosz_pops_dp5$filename <- str_remove(table_tosz_pops_dp5$filename,"_pops.txt")
table_tosz_pops_dp5 <- separate(table_tosz_pops_dp5,filename,into = c("system","realm","taxa"),sep = "_")

###SUMMARY BEFORE ZERO REMOVAL
#Create list of files before zero removal
pop_files_no_conf = list.files("~/rlpi_code_no_conf", pattern = "*_pops.txt", full.names = TRUE)
list_no_conf = list()
for (f in pop_files_no_conf) {
  print(sprintf("Processing: %s", f))
  pops_subset = read.table(f, header = TRUE)
  list_no_conf[[f]] = pops_subset
}
#Create dataframe from the list - long and summarise to create a short dataframe
all_pops_no_conf_df_long = rbindlist(list_no_conf, idcol = "filename")
all_pops_no_conf_df = all_pops_no_conf_df_long %>% 
  filter(startsWith(basename(filename), "T_") | startsWith(basename(filename), "FW_") | startsWith(basename(filename), "M_")) %>% 
  group_by(filename, Binomial, ID) %>%
  summarise(dp_number = n())
#Numbers of pops by dp before zero removal
table_no_conf_pops_by_dp <- all_pops_no_conf_df %>%
  dplyr::group_by(filename, dp_number) %>% 
  dplyr::summarise(pop_number=n())
table_no_conf_pops_by_dp_simple <- all_pops_no_conf_df %>%
  dplyr::group_by(dp_number) %>% 
  dplyr::summarise(pop_number=n())

table_no_conf_pops <- all_pops_no_conf_df %>% 
  dplyr::group_by(filename) %>% 
  dplyr::summarise(n=n())
table_no_conf_pops$filename <- str_remove(table_no_conf_pops$filename,"~/rlpi_code_no_conf/")
table_no_conf_pops$filename <- str_remove(table_no_conf_pops$filename,"_pops.txt")
table_no_conf_pops <- separate(table_no_conf_pops,filename,into = c("system","realm","taxa"),sep = "_")

####COMPARE POP NUMBERS AFTER EACH STEP#######
table_pops_compare <- left_join(table_no_conf_pops,table_tosz_pops,by = join_by(system,realm,taxa))
table_pops_compare <- rename(table_pops_compare, Original_no_conf = n,Tosz_orig_id = orig_id,Tosz_new_id = ID)
table_pops_compare <- left_join(table_pops_compare,table_tosz_pops_dp5,by = join_by(system,realm,taxa))
table_pops_compare <- rename(table_pops_compare, Tosz_dp5_orig_id = orig_id,Tosz_dp5_new_id = ID)
table_pops_compare$Pops_removed_Tosz <- table_pops_compare$Original_no_conf - table_pops_compare$Tosz_orig_id
table_pops_compare$Pops_removed_Tosz_dp5 <- table_pops_compare$Original_no_conf - table_pops_compare$Tosz_dp5_orig_id
table_pops_compare$Perc_removed_Tosz_dp5 <- 100*((table_pops_compare$Original_no_conf - table_pops_compare$Tosz_dp5_orig_id)/table_pops_compare$Original_no_conf)
table_pops_compare[23,7:8] = 0 #quick fixes to change NAs to correct values for M_ANT_herps
table_pops_compare[23,10] = 4
table_pops_compare[23,11] = 100
setwd("~Data_summary/")
write.csv(table_pops_compare,"Pop_numbers_compared_by_subset.csv")
#Plot this into bar graphs for each subset
table_pops_compare_long <- pivot_longer(table_pops_compare,cols = c("Original_no_conf","Tosz_dp5_orig_id"),values_to = "Pop_count" )
plot_M_PAC <- ggplot(table_pops_compare_long, aes(x = taxa)) +
  geom_bar(
    data = subset(table_pops_compare_long,system == "M" & realm == "PAC"),
    aes(y = Pop_count, fill = name),
    stat = "identity",
    position = "dodge") +
  xlab("Taxa") + 
  ylab("Number of populations") +
  ggtitle("Pacific north temperate") +
  theme_minimal() +
  theme(legend.position = "none")
(plot_FW_AFT | plot_FW_IPA | plot_FW_NEA) / (plot_FW_NEO | plot_FW_PAL | plot_spacer()) + plot_annotation(title = "Freshwater")
ggsave("Freshwater_pop_diff.pdf", width = 12, height = 8)
ggsave("Freshwater_pop_diff.png", width = 12, height = 8)
(plot_T_AFT | plot_T_IPA | plot_T_NEA) / (plot_T_NEO | plot_T_PAL | plot_spacer()) + plot_annotation(title = "Terrestrial")
ggsave("Terrestrial_pop_diff.pdf", width = 12, height = 8)
ggsave("Terrestrial_pop_diff.png", width = 12, height = 8)
(plot_M_ANT | plot_M_ARC | plot_M_ATE) / (plot_M_ATR | plot_M_IPA | plot_M_PAC) + plot_annotation(title = "Marine")
ggsave("Marine_pop_diff.pdf", width = 12, height = 8)
ggsave("Marine_pop_diff.png", width = 12, height = 8)

#Diffs for each realm
table_FW_pops_compare <- subset(table_pops_compare,system == "FW") %>%
  dplyr::group_by(realm) %>% 
  dplyr::summarise(pop_count_orig=sum((Original_no_conf)),pop_count_Tosz=sum(Tosz_dp5_orig_id)) %>%
  tidyr::pivot_longer(cols = c("pop_count_orig","pop_count_Tosz"),values_to = "Pop_count" )
table_T_pops_compare <- subset(table_pops_compare,system == "T") %>%
  dplyr::group_by(realm) %>% 
  dplyr::summarise(pop_count_orig=sum((Original_no_conf)),pop_count_Tosz=sum(Tosz_dp5_orig_id)) %>%
  tidyr::pivot_longer(cols = c("pop_count_orig","pop_count_Tosz"),values_to = "Pop_count" )
table_M_pops_compare <- subset(table_pops_compare,system == "M") %>%
  dplyr::group_by(realm) %>% 
  dplyr::summarise(pop_count_orig=sum((Original_no_conf)),pop_count_Tosz=sum(Tosz_dp5_orig_id)) %>%
  tidyr::pivot_longer(cols = c("pop_count_orig","pop_count_Tosz"),values_to = "Pop_count" )
ggplot(table_FW_pops_compare, aes(x = realm)) +
  geom_bar(
    data = table_FW_pops_compare,
    aes(y = Pop_count, fill = name),
    stat = "identity",
    position = "dodge") +
  xlab("Realm") + 
  ylab("Number of populations") +
  scale_x_discrete(labels = c("Afrotropical","Indo-Pacific","Nearctic","Neotropical","Palearctic"))+
  ggtitle("Freshwater") +
  theme_minimal() +
  theme(legend.position = "none")
ggsave("Freshwater_realm_diff.pdf", width = 12, height = 8)
ggsave("Freshwater_realm_diff.png", width = 12, height = 8)
ggplot(table_T_pops_compare, aes(x = realm)) +
  geom_bar(
    data = table_T_pops_compare,
    aes(y = Pop_count, fill = name),
    stat = "identity",
    position = "dodge") +
  xlab("Realm") + 
  ylab("Number of populations") +
  scale_x_discrete(labels = c("Afrotropical","Indo-Pacific","Nearctic","Neotropical","Palearctic"))+
  ggtitle("Terrestrial") +
  theme_minimal() +
  theme(legend.position = "none")
ggsave("Terrestrial_realm_diff.pdf", width = 12, height = 8)
ggsave("Terrestrial_realm_diff.png", width = 12, height = 8)

ggplot(table_M_pops_compare, aes(x = realm)) +
  geom_bar(
    data = table_M_pops_compare,
    aes(y = Pop_count, fill = name),
    stat = "identity",
    position = "dodge") +
  xlab("Realm") + 
  ylab("Number of populations") +
  scale_x_discrete(labels = c("South temperate & Antarctic","Arctic","Atlantic north temperate","Atlantic tropical & subtropical","Tropical & subtropical IndoPacific","Pacific north temperate"))+
  ggtitle("Marine") +
  theme_minimal() +
  theme(legend.position = "none")
ggsave("Marine_realm_diff.pdf", width = 12, height = 8)
ggsave("Marine_realm_diff.png", width = 12, height = 8)

###COMPARE CHANGES IN DISTRIBUTION OF POP NUMBERS PER DATA POINT
table_pops_by_dp_compare <- left_join(table_no_conf_pops_by_dp_simple,table_tosz_pops_by_dp_simple,by = join_by(dp_number))
table_pops_by_dp_compare <- rename(table_pops_by_dp_compare, Original_no_conf = pop_number,Tosz_orig_id = orig_id,Tosz_new_id = ID)
table_pops_by_dp_compare <- left_join(table_pops_by_dp_compare,table_tosz_pops_by_dp_dp5_simple,by = join_by(dp_number))
table_pops_by_dp_compare <- rename(table_pops_by_dp_compare, Tosz_dp5_orig_id = orig_id,Tosz_dp5_new_id = ID)
table_pops_by_dp_compare$OrigID_change_Tosz <- table_pops_by_dp_compare$Tosz_orig_id - table_pops_by_dp_compare$Original_no_conf
table_pops_by_dp_compare$NewID_change_Tosz <- table_pops_by_dp_compare$Tosz_new_id - table_pops_by_dp_compare$Original_no_conf
table_pops_by_dp_compare$Perc_origID_Tosz <- 100*((table_pops_by_dp_compare$Tosz_orig_id - table_pops_by_dp_compare$Original_no_conf)/table_pops_by_dp_compare$Original_no_conf)
table_pops_by_dp_compare$Perc_newID_Tosz <- 100*((table_pops_by_dp_compare$Tosz_new_id - table_pops_by_dp_compare$Original_no_conf)/table_pops_by_dp_compare$Original_no_conf)
write.csv(table_pops_by_dp_compare,"Pop_number_change_by_dp.csv")
#Plotting
table_pops_by_dp_compare_plot_counts <- pivot_longer(table_pops_by_dp_compare,cols = c("NewID_change_Tosz","OrigID_change_Tosz"),values_to = "Difference" )
ggplot(table_pops_by_dp_compare_plot_counts,aes(x = dp_number,y = Difference,fill = name)) +
  geom_bar(stat = "identity", position = "dodge2") + 
  xlab("Number of data points") + 
  ylab("Difference in pop number")

table_pops_by_dp_compare_plot_perc <- pivot_longer(table_pops_by_dp_compare,cols = c("Perc_newID_Tosz","Perc_origID_Tosz"),values_to = "Perc_change" )
table_pops_by_dp_compare_plot_perc <- table_pops_by_dp_compare_plot_perc %>%
  mutate(
    value_scaled = ifelse(Perc_change < 100, Perc_change * 1000, Perc_change),  # Scale larger values
    axis = ifelse(Perc_change < 100, "Secondary", "Primary")  # Define axis assignment
  )

ggplot(table_pops_by_dp_compare_plot_perc, aes(x = dp_number)) +
geom_bar(
  data = subset(table_pops_by_dp_compare_plot_perc,axis == "Primary"),
  aes(y = Perc_change, fill = name),
  stat = "identity",
  position = "dodge",
) +
  geom_bar(
    data = subset(table_pops_by_dp_compare_plot_perc,axis == "Secondary"),
    aes(y = value_scaled, fill = name),
    stat = "identity",
    position = "dodge"
  ) +
  scale_y_continuous(
    name = "Percent diff in pop number",
    sec.axis = sec_axis(~ . / 1000, name = "Percent diff in pop number (/1000)")  # Transform secondary axis
  ) +
  labs(x = "Number of data points")+
  theme_minimal() +
  theme(legend.position = "top")+
  scale_fill_discrete(name = "Population count", labels = c("New IDs (split)", "Original IDs"))
ggsave("~/Data_summary/Dp_distribution_change.pdf", width = 12, height = 8)
ggsave("~/Data_summary/Dp_distribution_change.png", width = 12, height = 8)
 

##Also compare what happens to each original ID
write.csv(all_pops_df,"all_pops_df.csv")
write.csv(all_pops_no_zero_df,"all_pops_no_zero_df.csv")
write.csv(all_pops_no_zero_dp5_df,"all_pops_no_zero_dp5_df.csv")

############
############
##Did the zero position analysis work as expected? 
#Check this by counting number of zeros in each subset (no end and no mid) and compare to the summary of how many zeros in each position in the entire data set
##Middle zeros removed
#read in pops files
pop_files_tosz_no_mid = list.files("~/rlpi_code_tosz_no_mid_no_conf", pattern = "*_pops.txt", full.names = TRUE)
#create a list and populate with pop subsets
list_tosz_no_mid = list()
for (f in pop_files_tosz_no_mid) {
  print(sprintf("Processing: %s", f))
  pops_subset = read.table(f, header = TRUE)
  list_tosz_no_mid[[f]] = pops_subset
}
#combine list into long dataframe
all_pops_tosz_no_mid_df_long = rbindlist(list_tosz_no_mid, idcol = "filename")
#count number of zeros
Mid_zero_removed <- sum(all_pops_tosz_no_mid_df_long$popvalue =='0') #3871 zeros remaining

##End zeros removed
#read in pops files
pop_files_tosz_no_end = list.files("~/rlpi_code_tosz_no_end_no_conf", pattern = "*_pops.txt", full.names = TRUE)
#create a list and populate with pop subsets
list_tosz_no_end = list()
for (f in pop_files_tosz_no_end) {
  print(sprintf("Processing: %s", f))
  pops_subset = read.table(f, header = TRUE)
  list_tosz_no_end[[f]] = pops_subset
}
#combine list into long dataframe
all_pops_tosz_no_end_df_long = rbindlist(list_tosz_no_end, idcol = "filename")
#count number of zeros
End_zero_removed <- sum(all_pops_tosz_no_end_df_long$popvalue =='0') #2561 zeros remaining

##Compare to number of zeros in dataset
Global_Tosz$zeros$mid0 - End_zero_removed ##should equal 0
(Global_Tosz$zeros$beg0 + Global_Tosz$zeros$end0) - Mid_zero_removed ##should equal 0

##All zeros removed - Tosz
#read in pops files
pop_files_tosz = list.files("~/rlpi_code_tosz_no_conf", pattern = "*_pops.txt", full.names = TRUE)
#create a list and populate with pop subsets
list_tosz = list()
for (f in pop_files_tosz) {
  print(sprintf("Processing: %s", f))
  pops_subset = read.table(f, header = TRUE)
  list_tosz[[f]] = pops_subset
}
#combine list into long dataframe
all_pops_tosz_df_long = rbindlist(list_tosz, idcol = "filename")
#count number of zeros
sum(all_pops_tosz_df_long$popvalue =='0') #should equal 0

##All zeros removed - Zero to NA
#read in pops files
pop_files_zeroNA = list.files("~/rlpi_code_ZeroToNA_no_conf", pattern = "*_pops.txt", full.names = TRUE)
#create a list and populate with pop subsets
list_zeroNA = list()
for (f in pop_files_zeroNA) {
  print(sprintf("Processing: %s", f))
  pops_subset = read.table(f, header = TRUE)
  list_zeroNA[[f]] = pops_subset
}
#combine list into long dataframe
all_pops_zeroNA_df_long = rbindlist(list_zeroNA, idcol = "filename")
#count number of zeros
sum(all_pops_zeroNA_df_long$popvalue =='0') #should equal 0

###Check remove zero function identifies correct number of zeros
sum(lpi_data_no_conf_pops$popvalue =='0') #6432 number of zeros in starting data set
Global_Tosz$zeros$beg0 + Global_Tosz$zeros$end0 + Global_Tosz$zeros$mid0 #6432 number of zeros counted by remove zeros function
