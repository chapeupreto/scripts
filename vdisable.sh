#!/usr/local/bin/bash

# rod@wgo.com.br
# 10/07/2014 - script para desabilitar as contas de emails listadas em um arquivo de entrada
# utiliza vmoduser do vpopmail para desabilitar as contas

function help() {
        echo -e "\nUso: $0 _arquivo_emails_.txt\n"
        exit 1; # sinaliza erro
}

# validacao

[ `whoami` != "root" ] && echo -e "\nErro: o script so pode ser executado como usuario root!\n" && help

[ "$#" -ne 1 ] && echo -e "\nErro: o nome do arquivo de entrada deve ser fornecido!\n" && help

input="$1"

[ ! -f "$input" ] && echo -e "\nErro: o arquivo de entrada $input nao existe!\n" && help

# tudo ok, entao le cada email por linha do arquivo de entrada e executa o comando para desabilitar a conta
while read email; do
        echo "Disabilitando $email"
        vmoduser -d -p -w -i "$email"
done < "$input"
