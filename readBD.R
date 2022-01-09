install.packages("DBI")
install.packages("RSQLite")
install.packages("devtools")
library(DBI)
library(RSQLite)
library(devtools)

readToBase<-function(filepath,dbConn,tablename,size,sep=",",header=TRUE,delete=TRUE){
  ap<-!delete
  ov<-delete
  fileConnection<-file(description = filepath,open="r")
  data<-read.table(fileConnection,nrows=size,header=header,fill=TRUE,sep=sep)
  columnNames<-names(data)
  dbWriteTable(dbConn,name=tablename,vale=data,append=ap,overwrite=ov)
  repeat{
    if( nrow(data)==0 ){
      close(fileConnection)
      dbDisconnect(dbConn)
      break;
    }
    data<-read.table(fileConnection,nrows=size,col.names=columnNames,fill=TRUE,sep=sep)
    dbWriteTable(dbConn,data,name=tablename,append=TRUE,overwrite=FALSE)
  }
}

View(read.csv("~/Desktop/R/konta.csv"))
con<-dbConnect(SQLite(),"konta.sqlite")
readToBase("~/Desktop/R/konta.csv",con, 'consumers', 100, delete=TRUE)
con<-dbConnect(SQLite(),"consumers.sqlite")
dbGetQuery(con, "SELECT COUNT(*) FROM consumers")
dbDisconnect(con)


