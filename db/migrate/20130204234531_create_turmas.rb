class CreateTurmas < ActiveRecord::Migration
  def change
    create_table :turmas do |t|
      t.belongs_to :grupo, :null => false
      t.string :nome, :null => false
      t.timestamps
    end
  end
end
