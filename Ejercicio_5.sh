md5=(08b5e6f413402603ae48100110bac99b 40744679dff4bf36705c00f9cb815579 7264a79cccb5da23e0d37c504309af3d 0beac18480a527f29818d8c8b2964c74)
echo "Carpeta a analizar:"
read carpeta
declare -a archivos_c
declare -a archivos_d
cont=0
cont1=0
nom=0
for i in $(ls $carpeta)
do
    md5sum $carpeta/$i > x.txt
    for j in ${md5[@]}
    do
        grep -w $j x.txt > z.txt
        [ $? -eq 0 ] &&
        {
            archivos_c[cont]=$i
        }
        rm z.txt
    done
    ((cont ++))
    rm x.txt
done
for x in $(ls $carpeta)
do
    a=0
    for y in ${archivos_c[@]}
    do
        
        if [ "$x" == "$y" ]
        then
            a=1
            break
            
        fi
    done

    if [ $a == 1 ]
    then
    echo "archivo original $x"
        cat $carpeta/$x | base64 > "$x.txt"
    else
    echo "archivo no original $x"
        cat $carpeta/$x | base64 --decode > "$x.png"
    fi
done