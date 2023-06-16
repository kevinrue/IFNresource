library(iSEEindex)
library(DESeq2)

##
# BiocFileCache ----
##

library(BiocFileCache)
bfc <- BiocFileCache(cache = tempdir())

##
# iSEEindex ----
##

dataset_fun <- function() {
  x <- yaml::read_yaml("config.yaml")
  x$datasets
}

initial_fun <- function() {
  x <- yaml::read_yaml("config.yaml")
  x$initial
}

iSEEindex(bfc, dataset_fun, initial_fun)
