class User < ActiveRecord::Base

  validates :user_name, presence: true
  validates :password_digest, presence: true
  validates :first_name, presence: true
  validates :second_name, presence: true
  validates :email, presence: true
  validates :phone, presence: true

  has_secure_password
  scope :sortNew, lambda{order("users.created_at DESC")}

end
