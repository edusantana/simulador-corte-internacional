# language: pt

@turma
Funcionalidade: Turmas de um Grupo de Trabalho
  Para gerenciar os meus alunos
  Como lider do grupo
  Eu quero poder criar turmas no meu grupo

Contexto:
  Dado que existe os seguintes usuários:
  |email                    |password|admin|
  |eu@mail.com              |password|false|
  |ele@mail.como            |password|false|
  E estou logado como "eu@mail.com"

Esquema do Cenário: Permissão para criar turmas
  Dado existe um grupo que sou <participacao>
  E estou na página do grupo
  Então <permissao> criar turmas 
  E estou visualizando o grupo
  Dado estou na página das turmas
  Então <permissao> criar turmas 

Cenários:
  |participacao | permissao |
  | dono        | posso     |
  | membro      | não posso |

Cenário: Criando uma turma
  Dado existe um grupo que sou dono
  E estou na página do grupo
  Quando eu clicar para criar turma
  E eu preencher "Nome" com "Manhã"
  E clicar em salvar
  Então uma nova turma "Manhã" foi criada
  E estou visualizando a turma

Esquema do Cenário: Excluindo uma turma
  Dado existe um grupo que sou <participacao>
  E existe uma turma no grupo
  E estou na página das turmas
  Quando eu <acao> excluir a turma
  Então a turma <resultado> excluída
  E estou vendo as turmas do grupo
Cenários:
  |participacao | acao         | resultado |
  | dono        | clicar para  | foi       |
  | membro      | tentar       | não foi   |

