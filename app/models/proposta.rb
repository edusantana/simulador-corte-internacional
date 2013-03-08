class Proposta < ActiveRecord::Base
  mount_uploader :anexo, PropostaUploader
  resourcify
  attr_accessible :assunto, :descricao, :nome, :anexo, :anexo_cache
  
  
  belongs_to :grupo
end
