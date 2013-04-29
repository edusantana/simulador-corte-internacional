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

	@simulação.caso.should_not be_nil

  table.hashes.each do |pessoa|
		user = User.find_by_email!(pessoa['usuario'])
    user.add_role pessoa['papel'], @simulacao
  end

end


Dado /^simulação foi iniciada$/ do
  @simulacao.inicia
end


#########################################################################
# 2-Quando - Quando - Quando - Quando - Quando - Quando - Quando - Quando
#########################################################################


# ----------------- >>>>    AÇÕES DE CLIQUE

#########################################################################
# 3-Então - Então - Então - Então - Então - Então - Então - Então - Então
#########################################################################

# ----------------- >>>>    VERIFICA PÁGINA ATUAL

######### Pendentes


