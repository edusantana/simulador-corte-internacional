class AddAnexoToProposta < ActiveRecord::Migration
  def change
      add_column :propostas, :anexo, :string
  end
end
