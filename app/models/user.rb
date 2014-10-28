class User < ActiveRecord::Base
    has_many :listings, dependent: :destroy
    attr_accessor :remember_token
    before_save {self.email = email.downcase}
    validates :fName, presence: true, length: {maximum: 50}
    validates :lName, presence: true, length: {maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@(rochester.edu|u.rochester.edu)+\z/i
    validates :email, presence: true, format: {with: VALID_EMAIL_REGEX},
                                      uniqueness: { case_sensitive: false }                                   
        
    validates :sID, presence: true, length: { is: 8 }, uniqueness: true, numericality: { only_integer: true }
    VALID_CLASSYR_REGEX = /\A(2015||2016||2017||2018)\z/
    validates :classYr, presence: true, format: {with: VALID_CLASSYR_REGEX}
    has_secure_password
    validates :password, length: {minimum: 6}, allow_blank: true
    
    def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                       BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
    
    def User.new_token
      SecureRandom.urlsafe_base64
    end
    
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end
    
    def authenticated?(remember_token)
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
    
    def forget
        update_attribute(:remember_digest, nil)
    end
    
    def feed
       Listing.where("user_id = ?", id)
    end
  
end
