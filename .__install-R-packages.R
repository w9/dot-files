options(repos='http://cran.r-project.org')

install.packages('devtools')
devtools::install_github("jalvesaq/VimCom")
devtools::install_github("jalvesaq/colorout")

install.packages('setwidth')

install.packages('ggplot2')
install.packages('plyr')
install.packages('dplyr')
install.packages('reshape2')

install.packages('e1071')



source("http://bioconductor.org/biocLite.R")
biocLite("DESeq2")
