class User < ActiveRecord::Base
  before_save {self.email = email.downcase}


  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost

    BCrypt::Password.create(string, cost: cost)
  end
  has_secure_password
end
