# encoding: utf-8

# DADO ----------------

Dado /^que estou na página inicial$/ do
  visit root_path
end

Dado /^cenário ignorado$/ do
  # Ignorando cenário por razão qualquer
  pending 
end



# QUANDO ----------------
Quando /^clicar em "(.*?)"$/ do |botao_ou_link|
   click_on botao_ou_link
end

Quando /^clicar em  "(.*?)"$/ do |link|
  click_on link
end

Quando /^eu clicar em "(.*?)"$/ do |link|
  click_on link
end

Quando /^(eu )?clicar em salvar$/ do |eu|
  click_on I18n.t('Save')
end


Então /^não existe link "(.*?)"$/ do |link|
  page.should_not have_link(link)
end
Então /^existe link "(.*?)"$/ do |link|
  page.should have_link(link)
end



Quando /^eu preencher "(.*?)" com "(.*?)"$/ do |campo, valor|
  fill_in campo, :with => valor
end
Quando /^eu preencher "(.*?)" com$/ do |campo, valor|
  fill_in campo, :with => valor
end



# ENTÃO ----------------

Então /^estou na página inicial$/ do
  current_path.should == root_path
end

Então /^tradução de '(.*?)'$/ do |i18n|
  page.should have_content I18n.t(i18n)
end

Então /^mensagem '(.*?)' é exibida$/ do |i18n|
  page.should have_content I18n.t(i18n)
end

Então /^devo ver "(.*?)"$/ do |mensagem|
  page.should have_content mensagem
end

Então /^estou vendo "(.*?)"$/ do |mensagem|
  page.should have_content mensagem
end
Então /^não estou vendo "(.*?)"$/ do |mensagem|
  page.should_not have_content mensagem
end

Então /^devo ir para página inicial$/ do
  current_path.should == root_path(@questao)
end

Então /^a etapa "(.*?)" deve está "(.*?)"$/ do |etapa, cor|
  etapa_id = etapa.gsub(/[ ]/, '_')
  page.has_selector?('#etapas').should be_true
  page.has_selector?('#etapas li#'+etapa_id).should be_true
  page.has_selector?('#etapas li#'+etapa_id+'.'+cor).should be_true

  page.find('#etapas li#'+etapa_id).should have_content etapa
end

Então /^não tenho permissão$/ do
  step 'estou vendo "Acesso Negado!"'
end

Então /^tenho permissão$/ do
  step 'não estou vendo "Acesso Negado!"'
end

Então /^mensagem de permissão negada é exibida$/ do
  page.should have_content I18n.translate('unauthorized.manage.all')
  page.should_not have_content "translation missing"
end


