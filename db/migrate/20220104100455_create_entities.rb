class CreateEntities < ActiveRecord::Migration[6.1]
  def change
    create_table :entities do |t|
      t.bigint :author_id
      t.string :name
      t.decimal :amount

      t.timestamps
    end

    add_foreign_key :entities, :users, column: :author_id
    add_index :entities, :author_id
  end
end
