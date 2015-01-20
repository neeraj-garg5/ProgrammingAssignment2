## Put comments here that give an overall description of what your
## functions do
## These functions calcualte an inverse of a matrix and cache it. 
## This helps to avoid faster computation for large datasets. 

## Write a short comment describing this function
## This function when called creates an inverse of matrix and 
## stores the matrix in another environment 
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmatrix <- function(solve) m <<- solve
  getmatrix <- function() m
  list(set = set, get = get,
       setmatrix = setmatrix,
       getmatrix = getmatrix)
}


## Write a short comment describing this function
## This function checks if the inverse of a matrix already exists, if yes
## then returns the same else it creates the same
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getmatrix()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  matrix <- x$get()
  m <- solve(matrix, ...)
  x$setmatrix(m)
  m
}