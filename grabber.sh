#!/bin/sh
echo "#!/bin/sh" > getter.sh
echo "" > result.txt
echo "" > wget.log
while read line
do
  echo $line|awk 'NF {$0=++a " http://www.reuters.com/finance/stocks/overview?symbol="$0" "$0} NF==3 {print "echo \"\" > runtime.txt; wget -a wget.log --user-agent \"Googlebot/2.1 (+http://www.google.com/bot.html)\" --output-document runtime.txt \""$2"\" ; dos2unix runtime.txt ; sed \"s/\\&nbsp;/\\&#160;/g\" runtime.txt > ready.xml; html2xhtml ready.xml > xready.xml ; xsltproc --novalid --nodtdattr --nonet --stringparam ticker \""$3"\" template.xsl xready.xml >>result.txt; sleep 2"}' >>getter.sh
done <symbol.txt
chmod +x getter.sh
win-bash getter.sh

