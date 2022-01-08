print("hello")
print("hello2")

#Zadanie 1
#Zadanie 2


#getwd()
#setwd("/Users/jola/Desktop/R")

x<-125
x<-"125"

class(x)
str(x)
class(x)
is.vector(x)

?vector

x<-c(1,2,3,4,5,6,7,8,9,10)
x
x<-seq(1:10)
x

?seq

x<-seq(1, 10, by= 1)
y<-seq(10, 1, by = -1)

z<-c(x,y)
?c

is.numeric(x)
as.character(x)
z<-c(x, as.character(x))
z
z<-as.numeric(z)
as.logical(z)
z<-c(0,z)
w<-as.logical(z)
nowy<-as.numeric(w)
nowy2<-c("raz","dwa","trzy")

lista<-list(z, nowy, nowy2)
lista

#indeksujemy od 1!!
#z[0]

lista[[3]][2]
z
for(i in 1:length(z)){
  print( z[i] )
}

for( i in 1:length(lista) ){
  for(j in 1:length(lista[[i]]) ){
    print(lista[[i]] [j] )
  }
}

#brak biblioteki
pow2(x)

install.packages("pracma")
library(pracma)
pow2(x)

i<-1
while(i<=length(x)){
  print( pow2(x[i]) )
  i<-i+1
}

#data.frame
df<-data.frame(id=c(1,2),c("2","3"),c(3,3) )
colnames(df)<-c("wzrost","waga","wiek")
str(df)

?read.csv
dfFromFileZle<-read.csv("~/Desktop/R/dane.csv")
View(dfFromFileZle)

dfFromFile<-read.csv("~/Desktop/R/dane.csv", TRUE, ";")
View(dfFromFile)

hello<-function(x){
  print(paste0("hello ",x) )
}
txt<-"lukasz2"
hello(x=txt)
hello()

#sum(x)
#x^2
#mean(x)
#length(x)
wariancja<-function(x){
  #...
}

?var

dfFromFile[1,1]
dfFromFile[,1]
dfFromFile[1,]
dfFromFile$wiek

macierz<-matrix(x,nrow = 10, ncol = 10)
x
y<-2
y<-c(2,4)
#+, -, *, /, %%, %/% - jak działają?
?readline
odp<-readline("Are you a satisfied R user? ")
odp1<-strsplit(odp,split = ",")[[1]][1]
odp2<-strsplit(odp,split = ",")[[1]][2]

v<-strsplit(odp,split = ",")[[1]]

podpowiedzFrame<-data.frame(matrix(ncol =3, nrow =0))
colnames(podpowiedzFrame)<-v

rbind
