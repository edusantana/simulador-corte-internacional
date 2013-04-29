class Simulacao < ActiveRecord::Base
  
  attr_accessible :iniciada
  
  resourcify
  belongs_to :turma
  belongs_to :proposta
  has_one :caso
  
  def inicia
    self.iniciada = true
  end
  
  # (:simulacao, :turma=>@turma, :proposta=>@proposta)
  
end
