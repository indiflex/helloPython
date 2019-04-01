library(dplyr)
library(ggplot2)
library(ggiraphExtra)
library(gridExtra)
library(tibble)
library(stringi)
library(ggiraph)
library(devtools)
load('data/data_eng.rda')

library(kormaps2014)
load('data/kdata.rda')

library(plotly)
library(dygraphs)
library(xts)

library(sqldf)
library(RMySQL)

# tm
library(tm)

dyn.load(paste0(system2('/usr/libexec/java_home', stdout = TRUE), 
                '/jre/lib/server/libjvm.dylib'))
library(rJava)
library(KoNLP)


library(RColorBrewer)
library(wordcloud)

library(arules); library(igraph); library(combinat)
library(arulesViz); library(visNetwork)

library(rvest); library(httr); library(stringr)
