# creating an object   
# maximum length of vector in R 2^31-1 32 bit OS; 
# more than possible in 64bit  numeric 

x <- 62L
x

class(x)

length(x)

# character 
y <- "abc"
y
class(y)
length(y)

# Logical
z <- F
z
class(z)
length(z)

#logical operators
# & logical AND 
# | logical OR 
# >= GREATER THAN EQUAL TO
# <= LESS THAN EQUAL TO 
# == EQUALITY
# !NOT EQUAL TO


2 > 1
b <- (2 > 1) & (3==4)
b
(2 > 1)|(3==5)


#vector (1d array)
#class should be either numeric or character or..otherwise the class will be coerced acc to LCD (LEAST COMMON DENOMINATOR)

a <- c(1,6,3,4) 
a     #NUMERIC VECTOR
class(a)
length(a)

is.vector(a)
is.numeric(a)

#matrics

a <- 1:6
a
a <- c(a, 12,34,65)

a <- 1:6
mat1 <- matrix(a, nrow = 2, ncol = 3)
mat1

?matrix
# help(matrix)
example(matrix)

mat2 <- matrix(1:6,2,3, byrow = TRUE) 
mat2


b <- c(1,0,4,2,-1,1)
mat <- matrix(b,3,2)
mat
class(mat)
is.vector(mat)
is.matrix(mat)

mat[1:3, ]


v <- c(1,0,4,2,-1,1)
v
v <- matrix(v,nrow= 3)
v

##another approaches to create a matrix
a <- 1:20  #a is a vector
class(a)
dim(a) <- c(4,5)
a
class(a)

b <- t(a)
b
help("rm")


b[c(1:3),c(3:4)]


#arrays

a <- array(1:60, dim= c(4,5,4))
a

a <- array(1, dim= c(4,5))
a

# y <- c(1,2,1,2)
# i <- array(y, dim=c(2,2))
# i
# class(i)

# a <- array(1:20, dim= c(4,5))
# a


#cbind and rbind
B <- matrix(c(2,4,3,1,5,7), nrow = 3,ncol=2)
C <- matrix(c(7,4,2,4,6,8), nrow=3,ncol=2)
B
C
cbind(B,C)
rbind(B,C)
        

#dataframe
a <- c("Bob", "Fred", "Barb", "Sue","Jeff")
b <- c(21,18,18,24,36)
c <- data.frame(name= a, age= b)
c



myFirstDataFrame  <- data.frame(name = c("Bob", "Fred", "Barb", "Sue","Jeff","hb"),
                                age = c(21,18,18,24,20,21), 
                                hgt= c(70,67,64,66,72,33),
                                wgt= c(180,156,128,118,202,424),
                                race= c("Cauc", "Af.Am","Af.Am", "Cauc", "Asian","fyu"),
                                year= c("Jr","Fr","Fr","Sr","So","jh"),
                                SAT= c(1080,1210,840,1340,880, 23))
                                
myFirstDataFrame
View(myFirstDataFrame)

head(myFirstDataFrame,2) 

tail(myFirstDataFrame,2)


nrow(myFirstDataFrame)
ncol(myFirstDataFrame)

dim(myFirstDataFrame)

names(myFirstDataFrame)
colnames(myFirstDataFrame)

str(myFirstDataFrame)


myFirstDataFrame$hgt#Or
myFirstDataFrame[,3]# or
myFirstDataFrame[,"hgt"]


myFirstDataFrame[1:4,c(2,5)]

myFirstDataFrame["age"]


#LIST   (length of each need not be same)

x <- 1:10
y <- matrix(1:12, nrow=3)
z <- "xyz"
v <- c(T,F,T,F)

mylist <- list(abc=x,jjj=y,aaa=z,ttt=v)
mylist

mylist[2]

mylist[[2]]


mylist[c(2,3)]

mylist[[c(2,11)]]

mylist[[c(4,2)]]

a <- mylist[[2]]
a[3,]

#Tables

y <- rnorm(100, mean=100, sd=15)
y
y <- round(y,0)
y

# see frequency in dataset
table(y)

#factor

l <- c("m","f", "f", "f", "m","f")
l
l <- factor(l)
l
levels(l)
class(l)

myFirstDataFrame[,"sex"] <- l

cbind(myFirstDataFrame, sex=l)

myFirstDataFrame$gender <- l

myFirstDataFrame[,c(8,9)] <- NULL
# myFirstDataFrame$ratio <- with(myFirstDataFrame, hgt/wgt)
# myFirstDataFrame$hgt/myFirstDataFrame$wgt

a <- gl(3,2, labels = c("Male", "Female", "Neutral"))
a
is.factor(a)

myFirstDataFrame$gender <- a

# myFirstDataFrame[,"gender"] <- a

df <- myFirstDataFrame

by(FUN= mean, data = df$hgt, INDICES=df$gender)

table(myFirstDataFrame$gender)

summary(myFirstDataFrame)

###Create character vector

gender <- c(rep("female",691), rep("male",692))

gender <- factor(gender)
levels(gender)
table(gender)

# subsetting

x <- c("a", "b","c","c","d","A")
#x <- sort(x, decreasing = T)

x[1:4]   #numeric index

u <- x > "b"   #logical vector
u
x[u]

LETTERS[1:6]
letters



myFirstDataFrame[which(myFirstDataFrame$age == 18),
                 c(1:4)]
myFirstDataFrame[which(myFirstDataFrame$name == "Bob"),
                 "wgt"]

?subset
help(subset)
example(subset)
help("subset")
example("subset")

data <- subset(myFirstDataFrame, age > 20 & name=="Sue")
data <- subset(myFirstDataFrame, age > 20 | name=="Sue",
               select = -c(4:5))
data

rm(data)

#Partial matching 

x <- list(aayisid = 1:5, aadytby= c("d", "g", "t"))

x$aay

#Vector Sorting

v <- sample(101:110, replace = T)
v
sort(v)
sort(v, decreasing= TRUE)