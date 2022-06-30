## Functions written in partial fulfillment of Coursera R Programming Week3 Assignment; Github user: ChrisJJJ000

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {#This function creates a "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {##define the argument with "matrix"
  m<-NULL                                  ##initialize m as NULL
                                          
                                           
  set<-function(y){                         ##define the set function to assign new
    x<<-y                                   ##value of matrix in parent environment 
    m<-NULL                                 ## if there is a new matrix, reset m to NULL
  }
  get<-function()x                          ##define the get function 
  setinverse<-function(inverse) m<<-inverse ##assign value of m in parent environment 
  getinverse<-function() m                  ##get the value of m 
  list(set=set,get=get,setinverse=setinverse,getinverse=getinverse) ##needed to refer to the functions with the $ operator 


}


## This function computes the inverse of the "matrix" returned by makeCacheMatrix above

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m<-x$getinverse()
        if(!is.null(m)){
          message("getting cached data")
          return(m)
        }
        data<-x$get()
        m<-solve(data,...)
        x$setinverse(m)
        m
}
