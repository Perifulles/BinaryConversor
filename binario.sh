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

ipabinario(){
# Pedir la IP al usuario
read -p "Ingrese una dirección IP en decimal:
" ip

    # Separar la IP en sus bytes
    IFS='.' read -r byte1 byte2 byte3 byte4 <<< "$ip"

    bytes=($byte1 $byte2 $byte3 $byte4)
    ipfinal=()


    for (( i=0; i<4; i++ ))
    do
        decimal=${bytes[$i]}

        res=0;
        binario="";

        while [ $decimal -gt 0 ]; do
        let mitad=( $decimal / 2 );
        let sobrante=( $decimal % 2 );
        decimal=$mitad;
        binario="$sobrante$binario";
        done
        ipfinal+=("$binario")
    done

    for (( i=0; i<4; i++ ))
    do
    bite=${ipfinal[$i]}
    longbite=${#bite};
    suplemento=$(( 8 - $longbite ));

        ceros=""
        for (( o=0; o<$suplemento; o++ ))
        do
        ceros="0$ceros"
        done

    ipfinal[$i]="$ceros${ipfinal[$i]}"

    ipcompleta="$ipcompleta.${ipfinal[$i]}"
    done

    ipbien=${ipcompleta:1:35};

    echo "$ip en Binario es => $ipbien";
}



ipadecimal(){
# Pedir la IP al usuario
read -p "Ingrese una dirección IP en decimal:
" ip

    # Separar la IP en sus bytes
    IFS='.' read -r byte1 byte2 byte3 byte4 <<< "$ip"

    bytes=($byte1 $byte2 $byte3 $byte4)
    ipfinal=()

    for (( i=0; i<4; i++ ))
    do
        binario=${bytes[$i]}

        longitud=${#binario};

        suma=0;

        for (( o=0; o<$longitud; o++ ))
        do
        cifra=${binario:$o:1}
        opuesto=$(($longitud - o - 1))
        
        elevado=$((2**$opuesto))

        suma=$(( $suma + $cifra * $elevado ))
        done

        ipfinal+=("$suma")
    done

    IFS=".";

    echo "La IP $ip en decimal es => ${ipfinal[*]}";
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
3) ipabinario;;
4) ipadecimal;;
5) exit;;
*) echo "Introduzca una opción correcta";;

esac