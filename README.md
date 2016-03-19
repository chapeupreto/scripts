# Scripts

Simples e ?teis scripts para ajudar em tarefas variadas.

## vdisable.sh

Utilize esse script para desativar em massa contas de e-mail usando o aplicativo vmoduser do vpopmail.

Deve ser passado um ?nico argumento ao script, o qual ? um arquivo texto contendo as contas de e-mail que ser?o desativadas, uma conta por linha.

## zmodify.sh

Utilize esse script para alterar o status de e-mail em massa usando o aplicativo zmcontrol do Zimbra.

Como argumentos ao script deve ser passado o arquivo texto contendo as contas de e-mail que ter?o seu status alterado e o status a ser aplicado.

O status pode ser um dos seguintes:

- --active
- --locked
- --maintenance
- --closed

## monitora_espaco.sh

Simples `bash` script que monitora uma rela��o de parti��es passadas como argumento e dispara um e-mail alertando se o espa�o em disco em uma dessas parti��es ultrapassar um limite pr�-determinado. Por padr�o, esse limite � `90%`.

**Exemplo de uso: **

```sh
./monitora_espaco.sh / /home
```

No exemplo acima, se o espa�o utilizado pelas parti��es `/` e `/home` ultrapassar `90%`, ent�o um e-mail ser� disparado para o destinat�rio informando sobre essa situa��o.

A utilidade maior desse script � quando o mesmo � executado periodicamente via agendamento no `cron`. Assim, periodicamente o destinat�rio receber� e-mails de alerta informando sobre as parti��es que estiverem na imin�ncia de esgotamento de espa�o.

### Depend�ncias

- Bash 3.+
- Linux ou FreeBSD
- linguagem de programa��o `awk`
- mail (comando parte do pacote `mailx`)

### Informa��es adicionais

Para alterar o e-mail do destinat�rio, deve-se editar o script e alterar a vari�vel de nome `destinatario`.

Por padr�o, o limite considerado � de `90%`. Deve-se alterar a vari�vel `limite` no script para mudar esse comportamento.
