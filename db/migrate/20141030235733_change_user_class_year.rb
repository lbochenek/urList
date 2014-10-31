class ChangeUserClassYear < ActiveRecord::Migration
  def change
    change_column :users, :classYr, :string
  end
end
