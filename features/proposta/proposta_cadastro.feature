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


Cenário: Propondo um novo caso
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

@wip
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


Cenário: Como os casos do grupo são listados
  Dado existe um grupo que sou membro
  E existe um caso "Meu Caso X"
  E estou na página dos casos do grupo
  Então estou vendo "Meu Caso X"

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


