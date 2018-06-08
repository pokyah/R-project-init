#!/bin/sh

if [ "$1" != "" ]; then
    echo "Creation R directories for project " $1
    mydir=$1
else
    echo "Creation R directories here"
    mydir="."
fi

mkdir -p $mydir/data-raw $mydir/data-output $mydir/fig $mydir/R $mydir/tests $mydir/report-outputs $mydir/settings

cat > $mydir/LICENSE <<EOM
GNU GPL V3
EOM

cat > $mydir/init.R << EOM
#'---
#'author: "Thomas Goossens (CRA-W) - t.goossens@cra.wallonie.be"
#'output: 
#'  html_document:
#'    theme: default
#'    toc: false
#'    toc_depth: 6
#'    toc_float:
#'      collapsed: false
#'      smooth_scroll: true
#'  revealjs::revealjs_presentation:
#'    theme: white
#'    highlight: pygments
#'    center: true
#'    incremental: true
#'    transition: fade
#'    self_contained: false
#'    reveal_plugins: ["notes", "search"]
#'  md_document:
#'    variant: markdown_github
#'    toc: false
#'    toc_depth: 6
#'  pdf_document: default  
#'title: "<INSERT YOUR TITLE HERE"
#'date: "`r format(Sys.time(), '%d %B, %Y')`"
#'---

#+ ---------------------------------
#' ## Script preparation
#' 
#+ preparation, echo=FALSE, warning=FALSE, message=FALSE, error=FALSE, results='asis'

# Avoid interference with old variables by cleaning the Global Environment
rm(list=ls(all=TRUE))

# Automagically set the wd and the root of all projects 
if (!require("here")) install.packages("here")
library(here)
wd.chr <- here::here()

# loading the library to manage all the other libraries
if (!require("pacman")) install.packages("pacman")
library(pacman)
requiredPackages <- read.csv("./settings/requiredPackages.csv", quote = "", sep = ",", header=TRUE, stringsAsFactors=FALSE)
p_load(char=requiredPackages$packageName, character.only=TRUE )
p_loaded()

# Dynamic Sourcing of all the required functions
source(paste0("../../pokyah/R-utilities/R-utilities.R"))
source_files_recursively.fun("./R")
source_files_recursively.fun("../agrometeor_utilities_public/R/")

#+ ---------------------------------
#' ## Terms of service 
#' To use the [AGROMET API](https://app.pameseb.be/fr/pages/api_call_test/) you need to provide your own user token.  
#' The present script is available under the [GNU-GPL V3](https://www.gnu.org/licenses/gpl-3.0.en.html) license and comes with ABSOLUTELY NO WARRANTY.
#' 
#' Copyright : Thomas Goossens - t.goossens@cra.wallonie.be 2018.  
#' 
#' *(This document was generated using [R software](https://www.r-project.org/) with the [knitr library](https://deanattali.com/2015/03/24/knitrs-best-hidden-gem-spin/))*.  
#+ TOS,echo=TRUE,warning=FALSE,message=FALSE,error=FALSE	

EOM

cat> $mydir/.gitignore << EOM
# History files
.Rhistory
.Rapp.history

# Session Data files
.RData

# Example code in package build process
*-Ex.R

# Output files from R CMD build
/*.tar.gz

# Output files from R CMD check
/*.Rcheck/

# RStudio files
.Rproj.user/

# produced vignettes
vignettes/*.html
vignettes/*.pdf

# OAuth2 token, see https://github.com/hadley/httr/releases/tag/v0.3
.httr-oauth

# knitr and R markdown default cache directories
/*_cache/
/cache/

# Temporary files created by R markdown
*.utf8.md
*.knit.md

# Shiny token, see https://shiny.rstudio.com/articles/shinyapps.html
rsconnect/

EOM

cat> $mydir/settings/requiredPackages.csv << EOM
packageName, version, purpose
sf, 0.6-0 # Simple Features for R
lubridate, 1.6.0 # Anything to 'POSIXct' or 'Date' Converter
anytime, 0.3.0 # Anything to 'POSIXct' or 'Date' Converter
tidyverse, 1.2.1 # Easily Install and Load the 'Tidyverse'
jsonlite, 1.5 # A Robust High Performance JSON Parser and Generator for R
ggplot2, 2.2.1 # Create Elegant Data Visualisations Using the Grammar of Graphics
reshape2, 2.2.1 # Flexibly Reshape Data: A Reboot of the Reshape Package
nortest,1.0-4 # Tests for Normality
lazyeval, 0.2.1 # Lazy (Non-Standard) Evaluation
maptools, 0.9-2 # Tools for Reading and Handling Spatial Objects
rmarkdown, 1.8 # Dynamic Documents for R
knitr, 1.18 # A General-Purpose Package for Dynamic Report Generation in R
maps, 3.2.0 # Draw Geographical Maps
broom, 0.4.3 # Convert Statistical Analysis Objects into Tidy Data Frames
stringr, 1.2.0 # Simple, Consistent Wrappers for Common String Operations
RPostgreSQL, 0.6-2 # R Interface to the 'PostgreSQL' Database System
scales, 0.5.0 # Scale Functions for Visualization
mapview, 2.2.0 # Interactive Viewing of Spatial Data in R
raster, 2.6-7 # Geographic Data Analysis and Modeling
leaflet, 1.1.0 # Create Interactive Web Maps with the JavaScript 'Leaflet' Library
htmlwidgets, 1.0 # HTML Widgets for R
shiny, 1.0.5 # Web Application Framework for R
plotly, 4.7.1, # Create Interactive Web Graphics via 'plotly.js'
chron, 2.3-52, # Chronological Objects which can Handle Dates and Times
BlandAltmanLeh, 0.3.1, # Plots (Slightly Extended) Bland-Altman Plots
mlr, 2.12.1, # Machine Learning in R
EOM
