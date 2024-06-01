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

echo "Arquivos criados com sucesso!"

cat > "${nome_base}.c" <<EOF
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include "${nome_base}.h"

${nome_base} *${nome_base}_create() 
{

    ${nome_base} *base = (${nome_base}*)malloc(sizeof(${nome_base}));
    if (base == NULL) {
        printf("Erro ao alocar memória.\n");
        return NULL;
    }

}

bool ${nome_base}_insert(${nome_base} *base, int data) 
{

}

bool ${nome_base}_delete(${nome_base} *base, int data)
{

}

${nome_base} *${nome_base}_join(${nome_base} *base1, ${nome_base} *base2) 
{

}

bool ${nome_base}_isEmpty(${nome_base} *base) 
{

}


EOF

EOF


cat > "${nome_base}.h" <<EOF
#ifndef ${nome_base^^}_H
#define ${nome_base^^}_H
#include <stdbool.h>

typedef struct _template {
    int data;
} ${nome_base};

${nome_base} *${nome_base}_create();
bool ${nome_base}_insert(${nome_base}* base, int data);
bool ${nome_base}_delete(${nome_base}* base, int data);
${nome_base} *${nome_base}_join(${nome_base} *base, ${nome_base} *base2);
bool ${nome_base}_isEmpty(${nome_base} *base);

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
