#!/bin/bash

# padronização de conversão de imagens eps para arquivos jpg
# em regra a conversão reduz consideravelmente o tamanho do arquivo deixando amigável para publicação e mantendo o original

convert -density 300 "$1" "${1%.eps}.jpg"
