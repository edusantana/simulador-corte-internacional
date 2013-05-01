class Simulacao < ActiveRecord::Base
  
  attr_accessible :iniciada, :caso
  
  resourcify
  belongs_to :turma
  belongs_to :proposta
  has_one :caso
  
  def inicia
    self.iniciada = true
    caso.estado = Caso::ESTADO[:aguardando_peticao]
  end
  
  # (:simulacao, :turma=>@turma, :proposta=>@proposta)
  
end
