# encoding: utf-8

#########################################################################
# 1-Dado - Dado - Dado - Dado - Dado - Dado - Dado - Dado - Dado - Dado
#########################################################################

# ----------------- >>>>    VISIT

Dado /^estou na página da simulação$/ do
  visit simulacao_path(@simulacao)
end


# ----------------- >>>>    FACTORY

Dado /^existe a seguinte simulação do caso na turma:$/ do |table|
  @simulacao = FactoryGirl.create(:simulacao, :turma=>@turma, :proposta=>@proposta,
		:caso => Caso.new)

	@simulacao.caso.should_not be_nil

  table.hashes.each do |pessoa|
		user = User.find_by_email!(pessoa['usuario'])
    user.add_role pessoa['papel'], @simulacao
  end

end


Dado /^simulação na etapa Exame de Preliminar$/ do
  @simulacao.caso.peticao = File.open('erd.pdf')
  @simulacao.caso.estado = Caso::ESTADO[:exame_preliminar]
  @simulacao.caso.save

end


Dado /^simulação foi iniciada$/ do
  @simulacao.inicia
	@simulacao.save!
	@simulacao.caso.save!
  @simulacao.caso.estado.should == 1
  @simulacao.caso.estado.should == Caso::ESTADO[:aguardando_peticao]
end


#########################################################################
# 2-Quando - Quando - Quando - Quando - Quando - Quando - Quando - Quando
#########################################################################

Quando /^selecionar a petição para enviar$/ do
  attach_file('peticao', 'features/conversa.txt')
end

Quando /^selecionar as provas para enviar$/ do
  attach_file('provas', 'erd.pdf')
end


# ----------------- >>>>    AÇÕES DE CLIQUE

#########################################################################
# 3-Então - Então - Então - Então - Então - Então - Então - Então - Então
#########################################################################

# ----------------- >>>>    VERIFICA PÁGINA ATUAL

Então /^estou vendo a página da simulação$/ do
  current_path.should == simulacao_path(@simulacao)
end

Então /^estou baixando a petição do caso$/ do
  current_path.should == @simulacao.caso.peticao.url
end

Então /^ainda falta enviar as provas$/ do
  @simulacao.reload
	@simulacao.caso.peticao?.should be_true
	@simulacao.caso.provas?.should be_false
  @simulacao.caso.estado.should == Caso::ESTADO[:aguardando_peticao]

end

Então /^estou vendo a etapa Exame de Preliminar$/ do
  @simulacao.reload
	@simulacao.caso.peticao?.should be_true
  @simulacao.caso.estado.should == Caso::ESTADO[:exame_preliminar]
end

Então /^posso submeter petição$/ do
	find('.peticionario').should have_button('Submeter petição')
	find('.peticionario').should have_button('Submeter provas')
end

Então /^não posso submeter petição$/ do
	find('.peticionario').should_not have_button('Submeter petição')
	find('.peticionario').should_not have_button('Submeter provas')
end


######### Pendentes


