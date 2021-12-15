## Average Relatedness between training and testing set  

### The script compute average relatedness between reference (training) and validation (testing) population  

### R-script "relatedness.R"  
- Two main functions: 
     - **relwithinSet** function computes relatedness within a set of animals (with training and testing)  
     - **relbtnSet** function computes relatedness between two groups (e.g. BETWEEN training and testing) 
     
- Both of these functions require the following argument  
     - **grm** : Genomic relationship matrix (GRM) in matrix format (This is suppose to be an R-object and use example script to convert to matrix format if GRM is in triplet format)
     - **POP** : a vector of rownames or colnames (this argument is used for **relwithinSet** function)  
     - **REFPOP** : a vector of rownames or colnames for the training set [NOT the testing set] (this argument is used for **relbtnSet** function)

#### Example run (see "averageREL.R" to run the example file)  
 
 ```R
   source('relatedness.R')  ## Executing source function to load R script
   REFkinship <- relwithinSet(grm=grm_matrix,POP=refHDP)    ## To compute relatedness WITHIN training OR testing set
   VALkinship <- relbtnSet(grm=grm_matrix,REFPOP=refHDP)    ## To compute relatedness BETWEEN training and testing set
```
  
#### Output of the example run 
An R object with the following headers: 
  - **F**: Diagonal element for animal i (1+F)  
  - **relmax**: Maximum relationship between animal i and all other animals within a group (training) or between groups (training and testing set)  
  - **rel5**: Mean of top 5 relationships between animal i and all other animals within a group or between groups  
  - **rel10**: Mean of top 10 relationships between animal i and all other animals within a group or between groups   
  - **rel20**: Mean of top 20 relationships between animal i and all other animals within a group or between groups   
  - **overall_pos**: Mean of all positive relationships between animal i and all other animals within a group or between groups   
  - **overall**: Mean of all relationships between animal i and all other animals within a group or between groups   
    
