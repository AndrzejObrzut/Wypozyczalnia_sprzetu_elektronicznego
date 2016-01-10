class User < ActiveRecord::Base

  validates :user_name,
            uniqueness: true,
            presence: true

  validates :password_digest,
            presence: true

  validates :first_name,
            length: {minimum: 1, maximum: 100},
            presence: true

  validates :second_name,
            length: {minimum: 1, maximum: 100},
            presence: true

  validates :email,
            uniqueness: true,
            presence: true

  validates :phone,
            presence: true

  has_secure_password
  scope :sortNew, lambda{order("users.created_at DESC")}

end
