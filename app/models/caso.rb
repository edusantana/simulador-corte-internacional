class Caso < ActiveRecord::Base
  resourcify
  attr_accessible :nome, :assunto, :descricao, :estado
  mount_uploader :peticao, PeticaoUploader
  mount_uploader :provas, ProvasUploader

  belongs_to :simulacao

  
  ESTADO = {:nao_iniciado =>0, :aguardando_peticao => 1, :exame_preliminar=>2}
  
  
end
