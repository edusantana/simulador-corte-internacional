# language: pt

@grupo
Funcionalidade: Participação em grupos
  Para organizar as pessoas que tem acesso ao meu grupo
  Como dono do grupo
  Eu quero gerenciar as permissões dos usuários no grupo

  Qualquer usuário pode pedir para participar do meu grupo
  Apenas os usuários que tiveram seu pedido confirmado
  poderão participar do grupo.

Contexto:
  Dado que existe os seguintes usuários:
  |email                    |password|admin|
  |usuario@existe.com       |password|false|
  |e@mail.com               |password|false|
  Dado estou logado como "usuario@existe.com"

Cenário: Solicitando permissão para participar do grupo
  Dado existe um grupo que não sou dono
  E que estou na página inicial
  Quando eu clicar para participar do grupo
  Então mensagem informando o pedido é exibida
  E um pedido de participação será emitido
  E não estou nos participantes do grupo
  Quando o pedido for aprovado
  Então farei parte dos participantes do grupo

Esquema do Cenário: Respondendo pedido de participação
  Dado existe um grupo que sou dono
  E "e@mail.com" pediu para participar do grupo
  E estou na página do grupo
  Então estou vendo o pedido pendente
  Quando eu <acao> a participação
  Então o pedido não está pendente
  E o usuário do pedido <participacao> do grupo

Exemplos:
  | acao    | participacao |
  | aprovar | participa    |
  | reprovar| não participa|

Esquema do Cenário: Usuários com permissão para aprovar pedidos
  Dado existe um grupo que <propriedade>
  E "e@mail.com" pediu para participar do grupo
  E estou na página do grupo
  Então estou visualizando o grupo
  E <visibilidade> vendo o pedido pendente

Exemplos:
  |propriedade| visibilidade |
  |sou dono   | estou        |
  |sou membro | não estou    |
