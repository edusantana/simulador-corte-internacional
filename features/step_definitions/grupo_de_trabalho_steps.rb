# encoding: utf-8


# 1-Dado - Dado - Dado - Dado - Dado - Dado - Dado - Dado - Dado - Dado

Dado /^estou na página do grupo$/ do
  visit grupo_path(@grupo)
end


Dado /^desejo criar o Grupo:$/ do |table|
  table.hashes.each do |hash|  
    @grupo = FactoryGirl.build(:grupo, hash)
    @grupo.id.should be_nil
  end 
end

Dado /^existe um grupo que sou dono$/ do
  @grupo = FactoryGirl.create(:grupo)
  @user.add_role :owner, @grupo
end

Dado /^existe um grupo com todos estes usuários$/ do
  @grupo = FactoryGirl.create(:grupo)
  User.all do |user|
    user.add_role :member, @grupo
  end
end


Dado /^existe um grupo que sou membro$/ do
  @grupo = FactoryGirl.create(:grupo)
  @user.add_role :member, @grupo

end

Dado /^existe um grupo que não sou dono$/ do
  @grupo = FactoryGirl.create(:grupo)
end

Dado /^"(.*?)" pediu para participar do grupo$/ do |email|
  @pedido = User.find_by_email email
  @grupo.add_solicitacao_participacao(@pedido)
end

# 2-Quando - Quando - Quando - Quando - Quando - Quando - Quando - Quando

Quando /^eu clicar para excluir o grupo$/ do
  click_on('excluir-grupo-'+@grupo.id.to_s)
end

Quando /^eu clicar para participar do grupo$/ do
  click_on('participar-grupo-'+@grupo.id.to_s)
end

Quando /^eu aprovar a participação$/ do
  click_on("aprovar-participacao-#{@grupo.id.to_s}-#{@pedido.id.to_s}")
end

Quando /^eu reprovar a participação$/ do
  click_on("reprovar-participacao-#{@grupo.id.to_s}-#{@pedido.id.to_s}")
end

Quando /^o pedido for aprovado$/ do
  @grupo.aprovar_participacao(@user)
end


# 3-Então - Então - Então - Então - Então - Então - Então - Então - Então

Então /^vou para a página de criação de grupo$/ do
  current_path.should == new_grupo_path
end

Então /^estou na página de edição de Grupo$/ do
  current_path.should == edit_grupo_path(@grupo)
end

Então /^estou (visualizando|vendo) o grupo$/ do |vendo|
  current_path.should == grupo_path(@grupo)
end


Então /^o grupo será criado$/ do
  @grupo = Grupo.find_by_nome(@grupo.nome)
  @grupo.id.should_not be_nil
end

Então /^o dono do grupo é "(.*?)"$/ do |email|
  @user.email.should == email
  @user.has_role?(:owner, @grupo).should be_true
end

Então /^não estou nos participantes do grupo$/ do
  @user.reload
  @grupo.reload
  #@user = User.find(@user.id)
  #@grupo = Grupo.find(@grupo.id)
  @user.has_role?(:member, @grupo).should be_false
end

Então /^farei parte dos participantes do grupo$/ do
  @user.reload
  @grupo.reload
  @user.has_role?(:member, @grupo).should be_true
end

Então /^o usuário do pedido participa do grupo$/ do
  @pedido.reload
  @grupo.reload
  @pedido.has_role?(:member, @grupo).should be_true
end

Então /^o usuário do pedido não participa do grupo$/ do
  @pedido.reload
  @grupo.reload
  @pedido.has_role?(:member, @grupo).should be_false
end

Então /^o nome do grupo é "(.*?)"$/ do |nome|
  @grupo.nome.should == nome
end

Então /^o grupo foi excluído$/ do
  Grupo.exists?(@grupo.id).should be_false
end

Então /^o grupo não foi excluído$/ do
  Grupo.exists?(@grupo.id).should be_true
end

Então /^um pedido de participação será emitido$/ do
  @grupo.participacoes_pendentes.exists?(@user).should be_true
end

Então /^o pedido foi aprovado$/ do
  step "o pedido não está pendente"
end

Então /^o pedido foi reprovado$/ do
  step "o pedido não está pendente"
end

Então /^o pedido não está pendente$/ do
  @grupo.participacoes_pendentes.exists?(@pedido).should be_false
end


Então /^mensagem informando o pedido é exibida$/ do
  step "mensagem 'participacao.pedido.enviado' é exibida"
end

Então /^estou vendo o pedido pendente$/ do
  page.should have_content 'Pedidos de participatção pendentes'
  page.should have_content @pedido.email
end

Então /^não estou vendo o pedido pendente$/ do
  page.should_not have_content 'Pedidos de participatção pendentes'
  page.should_not have_content @pedido.email
end


######### Pendentes

















