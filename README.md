## Average Relatedness between training and testing set  

### The script compute average relatedness between reference (training) and validation (testing) population  

### R-script "relatedness.R"  
      - Two main functions ("relwithinSet" and "relbtnSet")  
      - relwithinSet : compute relatedness within a set of animals (with training and testing)  
      - relbtnSet : compute relatedness between two groups (e.g. BETWEEN training and testing)  

### Requirement  
      - Genomic relationship matrix in matrix format (use example script to convert to matrix format if grm is in row-columnwise format)   
      - ID list linking training and testing set to the genomic relationship matrix  

## Both "relwithinSet" and "relbtnSet" script require the following argument  
      - grm : grm in matrix format  (This is suppose to be an R-object)
      - POP : a vector of rownames or colnames (this argument is used for "relwithinSet" function)  
      - REFPOP : a vector of rownames or colnames for the training set [NOT the testing set] (this argument is used for "relbtnSet" function)  

## Example run  (see "averageREL.R" to run the example file)  
      - source('relatedness.R')  

          ## To compute relatedness WITHIN training OR testing set  
      - REFkinship <- relwithinSet(grm=grm_matrix,POP=refHDP)  

          ## To compute relatedness BETWEEN training and testing set  
      - VALkinship <- relbtnSet(grm=grm_matrix,REFPOP=refHDP)  
 
 
## Output  
An R object with the headers  
      - F           :: The diagonal element for animal i (1+F)  
      - relmax      :: The maximum relationship between animal i and all other animals within a group (e.g. training) or between groups (e.g. between training and testing set)   
      - rel5        :: The mean of top 5 relationships between animal i and all other animals within a group (e.g. training) or between groups (e.g. between training and testing set)  
      - rel10       ::The mean of top 10 relationships between animal i and all other animals within a group (e.g. training) or between groups (e.g. between training and testing set)  
      - rel20       ::The mean of top 20 relationships between animal i and all other animals within a group (e.g. training) or between groups (e.g. between training and testing set)  
      - overall_pos :: The mean of all positive relationships between animal i and all other animals within a group (e.g. training) or between groups (e.g. between training and testing set)  
      - overall     :: The mean of all relationships between animal i and all other animals within a group (e.g. training) or between groups (e.g. between training and testing set)  
    
