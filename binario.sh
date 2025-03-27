#!/bin/bash

#Made by Perifulles


abinario() {
    read -p "Introduc el numero en decimal
" decimal

    original=$decimal;

    res=0;

    while [ $decimal -gt 0 ]; do
    let mitad=( $decimal / 2 );
    let sobrante=( $decimal % 2 );
    decimal=$mitad;
    binario="$sobrante$binario";
    done

    echo "$original en Binario es: $binario";
}

adecimal() {

    read -p "Introduc el numero en binario
" binario

    longitud=${#binario};


    suma=0;

    for (( i=0; i<$longitud; i++ ))
    do
    cifra=${binario:$i:1}
    opuesto=$(($longitud - i - 1))
    
    elevado=$((2**$opuesto))

    suma=$(( $suma + $cifra * $elevado ))
    done

    echo "$binario convertido a decimal es: $suma";
}


echo "Que quieres hacer?"
echo "1) Convertir a binario"
echo "2) Convertir a decimal"
echo "3) Pasar IP de a binario"
echo "4) Pasar IP a decimal"
echo "5) Salir"
read op


case $op in
1) abinario;;
2) adecimal;;
5) exit;;
*) echo "Introduzca una opción correcta";;

esac