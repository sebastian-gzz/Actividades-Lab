#!/bin/bash
#Autor: Sebastian Gonzalez Medellin
#Realiza 3 peticiones con 4 parametros especificos a la pagina www.virtualbox.com
API=$1
URL=$2
ARC=$3
COM=$4
curl -X POST https://www.virustotal.com/vtapi/v2/url/scan -F apikey=$API -F url=$URL 

curl -X POST https://www.virustotal.com/vtapi/v2/file/scan -F apikey=$API -F file=$ARC

curl -v --request POST https://www.virustotal.com/vtapi/v2/comments/put -F apikey=$API -F comment=$COM -F resource=8ebc97e05c8e1073bda2efb6f4d00ad7e789260afa2c276f0c72740b838a0a93 