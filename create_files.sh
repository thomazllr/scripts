#!/bin/bash

# Verifica se foi passado um parâmetro
if [ $# -ne 1 ]; then
    echo "Uso: $0 <nome_base>"
    exit 1
fi


nome_base=$1

touch "${nome_base}.h" "${nome_base}.c"


echo "Arquivos criados com sucesso!"

# Adiciona os includes necessários ao arquivo .c
cat > "${nome_base}.c" <<EOF
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include "${nome_base}.h"

${nome_base} *${nome_base}_create() 
{

    ${nome_base} * = (${nome_base}*)malloc(sizeof(${nome_base}));

}


EOF


# Cria os arquivos com extensões .h e .c
cat > "${nome_base}.h" <<EOF
#ifndef ${nome_base^^}_H
#define ${nome_base^^}_H
#include <stdbool.h>

typedef struct _ {
    int data;
} ${nome_base};



#endif // ${nome_base^^}_H
EOF

if [ ! -f "main.c" ]; then
    echo "Arquivo main.c não encontrado!"
    exit 1
fi

# Define os includes a serem adicionados
includes=("#include \"${nome_base}.h\"")

# Função para adicionar includes ao arquivo se não existirem
add_includes() {
    local file=$1
    for include in "${includes[@]}"; do
        if ! grep -qx "$include" "$file"; then
            sed -i "1i $include" "$file"
        fi
    done
}

# Adiciona os includes ao arquivo main.c
add_includes "main.c"

echo "Includes adicionados ao arquivo main.c com sucesso!"
