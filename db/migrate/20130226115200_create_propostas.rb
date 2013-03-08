class CreatePropostas < ActiveRecord::Migration
  def change
    create_table :propostas do |t|
      t.belongs_to :grupo, :null => false
      t.string :nome, :null => false
      t.string :assunto, :null => false
      t.text :descricao

      t.timestamps
    end
  end
end
