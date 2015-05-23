
## HOMEWORK No 3

makeCacheMatrix <- function(x = matrix()) {
  ## 'x' is a square invertible matrix
  ## return: a list containing functions to 
  ##  1. Set the matrix
  ##  2. get the matrix
  ##  3. set the inverse
  ##  4. get the inverse
  inv <- NULL
  set <- function(y) {
  ## use `<<-` to assign a value to an object in an environment different from the current environment.  
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinv <- function(inverse) inv <<- inverse
  getinv <- function() inv
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}

cacheSolve <- function(x, ...) {
  ## Output of makeCacheMatrix()
  ## return: inverse of the original matrix that was input to makeCacheMatrix()
  inv <- x$getinv()
  ## if the inverse has been calcualted
  if(!is.null(inv)) {
    ## it should get the inverse from the cache and skips th computation
    message("getting cached data")
    return(inv)
  }
  ## If inverse is not calcualted yet, calculates de Inverse
  mat.data <- x$get()
  inv <- solve(mat.data, ...)
  ## it sets the value of the inverse in the cache via the setinv function.
  x$setinv(m)
  return(inv)
  ## It will return the inverse of the matrix
}


## Sample run:
#x = rbind(c(1, 2, 3), c(0, 1, 4), c(5, 6, 0))
#m = makeCacheMatrix(x)
#m$get()
## No cache in the first run
#> cacheSolve(m)
#[,1] [,2] [,3]
#[1,]  -24   18    5
#[2,]   20  -15   -4
#[3,]   -5    4    1
## Retrieving from the cache in the second run
#> cacheSolve(m)
#getting cached data
#$set
#function (y) 
#{
#  x <<- y
#  inv <<- NULL
#}
#<environment: 0x10516cdc0>
  
#  $get
#function () 
#  x
#<environment: 0x10516cdc0>
  
#  $setinv
#function (inverse) 
#  inv <<- inverse
#<environment: 0x10516cdc0>
  
#  $getinv
#function () 
#  inv
#<environment: 0x10516cdc0>