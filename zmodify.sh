#!/bin/bash

# rod@wgo.com.br
# 10/07/2014
# esse script le um arquivo texto contendo um endereco de email por linha e, com o utilitario zmprov do Zimbra, pode entao alterar o status da conta para ativo, trancado, manutencao ou fechado
#
# sintaxe geral do comando zmprov
# zmprov ma _accountname@domain.com_ zimbraAccountStatus _estado_
# onde _accountname@domain.com_ eh a conta de email a ter o estado alterado e _estado_ pode ser um dos seguintes: active, locked, maintenance ou closed.

# esse script deve ser executado como usuario zimbra, ou seja, como usuario root executar o comando: su zimbra
#

# exibe o help e finaliza o script com mensagem de erro
function help() {
	echo -e "\nUso: $0 arquivo_entrada_emails (--active | --locked | --maintenance | --closed)\n"
	exit 1; # sinaliza erro
}

# processa um arquivo de entrada e, para cada conta de email, aplica zmprov usando a acao que foi passada
function processa() {
	input="$1"
	action="$2"
	while read email; do
		echo "Processando conta: $email"
		zmprov ma "$email" zimbraAccountStatus "$action" # executa o comando que realiza todas as operacoes
	done < "$input"
	echo -e "\n ** Processamento finalizado! **\n"
}

# validacao
[ "$USER" != "zimbra" ] && echo -e "\nErro: o script so pode ser executado como usuario zimbra!\n" && help

[ "$#" -ne 2 ] && help # verifica numero de argumentos

input="$1" # verifica arquivo de entrada
[ ! -f "$input" ] && echo -e "\nO arquivo de entrada $input nao existe ou nao pode ser lido!\n" && help

# tudo ok
action="$2"

case "$action" in
"--active")
	echo -e "\n** Modo de ativacao de contas **\n"
	processa "$input" "active"
	;;
"--locked")
	echo -e "\n** Modo de trancamento contas **\n"
	processa "$input" "locked"
	;;
"--maintenance")
	echo -e "\n** Modo de manutencao de contas **\n"
	processa "$input" "maintenance"
	;;
"--closed")
	echo -e "\n** Modo de fechamento de contas **\n"
	processa "$input" "closed"
	;;
*) # acao especificada nao existe ou ainda nao foi implementada
	echo -e "\nErro: acao nao definida!\n"
	help
	;;
esac
