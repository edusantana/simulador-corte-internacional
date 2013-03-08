# encoding: utf-8

#########################################################################
# 1-Dado - Dado - Dado - Dado - Dado - Dado - Dado - Dado - Dado - Dado
#########################################################################

# ----------------- >>>>    VISIT
Dado /^estou na página das propostas de caso do grupo$/ do
  visit grupo_propostas_path(@grupo)
end

Dado /^estou na página dos casos do grupo$/ do
  visit grupo_casos_path(@grupo)
end

Dado /^estou na página de criar caso$/ do
  visit new_grupo_caso_path(@grupo)
end

Dado /^estou na página de edição do caso$/ do
  visit edit_grupo_caso_path(@grupo, @caso)
end

Dado /^estou na página do caso$/ do
  visit grupo_caso_path(@grupo, @caso)
end


# ----------------- >>>>    FACTORY
Dado /^existe um caso "(.*?)"$/ do |nome|
  @caso = FactoryGirl.create(:caso, :nome => nome, :grupo => @grupo)
  @user.add_role :relator, @caso
end

#########################################################################
# 2-Quando - Quando - Quando - Quando - Quando - Quando - Quando - Quando
#########################################################################


# ----------------- >>>>    AÇÕES DE CLIQUE
Quando /^tentar excluir o caso$/ do
    click_on("excluir-caso-#{@caso.id.to_s}")
end
Quando /^eu clicar para editar o caso$/ do
    click_on("editar-caso-#{@caso.id.to_s}")
end


#########################################################################
# 3-Então - Então - Então - Então - Então - Então - Então - Então - Então
#########################################################################

# ----------------- >>>>    VERIFICA PÁGINA ATUAL
Então /^estou vendo os casos do grupo$/ do
  current_path.should == grupo_casos_path(@grupo)
end
Então /^estou vendo o novo caso$/ do
  current_path.should == new_grupo_caso_path(@grupo)
end
Então /^estou vendo o caso$/ do
  current_path.should == grupo_caso_path(@grupo, @caso)
end

Então /^um caso "(.*?)" foi criado$/ do |nome|
  @caso = Caso.find_by_nome nome
  @caso.id.should_not be_nil
end

Então /^o caso foi excluído$/ do
  Caso.exists?(@caso.id).should be_false
end



Então /^sou o relator do caso$/ do
  @user.reload
  @caso.reload
  @user.has_role?(:relator, @caso).should be_true
end


# ----------------- >>>>    VERIFICA PROPRIEDADES DO OBJETO
Então /^o caso foi atualizado:$/ do |table|
  @caso.reload
  table.hashes.map do |hash|
    @caso.nome.should == hash["Nome"]
    @caso.assunto.should == hash["Assunto"]
    @caso.descricao.should == hash["Descricao"]
  end
end


######### Pendentes


