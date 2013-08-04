BASIX.unique <- function(matrix, large.columns=TRUE){

if(length(rownames(matrix))==0){
   rownames(matrix) <- 1:dim(matrix)[1] 
}

if(large.columns){
ids    <- .Call("my_unique_C",matrix, PACKAGE="BASIX")
matrix <- matrix[!ids,]
}else{
matrix <- unique(matrix)
}

return(matrix)


}

