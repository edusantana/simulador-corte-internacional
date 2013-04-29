class CreateSimulacoes < ActiveRecord::Migration
  def change
    create_table :simulacoes do |t|
      
      t.references :turma
      t.references :proposta

      t.timestamps
    end
  end
end
