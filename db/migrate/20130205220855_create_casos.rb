class CreateCasos < ActiveRecord::Migration
  def change
    create_table :casos do |t|
      t.belongs_to :grupo, :null => false
      t.string :nome, :null => false
      t.string :assunto
      t.text :descricao

      t.timestamps
    end
  end
end
