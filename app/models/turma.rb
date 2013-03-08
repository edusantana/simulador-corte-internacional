class Turma < ActiveRecord::Base
  attr_accessible :nome
  belongs_to :grupo
end
