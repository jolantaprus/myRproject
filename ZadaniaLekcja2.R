#import bibliotek

library(DBI)
library(RSQLite)
library(devtools)
library(dplyr)                                                                 
library(stringr)
library(gtools)                                                                
library(rvest)
library(xml2)


#Zadanie1:
#  Zapisz szczegóły ogłoszeń z otomoto do dataFrame. Aby obejść limit wyświetlanych ogłoszeń(500 stron) Przefiltruj na stronie ogłoszenia np.. po latach produkcji.
#Max liczba stron po zastosowaniu filtra widoczna jest na dole strony jako przycisk. Można pobrać jego tekst , np. za pomocą: 
#  page %>% html_nodes(xpath = "/html/body/div[4]/div[3]/section/div[2]/div[2]/ul/li[6]/a/span")%>%html_text()

#pobieranie danych, filtr dla samochodow osobowych od 2019 do 2020
newUrl<-"https://www.otomoto.pl/osobowe/od-2019?search%5Bfilter_float_year%3Ato%5D=2020"
page <- read_html(newUrl)
nodesAuta<-page%>%html_nodes(xpath="/html/body/div[2]/div/div/div/div[1]/div[2]/div[2]/div[1]/div[3]/main/article[*]/div[1]/h2/a")

html_nodes(page,".offer-params__label")%>%html_text()
linkiAuta<- nodesAuta%>%xml_attr("href")
page%>%html_nodes('.offer-params__label')%>%html_text()

scraping <- function(nazwa){
  result<-numeric(0)
  for (i in 1:pages) {
    page<-read_html(list_of_pages[i])
    value <- html_nodes(page,nazwa) 
    value <- html_text(value)
    
    result<-c(result,value)
  }
  return(result)
}


#Zadanie2:
#  Zapisz ogłoszenia porcjami do bazy danych. 
#Porcja danych to n ogłoszeń ze wszystkich ogłoszeń zapisanych do jednego 
#dataFrame’a (w przykładzie z zajęć był to dataFrame mieszkania, 
#a wszystkie ogłoszenia to wektorLinkow).
#Należy rozwiązać problem różnych nazw kolumn w daraFrame oraz tabeli w bazie.
#Przydatne dodatkowe funkcje:
#  dbWriteTable – zapisuje dataFrame do bazy jako tabelę.
#colnames – nazwy kolumn z dataFrame,
#dbListFields-nazwy kolumn z tabeli w bazie,
#setdiff – do znalezienia brakujących nazw kolumn ,
#dbExecute - do użycia z polecenia sqlowym dodającym nową kolumne do tabeli w bazie:
#  dbExecute(dbcon, "POLECENIE_SQL jako łańcuch znaków")
#dbAppendTable – wstawia dataFrame do istniejącej tabeli w bazie.
#W tabeli w bazie nie może brakować kolumn z dataFrame
#BŁĄD: table ... has no column named ...
#W drugą stronę nie ma tego problemu- funkcja wstawi NA przy brakujących wartościach z dataFrame

