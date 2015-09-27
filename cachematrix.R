############################################################################
## Put comments here that give an overall description of what yourvfunctions do
## Caching the Inverse of a Matrix
## Matrix inversion is usually costly computation and there is some benefits to caching the inverse
## of a matrix rather than compute it repeatedly. 
##
## Write a short comment describing this function:
## makeCacheMatrix creates a sepcial matrix object that can cache its inverse 
## Computing the inverse of a square matrix can be donde with solve() function in R. 
## solve() function solves equation a %*% x = b for x, where b is a vector or matrix.
## Get the inverse of a matrix X:
## solve(x) %*% x
## 
## makeCacheMatrix creates a list containing a function to
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of inverse of the matrix
## 4. get the value of inverse of the matrix
########################################################

makeCacheMatrix <- function(x = matrix()) {
  inv_mat <- NULL
  set <- function(y){
    x <<- Y
    inv_mat <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) inv_mat <<- solve
  getinverse <- function() inv_mat
  list(set=set, get=get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function
## CacheSolve, computes the inverse of the scpecial "matrix" returned by makeCahceMatrix
## First checks if the inverse has been already been calculated then the cachesolve 
## should retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv_mat <- x$getinverse()
  if(!is.null(inv_mat)){
    message("getting cached data")
    return(inv_mat)
  }
  matrix <- x$get()
  inv_mat <- solve(matrix, ...)
  x$setinverse(inv_mat)
  inv_mat
}
