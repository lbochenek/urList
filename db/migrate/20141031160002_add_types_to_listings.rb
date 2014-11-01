class AddTypesToListings < ActiveRecord::Migration
  def change
    add_reference :listings, :type, index: true
  end
end
