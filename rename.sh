#!/bin/sh
cd /webroot/

for file in `find . -type f -name "*\.html" ! -name "*.en.html"`;do
dirname=`pwd $file`
mv $file $dirname/"${file%html}en.html";
done
