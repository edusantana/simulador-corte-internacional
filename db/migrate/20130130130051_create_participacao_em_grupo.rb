class CreateParticipacaoEmGrupo < ActiveRecord::Migration
  def change
    create_table :grupos_participacoes_pendentes, :id => false do |t|
      t.integer :grupo_id, :null => false
      t.integer :user_id, :null => false
    end
  end

end
