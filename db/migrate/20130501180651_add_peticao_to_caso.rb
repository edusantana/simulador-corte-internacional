class AddPeticaoToCaso < ActiveRecord::Migration
  def change
    add_column :casos, :peticao, :string
  end
end
