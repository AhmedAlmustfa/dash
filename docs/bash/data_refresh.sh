#!/bin/bash

echo "Rendering the dashboard..."

Rscript -e "rmarkdown::render_site()"

# Fix github issue

git config --global --add safe.directory /__w/dash/dash

if [[ "$(git status --porcelain)" != "" ]]; then
    git config --global user.name 'AhmedAlmustfa'
    git config --global user.email 'Ahmedkhatir22@gmail.com'
    git add *
    git commit -m "Auto update dashboard"
    git push
fi
