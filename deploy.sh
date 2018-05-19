#!/bin/bash

./build.sh

echo -e "\033[0;32mBuilding & deploying updates to GitHub...\033[0m"

# Build the project.
hugo

# Go To Public folder
cd public

# Remove old css file
rm css/style.min.css

# Add new css
cp assets/css/style.min.css css/

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..
