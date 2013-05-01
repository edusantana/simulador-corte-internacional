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

@simulação
Esquema do Cenário: Caso não iniciado
	E estou logado como "<usuário>"
	E estou na página da simulação
	Então estou vendo "Equipe"
	E estou vendo "Este caso ainda não foi iniciado."

Cenários: 
  |usuário                  |
  |peticionario1@mail.com   |



@simulação
Esquema do Cenário: Iniciando a simulação
	Dado simulação foi iniciada
	E estou logado como "<usuário>"
	E estou na página da simulação
	Então estou vendo "Equipe"
	E estou vendo "Proposta do caso"
	E estou vendo "Aguardando submissão da petição."
	E estou vendo "Aguardando notificação."
	E estou vendo "Aguardando peticionários submeterem a petição inicial."

Cenários: 
  |usuário                  |
  |peticionario1@mail.com   |


@simulação
Esquema do Cenário: Enviando a petição e provas
	Dado simulação foi iniciada
	E estou logado como "<usuário>"
	E estou na página da simulação
	Quando selecionar a petição para enviar
  E clicar em "Submeter petição"
  Então estou vendo a página da simulação
  E ainda falta enviar as provas
	Quando selecionar as provas para enviar
  E clicar em "Submeter provas"
  Então estou vendo a etapa Exame de Preliminar

Cenários: 
  |usuário                  |
  |peticionario1@mail.com   |


@wip @simulação
Esquema do Cenário: Permissão de envio de petição
	Dado simulação foi iniciada
	E estou logado como "<usuário>"
	E estou na página da simulação
	Então <permissão> submeter petição

Cenários: 
  |usuário                  |permissão|
  |peticionario1@mail.com   |posso|
  |peticionario2@mail.com   |posso|
  |agente1@mail.com         |não posso|
  |juiz1@mail.com           |não posso|
	|amicus_curiae1@mail.com  |não posso|
	|visitante@mail.com  		  |não posso|



@simulação
Esquema do Cenário: Abrindo petição e provas enviadas
	Dado simulação na etapa Exame de Preliminar
	E estou logado como "<usuário>"
	E estou na página da simulação
	Quando eu clicar em "Petição"
  Então estou baixando a petição do caso

Cenários: 
  |usuário                  |
  |peticionario1@mail.com   |
  |agente1@mail.com   |
  |juiz1@mail.com   |

