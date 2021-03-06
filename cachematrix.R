## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix and cacheSolve are used to calculate the inverted matrix of a 
## given matrix. They can be used so the inverted matrix is stored in a cache
## so it doesn't have to be calculated again if the function is called a second
## time.


## makeCacheMatrix receives a matrix as argument and returns a list with
## the following functions: set the matrix value, get the matrix value, set the
## inverted matrix and get the inverted matrix

makeCacheMatrix <- function(x = matrix()) {
  inverted <- NULL
  set <- function(y) {
    x <<- y
    inverted <<- NULL
  }
  get <- function() x
  setinv <- function(inv) inverted <<- inv
  getinv <- function() inverted
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
  
  
}


## cacheSolve receives the list generated by makeCacheMatrix as argument and
## returns a matrix with the value of the inverted matrix. If the inverted
## matrix has been calculated already it returns it from the cache instead of 
## running solve again

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverted <- x$getinv()
  if(!is.null(inverted)) {
    message("getting cached data")
    return(inverted)
  }
  data <- x$get()
  inverted <- solve(data, ...)
  x$setinv(inverted)
  inverted
}
