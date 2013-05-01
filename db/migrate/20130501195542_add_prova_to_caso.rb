class AddProvaToCaso < ActiveRecord::Migration
  def change
    add_column :casos, :provas, :string
  end
end
