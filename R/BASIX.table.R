BASIX.table <- function(matrix){

if(length(rownames(matrix))==0){
   rownames(matrix) <- 1:dim(matrix)[1]
}

ids          <- .Call("my_unique_C",matrix, PACKAGE="BASIX")
uniquematrix <- matrix[!ids,]
freqs        <- .Call("C_get_sfreqh_C",uniquematrix,matrix, PACKAGE="BASIX")

names(freqs) <- rownames(uniquematrix)

return(freqs)


}
