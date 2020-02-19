library(ggplot2)
library(dplyr)
library(igraph)
library(network)
library(sna)
library(ggraph)
library(visNetwork)
library(threejs)
library(networkD3)
library(ndtv)
library(readr)

edspells <- read.csv("red_dinamica/edspells.csv")
enlaceestaticos<- read.csv("red_dinamica/enlaceestaticos.csv")
tabdinam<- read.csv("red_dinamica/tabdinam2.csv")
enlaces<- read.csv("red_dinamica/enlaces.csv")

net <-network(enlaceestaticos,vertex.attr =enlaces,edge.spells=tabdinam,directed = FALSE,loops = NULL ) 
plot(net, bg="royalblue", 
     vertex.border="blue")

is.numeric(edspells$onset)
class(net)  
edspells<- select(tabdinam,'onset','terminus','tail','head')
netdin <- networkDynamic(net, edges.spells = edspells)
class(netdin)


render.d3movie(
  netdin,
  vertex.col = "ndtvcol",
  edge.col = "darkgrey",
  vertex.border = "lightgrey")

render.d3movie(netdin,displaylabels=TRUE) 

##################### edicion de archivos
autores <-
