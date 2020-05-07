#!/bin/bash

# 错误时终止脚本
set -e

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

rm -rf public

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

cp CNAME public/

# Go To Public folder
cd public
# Add changes to git.
git init
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push -f git@github.com:isees/isees.github.io.git master

# Come Back up to the Project Root
cd ..
