grm<-read.table("grm.grm",header=F)
colnames(grm) <- c('ID1','ID2','G')
ids <-unique(c(as.character(unique(grm$ID1)),as.character(unique(grm$ID2)))); 
nInd<-length(ids)

grm_matrix <-matrix(0,nrow=nInd,ncol=nInd)
grm_matrix[as.matrix(grm[,c(1,2)])]<-round(grm[,'G'],8)
grm_matrix[as.matrix(grm[,c(2,1)])]<-round(grm[,'G'],8)

## example 1 : animal 1 to n are the reference animals 
## (this assumes that assuming that the first 171 animals are the reference animals)

refHDP <-1:171 ## the columns or rows of the reference animals

## care must be take to use the correct row or column numbers
########

source('relatedness.R')
REFkinship <- relREF(data=grm_matrix,REFPOP=refHDP)
VALkinship <-reloverall(data=grm_matrix,REFPOP=refHDP)


## example 2 : using the true column IDs of the reference animals
refHDP <-c(1:10,18:36,45:145,175:184,400:430) ## the columns or rows of the reference animals
## care must be take to use the correct row or column numbers

REFkinship <- relREF(data=grm_matrix,REFPOP=refHDP)
VALkinship <-reloverall(data=grm_matrix,REFPOP=refHDP)
