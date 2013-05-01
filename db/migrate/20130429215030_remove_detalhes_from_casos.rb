class RemoveDetalhesFromCasos < ActiveRecord::Migration
  def up
    remove_column :casos, :grupo_id
    remove_column :casos, :nome
    remove_column :casos, :assunto
    remove_column :casos, :descricao
  end

  def down
    add_column :casos, :grupo_id, :integer, :null => false
    add_column :casos, :nome, :string, :null => false
    add_column :casos, :assunto, :string
    add_column :casos, :descricao, :text
  end
end
