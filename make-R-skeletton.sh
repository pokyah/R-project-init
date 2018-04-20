#!/bin/sh

if [ "$1" != "" ]; then
    echo "Creation R directories for project " $1
    mydir=$1
else
    echo "Creation R directories here"
    mydir="."
fi

mkdir -p $mydir/data-raw $mydir/data-output $mydir/fig $mydir/R $mydir/tests

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
