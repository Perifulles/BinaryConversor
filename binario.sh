#!/bin/bash

#Made by Perifulles


abinario() {
    read -p "Introduc el numero en decimal
    " decimal

    res=0;

    while [ $decimal -gt 0 ]; do
    let mitad=( $decimal / 2 );
    let sobrante=( $decimal % 2 );
    decimal=$mitad;
    binario="$sobrante$binario";
    done

    echo "$decimal en Binario es: $binario";
}

adecimal() {

read -p "Introduc el numero en binario
" binario

longitud=${#binario};

echo "$longitud";

}

adecimal
abinario