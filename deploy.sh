#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"
hugo
msg="rebuilding site `date`"
if [ $# -eq 1 ]
then msg="$1"
fi

git add -A
git commit -m "$msg"
git push --recurse-submodules=on-demand --force
