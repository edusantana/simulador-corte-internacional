class Turma < ActiveRecord::Base
  attr_accessible :nome
  belongs_to :grupo
  
  has_and_belongs_to_many :alunos, :class_name => "User", :join_table => :alunos_turmas
  has_many :simulacoes
  
  def add_aluno(aluno)
    alunos << aluno
  end
  
end
