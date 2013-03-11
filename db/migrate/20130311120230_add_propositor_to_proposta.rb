class AddPropositorToProposta < ActiveRecord::Migration
  def change
    
    change_table :propostas do |t|
      t.belongs_to :propositor, :null => false
    end
    
    
  end
end
