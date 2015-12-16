class User < ActiveRecord::Base
  has_secure_password

  scope :sortNew, lambda{order("users.created_at DESC")}

end
