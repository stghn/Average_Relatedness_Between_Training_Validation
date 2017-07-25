## compute relationship within training or testing set
relwithinSet <- function(grm,POP){
  grmmatrix <- grm[POP,POP]
  anim=nrow(grmmatrix)
  Tset <- anim
  animTest <- 1:anim
  avgRel <- matrix(NA,Tset,7)
  colnames(avgRel) <- c("F","relmax","rel5","rel10","rel20","overall_pos","overall")
  #############################################################################
  for (i in 1:Tset){
    F_ALL <- sort(grmmatrix[-i,animTest[i]],decreasing=T)
    f <- F_ALL
    fmax <- max(f); avgRel[i,2] <- fmax
    fmean5 <- round(mean(f[1:5]),digits=5); avgRel[i,3] <- fmean5
    fmean10 <- round(mean(f[1:10]),digits=5); avgRel[i,4] <- fmean10
    fmean20 <- round(mean(f[1:20]),digits=5); avgRel[i,5] <- fmean20
    f2 <- f[which(f>=0)]
    overall_rel <- round(mean(f2),digits=5);  avgRel[i,6] <- overall_rel
    overall <- round(mean(f),digits=5);  avgRel[i,7] <- overall
    Fi <-  max(grmmatrix[,animTest[i]]); avgRel[i,1] <- Fi
  }
  return(avgRel)
}

## compute relationship between training and testing set
################################################################################
relbtnSet <- function(grm,REFPOP){
  grmmatrix <- grm
  anim=nrow(grmmatrix)
  Tset <- anim-length(REFPOP)
  sampanim <- 1:anim
  animTest <- sampanim[!sampanim %in% REFPOP] #(ref+1):anim
  avgRel <- matrix(NA,Tset,7)
  colnames(avgRel) <- c("F","relmax","rel5","rel10","rel20","overall_pos","overall")
  #############################################################################
  for (i in 1:Tset){
    F_ALL <- sort(grmmatrix[REFPOP,animTest[i]],decreasing=T)
    f <- F_ALL
    fmax <- max(f); avgRel[i,2] <- fmax
    fmean5 <- round(mean(f[1:5]),digits=5); avgRel[i,3] <- fmean5
    fmean10 <- round(mean(f[1:10]),digits=5); avgRel[i,4] <- fmean10
    fmean20 <- round(mean(f[1:20]),digits=5); avgRel[i,5] <- fmean20
    f2 <- f[which(f>=0)]
    overall_rel <- round(mean(f2),digits=5);  avgRel[i,6] <- overall_rel
    overall <- round(mean(f),digits=5);  avgRel[i,7] <- overall
    Fi <-  max(grmmatrix[,animTest[i]]); avgRel[i,1] <- Fi
  }
  return(avgRel)
  
  ###########################################################################
  # ## similar to the above estiate except 
  # avgRelREG <- matrix(NA,Tset,3)
  # colnames(avgRelREG) <- c("rel5exl","rel10exl","overallexcl")
  # ##########################################################################
  # for (i in 1:Tset){
  #   F_ALL <- sort(grmmatrix[REFPOP,animTest[i]],decreasing=T)
  #   f <- F_ALL
  #   fmean5 <- round(mean(f[2:6]),digits=5);avgRelREG[i,1] <- fmean5
  #   fmean10 <- round(mean(f[7:11]),digits=5); avgRelREG[i,2] <- fmean10
  #   f2 <- f[which(f>=0)]
  #   overall <- round(mean(f2[-1:-11]),digits=5);avgRelREG[i,3] <- overall
  # }
  # ##########################################################################
  # return(cbind(avgRel,avgRelREG))
}
