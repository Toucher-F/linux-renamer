#！/bin/bash
for files in `ls *.html`
do
      mv $files ${file%.html}.en.html
done
