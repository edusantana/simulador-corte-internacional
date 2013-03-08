class Caso < ActiveRecord::Base
  resourcify
  attr_accessible :nome, :assunto, :descricao
  
end
