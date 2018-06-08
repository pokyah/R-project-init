#!/bin/sh

if [ "$1" != "" ]; then
    echo "Creation R directories for project " $1
    mydir=$1
else
    echo "Creation R directories here"
    mydir="."
fi

mkdir -p $mydir/data-raw $mydir/data-output $mydir/fig $mydir/R $mydir/tests $mydir/report-outputs $mydir/settings

curl https://raw.githubusercontent.com/github/gitignore/master/R.gitignore > .gitignore

curl https://www.gnu.org/licenses/gpl-3.0.txt > LICENSE

curl https://raw.githubusercontent.com/pokyah/R-project-init/master/template.listPckgs.csv >> $mydir/settings/listPckgs.csv

curl https://raw.githubusercontent.com/pokyah/R-project-init/master/template.init.R > init.R

curl https://raw.githubusercontent.com/pokyah/R-project-init/master/template.gitignore >> template.gitignore

curl https://raw.githubusercontent.com/pokyah/R-project-init/master/template.README.md >> README.md

cat template.gitignore >> .gitignore

rm template.gitignore

git init

git add .

git commit -m "tree structure created"

