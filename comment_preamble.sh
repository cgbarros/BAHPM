#!/bin/bash

# comentar a linha que cria o lilypond-book-preamble, permitindo a criação de arquivos svg

sed -i 's/\\include "lilypond-book-preamble.ly"/% \\include "lilypond-book-preamble.ly"/g' $1;
