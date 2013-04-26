# encoding: utf-8


Dado /^que existe os seguintes usuários:$/ do |table|
  table.hashes.each do |attributes|
    admin = attributes.delete("admin") == "true"
    #papel_no_curso = attributes['papel_no_curso']
    #attributes.delete('papel_no_curso')

		
		attributes['password']="password"
    @user = User.create!(attributes)

    if admin 
      @user.add_role "admin"
    end

    #@user.add_role papel_no_curso, @curso unless papel_no_curso == ''

  end
end

Dado /^estou logado como "([^\"]*)"$/ do |email|
  @user = User.find_by_email!(email)
  step "estou logado como um deles"
end

Dado /^estou logado como um deles$/ do
  step "que estou na página inicial"
  step %Q{eu clicar em "Login"}
  step %Q{eu preencher "Email" com "#{@user.email}"}
  step %Q{eu preencher "Password" com "password"}
  step %Q{eu clicar em "Sign in"}
  step %Q{devo ver "#{I18n.translate('devise.sessions.signed_in')}"}
  step %Q{devo ir para página inicial}
end


Então /^devo ver mensagem registrado com sucesso$/ do
  page.should have_content I18n.t('devise.registrations.signed_up')  
end

