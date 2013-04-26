# encoding: utf-8

#########################################################################
# 1-Dado - Dado - Dado - Dado - Dado - Dado - Dado - Dado - Dado - Dado
#########################################################################

# ----------------- >>>>    VISIT
Dado /^estou na página das propostas de caso do grupo$/ do
  visit grupo_propostas_path(@grupo)
end
Dado /^estou na página das propostas do grupo$/ do
  visit grupo_propostas_path(@grupo)
end

Dado /^estou na página da proposta$/ do
  visit grupo_proposta_path(@grupo, @proposta)
end

Dado /^estou na página de criar proposta$/ do
  visit new_grupo_proposta_path(@grupo)
end

Dado /^estou na página de edição da proposta$/ do
  visit edit_grupo_proposta_path(@grupo, @proposta)
end

# ----------------- >>>>    FACTORY

Dado /^existe uma proposta "(.*?)"$/ do |nome|
  @proposta = FactoryGirl.create(:proposta, :nome => nome, :grupo => @grupo, :propositor => @user)
end

Dado /^existe uma proposta "(.*?)" que sou propositor$/ do |nome|
  @proposta = FactoryGirl.create(:proposta, :nome => nome, :grupo => @grupo, :propositor => @user)
end

Dado /^existe uma proposta "(.*?)" que não sou propositor$/ do |nome|
  propositor = FactoryGirl.create(:user)
  @proposta = FactoryGirl.create(:proposta, :nome => nome, :grupo => @grupo, :propositor => propositor)
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

Quando /^anexar o documento do caso$/ do
  attach_file('Anexo', 'test/integration/resources/proposta.zip')
end

Quando /^eu tentar excluir a proposta$/ do
  ability = Ability.new(@user)
  if ability.can? :destroy, @proposta
    link_excluir_id = "excluir-proposta-#{@proposta.id.to_s}"
    click_on(link_excluir_id)
  end
end

Quando /^eu tentar editar a proposta$/ do
  @novo_nome = "Novo nome da proposta"

  ability = Ability.new(@user)
  if ability.can? :update, @proposta
    link = "editar-proposta-#{@proposta.id.to_s}"
    
    click_on(link)
    fill_in 'Nome', :with => @novo_nome
    click_on('Save')

    
  end

end


#########################################################################
# 3-Então - Então - Então - Então - Então - Então - Então - Então - Então
#########################################################################

# ----------------- >>>>    VERIFICA PÁGINA ATUAL
Então /^estou vendo os casos do grupo$/ do
  peding
end
Então /^estou vendo o novo caso$/ do
  peding
end

Então /^estou vendo as propostas do grupo$/ do
  current_path.should == grupo_propostas_path(@grupo)
  page.should have_content @proposta.nome
end

Então /^estou vendo o anexo da proposta$/ do
  find("#anexo").visible?.should be_true
  # find("#anexo").should have_content @proposta.anexo.identifier
  # page.should have_content @proposta.anexo.identifier
end



Então /^estou vendo a proposta$/ do
  current_path.should == grupo_proposta_path(@grupo, @proposta)
  page.should have_content @proposta.nome
end

Então /^estou vendo a nova proposta$/ do
  current_path.should == new_grupo_proposta_path(@grupo)
end

Então /^estou vendo o proprositor$/ do
  page.should have_content @proposta.propositor.email
  find("#propositor").should have_content @proposta.propositor.email
end

Então /^posso excluir a proposta$/ do
  link_excluir_id = "excluir-proposta-#{@proposta.id.to_s}"
  page.should have_selector('#'+link_excluir_id)
end

Então /^não posso excluir a proposta$/ do
  link_excluir_id = "excluir-proposta-#{@proposta.id.to_s}"
  page.should_not have_selector('#'+link_excluir_id)
end

Então /^posso editar a proposta$/ do
  link = "editar-proposta-#{@proposta.id.to_s}"
  page.should have_selector('#'+link)
end

Então /^não posso editar a proposta$/ do
  link = "editar-proposta-#{@proposta.id.to_s}"
  page.should_not have_selector('#'+link)
end


Então /^um caso "(.*?)" foi criado$/ do |nome|
  @caso = Caso.find_by_nome nome
  @caso.id.should_not be_nil
end

Então /^a proposta foi excluída$/ do
  Proposta.exists?(@proposta.id).should be_false
end

Então /^a proposta não foi excluída$/ do
  Proposta.exists?(@proposta.id).should be_true
end


Então /^sou o relator do caso$/ do
  pending
end

Então /^sou o proprositor da proposta$/ do
  @user.reload
  @proposta.reload
  (@proposta.propositor == @user).should be_true
end

Então /^a proposta de caso "(.*?)" foi criada$/ do |nome|
  @proposta = Proposta.find_by_nome nome
  @proposta.should_not be_nil
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

Então /^a proposta foi editada$/ do
  @proposta.reload
  @proposta.nome.should == @novo_nome
end

Então /^a proposta não foi editada$/ do
  @proposta.reload
  @proposta.nome.should_not == @novo_nome
end
######### Pendentes


