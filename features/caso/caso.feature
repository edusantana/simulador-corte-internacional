# language: pt

@caso @simulação
Funcionalidade: Caso de estudo
  Para simuladar um caso
  Como lider do grupo
  Eu quero permitir que todos os membros da simulação
  possam interagir com o caso

Contexto:
  Dado que existe os seguintes usuários:
  |email                    |
  |peticionario1@mail.com   |
  |peticionario2@mail.com   |
  |agente1@mail.com         |
  |agente2@mail.com         |
  |juiz1@mail.com           |
  |juiz2@mail.com           |
  |juiz3@mail.com           |
	|juiz_presidente@mail.com |
	|amicus_curiae1@mail.com  |
	|amicus_curiae2@mail.com  |
	|professor@mail.com  		  |
	|monitor@mail.com  		    |
	|suporte@mail.com  		    |
	|visitante@mail.com  		  |
  E existe um grupo com todos estes usuários
  E existe uma proposta de caso "Brasil x Ximenes"
  E existe uma turma com todos estes alunos
  E existe a seguinte simulação do caso na turma:
  |usuario                   | papel |
  |peticionario1@mail.com    | peticionario |
  |peticionario2@mail.com    | peticionario |
  |agente1@mail.com          | agente |
  |agente2@mail.com          | agente |
  |juiz1@mail.com            | juiz |
  |juiz2@mail.com            | juiz |
  |juiz3@mail.com            | juiz |
  |juiz_presidente@mail.com  | juiz_presidente |
  |amicus_curiae1@mail.com   | amicus_curiae |
  |amicus_curiae2@mail.com   | amicus_curiae |
  |professor@mail.com        | professor |
  |visitante@mail.com        |  |

@wip @simulação
Esquema do Cenário: Iniciando a simulação
	Dado simulação foi iniciada
	E estou logado como "<usuário>"
	E estou na página da simulação
	Então estou vendo "Equipe"
	E estou vendo "Proposta do caso"
	E estou vendo "Aguardando submissão da petição."
	E estou vendo "Aguardando notificação."

@simulação
Cenários: 
  |usuário                  |
  |peticionario1@mail.com   |



