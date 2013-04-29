class AddEstadoToCaso < ActiveRecord::Migration
  def change
    add_column :casos, :estado, :integer, :default => 0
  end
end
