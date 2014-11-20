class Listing < ActiveRecord::Base
  # has_many :listings
  belongs_to :user
  belongs_to :type
  default_scope -> { order('created_at DESC') }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { minimum: 15, maximum: 1000 }
  validates :type_id, presence: true
  validate :picture_size
      
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end

end
