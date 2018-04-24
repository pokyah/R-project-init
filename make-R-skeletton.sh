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
## New Script 
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
