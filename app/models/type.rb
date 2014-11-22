class Type < ActiveRecord::Base
  has_many :listings, dependent: :destroy
  has_many :solds, dependent: :destroy
  
  validates :category, presence: true
end
