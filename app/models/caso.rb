class Caso < ActiveRecord::Base
  resourcify
  attr_accessible :nome, :assunto, :descricao, :estado
  
  Estados = {:nao_iniciado =>0, :aguardando_peticao => 1}
  
  belongs_to :simulacao
  
end
