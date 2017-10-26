## the following functions will help cache the inverse of a matrix

## makeCacheMatrix returns a list containing functions to 
## get and set the values of the matrix and its inverse

makeCacheMatrix <- function(x=matrix()){
  m<- NULL
  set <- funtion(y){
    x <<- y
    m <<-NULL
  }
  
  get <- function() x
  setinv <- function(inv) m <- inv
  getinv <- function() m
  list(set = set, get =get , setinv = setinv, 
       getinv = getinv)
}


##cachesolve will calculate the inverse of the matrix using
## makeCacheMatrix

cachesolve <- function(x,...){
  m <- x$getinv()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <-solve(data,...)
  x$setinv(m)
  m
}