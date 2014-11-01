class Type < ActiveRecord::Base
  has_many :listings, dependent: :destroy
  
  validates :category, presence: true
end
