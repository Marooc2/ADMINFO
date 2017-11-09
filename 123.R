
source("Scripts/Configuracion.R")

instaladores<-c("twitteR","XML","ROAuth","httr")
install.packages(instaladores)
###################################################################
library(twitteR)
library(XML)
library(ROAuth)
library(httr)

######pagina para sacar las restricciones
##http://www.endmemo.com/program/R/gsub.php
#########################################

#ubicarnos en que carpeta quiero trabajar, en este caso, la carpeta donde esta el documento csv que vamos a leer.
setwd("D:/Descargas mozilla/CE-AnalisisSentimiento/AnalisisSentimientos/Scripts")

#almacenamos en un variable todos los datos extraidos en del csv.
datos<- read.csv("ds.csv", header = T)

#visualizar de una forma bonita todos los datos.
View(datos)

#cortando la cantidad de data solo a 300 datos y almacenandola en una variable texto
texto<-head(datos,300)
View(texto)

#quitando menciones al menos una vez: arrobas y texto por ejemplo: @upc
grep("@\\w+",texto$text) #muestra los espacios en donde encuentra coincidencias con el parametro
texto$text<-gsub("@\\w+","",texto$text) #quita las coincidencias de las columna 
View(as.matrix(texto$text))
View(texto)

#quitar signos de puntuacion
grep("[:punct:]",texto$text)
texto$text<-gsub("[:punct:]"," ",texto$text)
View(as.matrix(texto$text))

#quitar numeros
grep("[:digit:]" , texto$text)
texto$X.2<-gsub("[:digit:]", "" , texto$text)
View(as.matrix(texto$text))

#quitar enlaces html
grep("https\\w+" , texto$text)
texto$text<-gsub("htt\\w+" , "" , texto$text)
View(as.matrix(texto$text))


#Quitar iconos
texto$text<-iconv(texto$X.2, "UTF-8", "latin1")
?iconv
View(texto)

#Pasar a minuscula
texto$text<-tolower(texto$text)
View(texto)

#Eliminar NA

dslimpios<-texto$text[!is.na(texto$text)]
View(as.matrix(dslimpios))


df
View(df)
save.image("backup.dat")
