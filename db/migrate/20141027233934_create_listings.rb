class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.text :content
      t.float :price
      t.references :user, index: true

      t.timestamps
    end
    add_index :listings, [:user_id, :created_at, :price]
  end
end
