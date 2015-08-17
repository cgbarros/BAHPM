#!/bin/bash

# padronização de conversão das imagens criadas no Inkscape para arquivos png

convert -density 150 "$1" "${1%.svg}.png"
