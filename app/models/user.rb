class User < ActiveRecord::Base
  attr_accessor :token

	validates :name, presence: true, length: { maximum: 50 }
	validates :email, presence: true, length: { maximum: 255}

	has_secure_password

  has_many :posts

	# Returns the hash digest of the given string.
  def User.digest(string)
  	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.token = User.new_token
    update_attribute(:remember_token, User.digest(token))
  end

  def authenticated?(token)
    return false if remember_token.nil?
    BCrypt::Password.new(remember_token).isPassword?(token)
  end  

  def forget
    update_attribute(:remember_token, nil)
  end
  
end
