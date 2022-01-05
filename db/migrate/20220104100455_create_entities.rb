class CreateEntities < ActiveRecord::Migration[6.1]
  def change
    create_table :entities do |t|
      t.references :author, null: false, foreign_key: {to_table: :users}
      t.string :name
      t.decimal :amount

      t.timestamps
    end
  end
end
