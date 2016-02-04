#!/bin/bash

commit="$1"

if ["$commit" -ne ""]; then
  echo "type a commit"
  exit 1;
fi

files=`git show --pretty="format:" --name-only $1`

for file in $files
do
  echo "opening $file with sublime"
  subl $file
done

echo ""
echo "============================="
echo ""
echo "Files opened!"
