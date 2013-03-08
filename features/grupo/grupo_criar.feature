# language: pt

@grupo
Funcionalidade: Grupo de Trabalho
  Para agrupar as atividades que serão realizadas
  Como dono (o professor) do grupo 
  Eu quero poder criar meu grupo de trabalho (GT)

  Quando o usuário que cria um GT ele passa a ser o dono do grupo


Contexto:
  Dado que existe os seguintes usuários:
  |email                    |password|admin|
  |usuario@existe.com       |password|false|
  E desejo criar o Grupo:
  |nome     |
  |Meu Grupo|

Cenário: Criando um grupo de trabalho
  Dado estou logado como "usuario@existe.com"
  E estou na página inicial
  Quando eu clicar em "Criar Grupo"
  Então vou para a página de criação de grupo
  Quando eu preencher "Nome" com "Meu Grupo"
  E clicar em "Salvar"
  Então o grupo será criado
  E o dono do grupo é "usuario@existe.com"
  E o nome do grupo é "Meu Grupo"
  E estou visualizando o grupo

Cenário: Sem permissão para criar grupo
  Dado que estou na página inicial
  Quando eu clicar em "Criar Grupo"
  Então não estou vendo "Salvar"

# voltar

