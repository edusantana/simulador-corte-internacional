class Grupo < ActiveRecord::Base
  resourcify
  attr_accessible :nome
  has_and_belongs_to_many :participacoes_pendentes, :class_name => "User", :join_table => :grupos_participacoes_pendentes
  has_many :turmas
  has_many :propostas
   
  def add_solicitacao_participacao(user)
    if (not participacoes_pendentes.exists?(user))     
       participacoes_pendentes<<user
    end
  end
 
  def aprovar_participacao(user)
    if (!user.has_role? :member, self)     
      user.add_role :member, self
      self.participacoes_pendentes.delete(user)
    end
  end

  def reprovar_participacao(user)
    self.participacoes_pendentes.delete(user) if self.participacoes_pendentes.exists?(user) 
  end
 
 
end
