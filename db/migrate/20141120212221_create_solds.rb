class CreateSolds < ActiveRecord::Migration
  def change
    create_table :solds do |t|
      t.string :title
      t.text :content
      t.float :price
      t.references :user, index: true
      t.references :type, index: true
      t.string :picture

      t.timestamps
    end
    add_index :listings, [:user_id, :created_at, :price, :type_id]
  end
end
