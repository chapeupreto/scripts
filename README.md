# Scripts

Simples e úteis scripts para ajudar em tarefas variadas.

## vdisable.sh

Utilize esse script para desativar em massa contas de e-mail usando o aplicativo vmoduser do vpopmail.

Deve ser passado um único argumento ao script, o qual é um arquivo texto contendo as contas de e-mail que serão desativadas, uma conta por linha.

## zmodify.sh

Utilize esse script para alterar o status de e-mail em massa usando o aplicativo zmcontrol do Zimbra.

Como argumentos ao script deve ser passado o arquivo texto contendo as contas de e-mail que terão seu status alterado e o status a ser aplicado.

O status pode ser um dos seguintes:

- --active
- --locked
- --maintenance
- --closed

## monitora_espaco.sh

Simples `bash` script que monitora uma relação de partições passadas como argumento e dispara um e-mail alertando se o espaço em disco em uma dessas partições ultrapassar um limite pré-determinado. Por padrão, esse limite é `90%`.

**Exemplo de uso: **

```sh
./monitora_espaco.sh / /home
```

No exemplo acima, se o espaço utilizado pelas partições `/` e `/home` ultrapassar `90%`, então um e-mail será disparado para o destinatário informando sobre essa situação.

A utilidade maior desse script é quando o mesmo é executado periodicamente via agendamento no `cron`. Assim, periodicamente o destinatário receberá e-mails de alerta informando sobre as partições que estiverem na iminência de esgotamento de espaço.

### Dependências

- Bash 3.+
- Linux ou FreeBSD
- linguagem de programação `awk`
- mail (comando parte do pacote `mailx`)

### Informações adicionais

Para alterar o e-mail do destinatário, deve-se editar o script e alterar a variável de nome `destinatario`.

Por padrão, o limite considerado é de `90%`. Deve-se alterar a variável `limite` no script para mudar esse comportamento.
