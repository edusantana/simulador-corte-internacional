class AddCasoToSimulacao < ActiveRecord::Migration
  def change
    change_table :casos do |t|
      t.references :simulacao
    end
  end
end
