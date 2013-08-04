\name{BASIX.unique}

\docType{methods}
\alias{BASIX.unique}


\title{

Extract unique rows of a matrix

}


\description{

\code{BASIX.unique} returns a matrix with duplicate rows removed.

}

\usage{

BASIX.unique(matrix,large.columns=TRUE)

}

\arguments{

  \item{matrix}{a matrix}
  \item{large.columns}{should be switched to \code{TRUE} if the matrix contains only a few columns (~10)}
  
}  

\details{

\code{BASIX.unique} 
is a version of \code{unique} specialized on matrices with a
large number of columns.

The native R solution would be:

\code{unique(matrix)}

and is used if \code{large.columns=FALSE}
}


\examples{

mat <- matrix(0,3,3)
mat[1,1] <- 1

BASIX.unique(mat)

}

\author{Bastian Pfeifer}

\keyword{methods}
