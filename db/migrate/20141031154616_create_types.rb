class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :category

      t.timestamps
    end
    add_index :types, [:category]
  end
end
