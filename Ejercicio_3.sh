#!/bin/bash
#Sebastián González Medellín
#Scrip para detectar archivos maliciosos en la pagina virus total
API=$1
analisis=$2
arch_maliciosos=$3


echo 'Analizando...'
for Document in $(ls $analisis)
do
    echo "Analizando: $Document"
    curl -X POST https://www.virustotal.com/vtapi/v2/file/scan -F apikey=$API -F file=$analisis/$Document >> json.txt
    grep -i 'Scan request successfully queued, come back later for the report' json.txt > /dev/null 2>&1
    [ $? -eq 1 ] && {
        echo "Se ha detectado una amenaza $Document"
        arch=$arch/$Document
        mv $arch $analisis
    }
    rm json.txt
done