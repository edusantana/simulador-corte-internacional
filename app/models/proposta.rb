class Proposta < ActiveRecord::Base
  resourcify
  attr_accessible :assunto, :descricao, :nome
  
  belongs_to :grupo
end
