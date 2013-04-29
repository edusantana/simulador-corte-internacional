class AddIniciadaToSimulacao < ActiveRecord::Migration
  def change
    add_column :simulacoes, :iniciada, :boolean, :default => false
  end
end
