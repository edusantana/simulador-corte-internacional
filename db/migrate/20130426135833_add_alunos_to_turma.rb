class AddAlunosToTurma < ActiveRecord::Migration
  def change
    create_table :alunos_turmas, :id => false do |t|
      t.integer :turma_id, :null => false
      t.integer :user_id, :null => false
    end
  end
end
