class Listing < ActiveRecord::Base
  # has_many :listings
  belongs_to :user
  belongs_to :type
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :type_id, presence: true

end
