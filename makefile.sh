#!/bin/bash

# Verifica se foi passado um argumento
if [ $# -ne 1 ]; then
    echo "Uso: $0 <nome_do_executavel>"
    exit 1
fi

# Obtém o nome do executável do primeiro argumento
executavel=$1

# Cria o arquivo Makefile
cat > Makefile <<EOF
TARGET = $executavel

all:
	gcc *.c -o \$(TARGET)

clean:
	 rm -f \$(TARGET)

run: 
	./\$(TARGET)

.PHONY: all clean run
EOF

echo "Makefile criado com sucesso!"

