#!/bin/bash

# Verifica se foi passado um parâmetro
if [ $# -ne 1 ]; then
    echo "Uso: $0 <nome_base>"
    exit 1
fi

# Obtém o nome base do parâmetro
nome_base=$1

# Cria os arquivos com extensões .h e .c
touch "${nome_base}.h" "${nome_base}.c"
