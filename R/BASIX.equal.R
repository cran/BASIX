BASIX.equal <- function(a,b){

eq <- .Call("Ccompare",a,b,PACKAGE="BASIX")
eq <- as.logical(eq)
return(eq)

}
