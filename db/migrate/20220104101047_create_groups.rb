class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.bigint :author_id
      t.string :name
      t.string :icon

      t.timestamps
    end

    add_foreign_key :groups, :users, column: :author_id
    add_index :groups, :author_id
  end
end
