# language: pt

@grupo
Funcionalidade: Grupo de Trabalho
  Para agrupar as atividades que serão realizadas
  Como lider do grupo
  Somente eu posso apagar o meu grupo

Contexto:
  Dado que existe os seguintes usuários:
  |email                    |password|admin|
  |usuario@existe.com       |password|false|
  E estou logado como "usuario@existe.com"

Cenário: Com permissão para apagar grupo
  E existe um grupo que sou dono
  E que estou na página inicial
  Quando eu clicar para excluir o grupo
  Então o grupo foi excluído

Cenário: Sem permissão para apagar grupo
  E existe um grupo que não sou dono
  E que estou na página inicial
  Quando eu clicar para excluir o grupo
  Então o grupo não foi excluído
  E mensagem de permissão negada é exibida

