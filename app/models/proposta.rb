class Proposta < ActiveRecord::Base
  mount_uploader :anexo, PropostaUploader
  resourcify
  attr_accessible :assunto, :descricao, :nome, :propositor, :anexo, :anexo_cache 
  belongs_to :grupo
  belongs_to :propositor, :class_name => "User"
  
  has_many :simulacoes
  
end
