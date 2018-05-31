#!/bin/sh
postfix=('html' 'htm')
region='en'

cd /webroot/
for i in ${postfix[@]};do
  for file in `find . -type f -name "*\.${i}" ! -name "*\.${region}.${i}"`;do
    dirname=`pwd $file`
    mv $file $dirname/"${file%${i}}${region}.${i}";
  done
done
