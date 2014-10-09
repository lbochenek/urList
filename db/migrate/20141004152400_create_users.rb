class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fName
      t.string :lName
      t.string :email
      t.integer :sID
      t.integer :classYr

      t.timestamps
    end
  end
end
