class CreateGroupEntities < ActiveRecord::Migration[6.1]
  def change
    create_table :group_entities do |t|
      t.timestamps
    end
    
    add_reference :group_entities, :group, foreign_key: true
    add_reference :group_entities, :entity, foregn_key: true
  end
end
