#!/bin/sh
# Feature of this script:
# 1. Modify the postfix of all file end with ".html" or ".htm"
#    to ".en.html" or "en.htm"
# 2. Modify the configure file of nginx to rewrite the url
#    from ".html" or ".htm" to ".en.html" or "en.htm"

file_dir="/webroot"
postfix=('html' 'htm')
region='en'
site_config_file="default"


# Modify the postfix of file
cd ${file_dir}
for i in ${postfix[@]};do
  for file in `find . -type f -name "*\.${i}" ! -name "*\.${region}.${i}"`;do
    #targetfile=`echo $file|sed 's/.html/.en.html/'`
    mv $file ${file_dir}/"${file%${i}}${region}.${i}";
  done
done

# Modify the nginx config file to rewrite url
grep -q rewrite /etc/nginx/sites-enabled/${site_config_file}
if [ $? -eq 0 ]
then
	echo "the configure alreay exist"
else
	sudo sed -i '/^[^#].*try_files/a rewrite ^([^\.]+)\.(html|htm)$ $1.en.$2 last;' /etc/nginx/sites-enabled/${site_config_file}
  echo "changed the configure of nginx, reloading.."
  sudo service nginx reload
fi
