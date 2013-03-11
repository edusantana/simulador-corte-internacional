
FactoryGirl.define do

  sequence :user_email do |n|
    "user#{n}@mail.com"
  end
  sequence :grupo_nome do |n|
    "Grupo de Trabalho - #{n}"
  end
  sequence :turma_nome do |n|
    "Nome da Turma - #{n}"
  end
  sequence :caso_nome do |n|
    "Nome do Caso - #{n}"
  end

  sequence :proposta_nome do |n|
    "Proposta de Caso - #{n}"
  end

  factory :user do
    email { generate(:user_email) }
    password 'password'
  end
   
  factory :grupo do
    nome { generate(:grupo_nome) }
  end

  factory :turma do
    nome { generate(:turma_nome) }
    grupo
  end

  factory :caso do
    nome { generate(:caso_nome) }
    grupo
    assunto 'Assunto do caso'
    descricao 'Descricao do caso'
  end

  factory :proposta do
    nome { generate(:caso_nome) }
    grupo
    assunto 'Assunto do caso'
    descricao 'Descricao do caso'
    anexo { File.open(File.join(Rails.root, 'test','integration','resources','proposta.zip')) }
    # propositor
  end

end