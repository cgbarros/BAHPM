#!/bin/bash

# padronização de conversão de imagens eps para arquivos png
# em regra a conversão reduz consideravelmente o tamanho do arquivo deixando amigável para publicação e mantendo o original
# no entanto, caso haja alguma alteração nas imagens elas precisam ser convertidas novamente e adicionadas ao arquivo .odt
# $1 = 300 para partituras
# $1 = 150 para sonogramas

convert -density $1 "$2" "${2%.eps}.png"
