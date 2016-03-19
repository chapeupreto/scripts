#!/bin/bash

# script que envia um alerta por e-mail comunicando sobre esgotamento de espaco em disco
# rod@wgo.com.br
# version 1
# since 2016-03-17

limite=90
host=$(hostname)
destinatario="rod@wgo.com.br"

for particao in "$@"; do
        espaco=$(df -H | grep -w "${particao}" | awk '{ print $5 }' | tr -d "%")
        [[ "${espaco}" -ge "${limite}" ]] && echo "Alerta: servidor ${host} com ${espaco}% de espaco ocupado na particao ${particao}" | mail -s "ALERTA DE ESPACO" "${destinatario}"
done
