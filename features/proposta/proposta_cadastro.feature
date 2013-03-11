# language: pt

@proposta
Funcionalidade: Proposta de casos para estudo
  Para registrar as propostas de casos que tenho interesse em estudar
  Como lider do grupo
  Eu quero permitir que todos os membros do grupo
  possam enviar propostas de casos

  Caso vira: proposta de caso
  relator vira: propositor

Contexto:
  Dado que existe os seguintes usuários:
  |email                    |password|admin|
  |eu@mail.com              |password|false|
  |ele@mail.como            |password|false|
  E estou logado como "eu@mail.com"


Cenário: Criando uma proposta de caso
  Dado existe um grupo que sou membro
  E estou na página das propostas de caso do grupo
  Quando eu clicar em "Nova proposta de Caso"
  E eu preencher "Nome" com "Brasil x Ximenes"
  E eu preencher "Assunto" com "Sistema de saúde"
  E eu preencher "Descricao" com "Um idoso abandonado(...)"
  E anexar o documento do caso
  E clicar em salvar
  Então a proposta de caso "Brasil x Ximenes" foi criada
  E sou o proprositor da proposta
  E estou vendo a proposta

Esquema do Cenário: Navegação sobre as propostas
  Dado existe um grupo que sou membro
  E existe uma proposta "Proposta de Caso X"
  E estou na página <página>
  Quando eu clicar em <link>
  Então estou vendo <destino>

Cenários:
  |página                | link                   | destino               |
  |do grupo              | "Propostas"            | as propostas do grupo |
  |das propostas do grupo| "Voltar"               | o grupo               |
  |das propostas do grupo| "Nova proposta de Caso"| a nova proposta       |
  |da proposta           | "Voltar"               | as propostas do grupo |
  |de criar proposta     | "Voltar"               | as propostas do grupo |
  |de edição da proposta | "Voltar"               | as propostas do grupo |
  |de edição da proposta | "Exibir"               | a proposta            |

Cenário: Como as propostas dos grupos são listadas
  Dado existe um grupo que sou membro
  E existe uma proposta "Proposta de Caso X"
  E estou na página das propostas do grupo
  Então estou vendo "Proposta de Caso X"


Cenário: Como uma proposta é exibida
  Dado existe um grupo que sou membro
  E existe uma proposta "Proposta de Caso X"
  E estou na página das propostas do grupo
  Quando eu clicar em "Proposta de Caso X"
  Então estou vendo a proposta
  E estou vendo "Proposta de Caso X"
  E estou vendo o proprositor
  E estou vendo o anexo da proposta


@wip
Esquema do Cenário: Permissão de exclusão de propostas
  Dado existe um grupo que sou <participacao>
  E existe uma proposta "Proposta de Caso X" que <propositor> propositor
  E estou na página das propostas do grupo
  Então <permissao> excluir a proposta

Cenários:
  |participacao | propositor| permissao |
  | dono        | sou       | posso     |
  | membro      | não sou   | não posso |
  | dono        | não sou   | posso     |



Cenário: Excluindo um caso relatado
  Dado existe um grupo que sou membro
  E existe um caso "Meu Caso X"
  E estou na página dos casos do grupo
  Quando tentar excluir o caso
  Então o caso foi excluído

Cenário: Editando um caso relatado
  Dado existe um grupo que sou membro
  E existe um caso "Meu Caso X"
  E estou na página dos casos do grupo
  Quando eu clicar para editar o caso
  E eu preencher "Nome" com "Novo nome"
  E eu preencher "Assunto" com "Novo Assunto"
  E eu preencher "Descricao" com "Nova Descrição"
  E clicar em salvar
  Então estou vendo o caso
  E o caso foi atualizado:
  |Nome       |Assunto       |Descricao     |
  |Novo nome  |Novo Assunto  |Nova Descrição|


