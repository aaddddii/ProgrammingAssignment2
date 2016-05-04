 ## This function creates a special matrix which caches the inverse
 

 makeCacheMatrix <- function(x = matrix()) {
+ m <- NULL
+  set <- function(y){   ##assining the value of y to x
+    x <<- y
+    m <<- NULL
+  }
+  get <- function() x   ##return the matrix x
+  setsolve <- function(solve) m <<- solve       ##assining the variable solve to m
+  getsolve <- function() m      ## returning m
+  list(set=set, get=get, setsolve=setsolve, getsolve=getsolve)  ##create a list with all functions
 
 }
 
 
+## This function computes the Inverse of the matrix. 
+## If the matrix have already been computed, it retrieves the inverse from the cache.
 
 cacheSolve <- function(x, ...) {
-        ## Return a matrix that is the inverse of 'x'
+        m <- x$getsolve()
+                if(!is.null(m)){ ##If m isn't NULL m gets cached
+                        message("getting cached data")
+                        return(m)
+                 }
+         matrix <- x$get()      ## matrix from 'makeCacheMatrix' get's saved in 'matrix'
+         m <- solve(matrix, ...)
+        x$setsolve(m)   ##Calculate the inverse of x
+        m       ## Return a matrix that is the inverse of 'x'
 }
