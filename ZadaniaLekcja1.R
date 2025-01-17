#1. Napisz funkcję sprawdzająca czy 1 liczba jest podzielna przez druga użyj - %%
podzielnosc<-function(x,y){
  if(x%%y == 0)
    {print("Jest podzielna")}
   else { print("Jest niepodzielna")
      }
}

#Sprawdzenie
podzielnosc(15,5)
podzielnosc(10,3)

#2. Pociąg z Lublina do Warszawy przejechał połowę drogi ze średnią prędkością 
#120 km/h.
#Drugą połowę przejechał ze średnią prędkością 90 km/h.
#Jaka była średnia prędkość pociągu.

x<-120
y<-90
z<-c(x,y)
mean(z)

#3. Utwórz funkcję obliczającą współczynnik korelacji r Pearsona dla 2 wektorów 
#o tej samej długości.
#Wczytaj dane plik dane.csv i oblicz współczynnik dla wagi i wzrostu. 
#W komentarzu napisz co oznacza wynik.

korelacja<-function(x,y){
  cor(x,y)
}

dfDane<-read.csv("~/Desktop/R/dane.csv", TRUE, ";" )

wzrost<-dfDane[,1]
waga<-dfDane[,2]

korelacja(wzrost, waga)

#Korelacja między wzrostem, a wagą wynosi 0.98 - jest bardzo wysoka.
#Oznacza to, że im wyższa jest osoba, tym więcej waży.


#4. Napisz funkcję zwracającą ramke danych z danych podanych przez użytkownika 
#stworzDataFrame <- function(ile=1) W pierwszym wierszu użytkownik 
#podaje nazwy kolumn. 
#w kolejnych wierszach zawartość wierszy ramki danych ( tyle wierszy 
#ile podaliśmy w argumencie ile. 
#ile=1 oznacza, że gdy użytkownik nie poda żadnej wartości jako parametr, 
#domyślna wartością będzie 1)

stworzDataFrame<-function(ile=1){
  odp<-readline("Podaj nazwy kolumn rozdzielone przecinkami: ")
  odp1<-unlist(strsplit(odp,","))
  df<-data.frame(matrix(nrow=1, ncol=length(odp1)))
  colnames(df)<-odp1
  
  for(i in 1:ile){
    
    odpWiersz<-readline("Podaj wartosci wierszy oddzielone przecinkami: ")
    wiersz<-unlist(strsplit(odpWiersz, ','))
    df<-rbind(df, wiersz)
  }
  View(df)
}
stworzDataFrame()

#5. Napisz funkcję , która pobiera sciezkeKatalogu, nazweKolumny, jakaFunkcje, 
#DlaIluPlikow i liczy: 
#mean, median,min,max w zależności od podanej nazwy funkcji w argumencie, z 
#katologu który podaliśmy 
#i z tylu plików ilu podaliśmy dla wybranej nazwy kolumny. 

liczZplikow <- function(sciezka, nazwaKolumny, jakaFunkcja="mean", DlaIluPlikow=1){
  listaPlikow <- list.files(sciezka)
  wynik=list()
  Kolumny<-paste("X",nazwaKolumny, sep = "")
  
  for (i in 1:DlaIluPlikow){
    wynik<-rbind(wynik, na.omit(read.csv(listaPlikow[i][Kolumny])))
    if (jakaFunkcja == "mean"){result<-mean(wynik[[i]][,nazwaKolumny],na.rm=TRUE)
    wynik[[i]] <- result
    }else if (jakaFunkcja == "median"){result<-median(wynik[[i]][,nazwaKolumny],na.rm=TRUE)
    wynik[[i]]<- result
    }else if (jakaFunkcja == "min"){result<-min(wynik[[i]][,nazwaKolumny],na.rm=TRUE)
    wynik[[i]]<- result
    }else if (jakaFunkcja == "max"){result<-max(wynik[[i]][,nazwaKolumny],na.rm=TRUE)
    wynik[[i]]<- result
    }}
    wynik
  }
  
  liczZplikow('smogKrakow', 3_pressure, jakaFunkcja = 'mean', DlaIluPlikow = 3)
  
