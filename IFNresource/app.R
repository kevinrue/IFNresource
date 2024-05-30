library(iSEEindex)
library(DESeq2)
library(shiny)

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

shiny::addResourcePath("images", "www/images/")

header <- fluidRow(shinydashboard::box(width = 12L,
  column(width = 10,
    h1("Single-cell analysis of signalling and transcriptional responses to type I interferons"),
    p("Rachel E. Rigby", tags$sup(1), ", Kevin Rue-Albrecht", tags$sup(2), ", David Sims", tags$sup(2), " and Jan Rehwinkel", tags$sup("1*"), ""),
    p(
      tags$sup(1), "Medical Research Council Human Immunology Unit, Medical Research Council Weatherall Institute of Molecular Medicine, Radcliffe Department of Medicine, University of Oxford, Oxford, UK",
      br(),
      tags$sup(2), "MRC WIMM Centre for Computational Biology, MRC Weatherall Institute of Molecular Medicine, University of Oxford, Oxford, UK"
    ),
    p(tags$sup("*"), "Correspondence to: ", a("jan.rehwinkel@imm.ox.ac.uk", href="mailto:jan.rehwinkel@imm.ox.ac.uk", target="_blank"), "."),
    p("doi: ", a("https://doi.org/10.1101/2023.07.03.547491", href="https://doi.org/10.1101/2023.07.03.547491", target="_blank"))
  ),
  column(width = 2,
    p(
      "Read the preprint on",
      a(img(src="images/biorxiv.jpeg", alt="bioxRvix logo", width = "100%"), href="https://www.biorxiv.org/content/10.1101/2023.07.03.547491v1", target="_blank"),
      style="vertical-align:bottom;")
  )
))

footer <- fluidRow(shinydashboard::box(width = 12L,
  p("This is a example footer. A great place for copyright statements and outros.", style="text-align: center;"),
  p(
    "© 2023 iSEE.",
    a("Artistic-2.0", href = "https://opensource.org/license/artistic-2-0/", target="_blank"),
    style="text-align: center;")
))

iSEEindex(bfc, dataset_fun, initial_fun, default.add = FALSE, body.header = header, body.footer = footer)
