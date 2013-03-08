# encoding: utf-8


# 1-Dado - Dado - Dado - Dado - Dado - Dado - Dado - Dado - Dado - Dado
Dado /^estou na página das turmas$/ do
  visit grupo_turmas_path(@grupo)
end

Dado /^existe uma turma no grupo$/ do
  @turma = FactoryGirl.create(:turma, :grupo=>@grupo)
  @turma.id.should_not be_nil
end


# 2-Quando - Quando - Quando - Quando - Quando - Quando - Quando - Quando

Quando /^eu clicar para criar turma$/ do
  click_on("Criar Turma")
end

Quando /^eu clicar para excluir a turma$/ do
  page.should have_content @turma.nome
  click_on("excluir-grupo-turma-#{@grupo.id.to_s}-#{@turma.id.to_s}")
end

Quando /^eu tentar excluir a turma$/ do
  page.has_selector?('#'+"excluir-grupo-turma-#{@grupo.id.to_s}-#{@turma.id.to_s}").should be_false
end



# 3-Então - Então - Então - Então - Então - Então - Então - Então - Então

Então /^estou vendo as turmas( do grupo)?$/ do |do_grupo|
  current_path.should == grupo_turmas_path(@grupo)
end
Então /^estou visualizando a turma$/ do
  current_path.should == grupo_turma_path(@grupo, @turma)
end



Então /^(posso|não posso) criar turmas$/ do |permissao|
  if permissao == "posso"
    page.should have_content 'Criar Turma'
  elsif permissao == "não posso"
    page.should_not have_content 'Criar Turma'
  else
    pending
  end
end

Então /^uma nova turma "(.*?)" foi criada$/ do |nome|
  @turma = Turma.find_by_nome nome
  @turma.should_not be_nil
  @turma.id.should_not be_nil
end


Então /^a turma foi excluída$/ do
  Turma.exists?(@turma.id).should be_false
end
Então /^a turma não foi excluída$/ do
  Turma.exists?(@turma.id).should be_true
end


######### Pendentes


