## Original code written by Toszogyova et al and edited in line 22 to retain orginal ID numbers from the LPD so that time-series which have been split can be identified
# function for removing zero values from the data and for counting zero values
# tabulka is data.frame (rows: populations, columns: Binomial, ID, Realm, year, popvalue) for each ecosystem
# $zeros - the number of zeros
# $tabulka_no0 - data without zeros (remove_mid=T -- removed middle zeros)
remove_zeros <- function(tabulka, remove_mid=T, rename_pops = TRUE) {
  tab2 <- NULL
  beg0 <- 0 # the number of zero values at the beginning of the time series
  end0 <- 0 # the number of zero values at the end of the time series
  mid0 <- 0 # the number of zero values in the middle of the time series
  beg <- 0 # the number of beginnings with zeros
  end <- 0 # the number of ends with zeros
  mid.beg <- 0 # the number of middle beginnings with zeros
  mid.end <- 0 # the number of middle ends with zeros (the same number as mid.beg)
  remove_mid = remove_mid # middle zeros will be removed
  IDok <- which(unique(tabulka$ID) > 1000000) # check if IDs are below this value
  if(length(IDok) > 0) {print("there is a ID value > 1mil, change it")}
  for (i in 1:length(unique(tabulka$ID))) {
    index <- unique(tabulka$ID)[i]
    tab <- tabulka[which(tabulka$ID==index),]
    ## RF: retain original ID
    #tab$orig_id = tab$ID
    if (sum(duplicated(tab$year)) > 0) {print(paste("year has more records in the population:",index))}
    max.year <- max(tab$year)
    min.year <- min(tab$year)
    step <- 1
    if (tab$popvalue[which(tab$year==max.year)] == 0) { # if there is a zero value at the end of the time series
      step <- 2
      maxpred <- sort(tab$year,decreasing=T)[step]
      while (tab$popvalue[which(tab$year == maxpred)] == 0) {
        step <- step + 1
        maxpred <- sort(tab$year,decreasing=T)[step]
      }
    } # maxpred = the first non-zero year from the end
    if (step > 2) { # if there are more than 1 zero
      maxpred <- sort(tab$year,decreasing=T)[2:(step-1)]
    } else {
      maxpred <- NULL
    }
    if (step > 1) {end <- end + 1}
    step <- 1
    if (tab$popvalue[which(tab$year==min.year)] == 0) { # if there is a zero value at the beginning of the time series
      step <- 2
      minpo <- sort(tab$year,decreasing=F)[step]
      while (tab$popvalue[which(tab$year==minpo)] == 0) {
        step <- step + 1
        minpo <- sort(tab$year,decreasing=F)[step]
      }
    } # minpo = the first non-zero year from the beginning
    if (step > 2) { # if there are more than 1 zero
      minpo <- sort(tab$year,decreasing=F)[2:(step-1)]
    } else {
      minpo <- NULL
    }
    if (step > 1) {beg <- beg + 1}
    where0 <- which(tab$popvalue==0)
    if (length(where0) > 0) {
      for (ii in where0) {
        if (tab$year[ii]==max.year | tab$year[ii]==min.year | tab$year[ii]%in%maxpred | tab$year[ii]%in%minpo) {
          if(tab$year[ii]==max.year | tab$year[ii]%in%maxpred) {end0 <- end0 + 1}
          if(tab$year[ii]==min.year | tab$year[ii]%in%minpo) {beg0 <- beg0 + 1}
          tab$popvalue[ii] <- NA
        } else {
          if(remove_mid == T){
            mid0 <- mid0 + 1
            dividing_year <- tab$year[ii]
            if (rename_pops) {
              tab$ID[which(tab$year>dividing_year)] <- tab$ID[which(tab$year>dividing_year)] + 1000000 # create new unique ID
            } else {
              tab$ID[which(tab$year>dividing_year)] <- tab$ID[which(tab$year>dividing_year)] ##+ 1000000 # create new unique ID
            }     
            tab$popvalue[ii] <- NA
          }
        }
      }
      tab3 <- tab[which(!is.na(tab$popvalue)),]
      pops <- length(unique(tab3$ID))
      mid.beg <- mid.beg + (pops - 1)
      mid.end <- mid.end + (pops - 1)
    }
    tab2 <- rbind(tab2,tab)
  }
  tab2 <- tab2[which(!is.na(tab2$popvalue)),]
  zeros <- data.frame(beg0=beg0, end0=end0, mid0=mid0, beg=beg, end=end, mid.beg=mid.beg, mid.end=mid.end)
  return(list(zeros=zeros, tabulka_no0=tab2))
}