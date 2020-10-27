#Autor: Sebastian Gonzalez Medellin
#Uso básico de nmap

rango=$1
ip_publica=$2

nmap $rango > reporte_rango.txt
nmap $ip_publica > reporte_publica.txt
nmap --script=vuln $ip_publica > vulneravilidades.txt