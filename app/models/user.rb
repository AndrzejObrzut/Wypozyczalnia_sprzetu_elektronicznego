class User < ActiveRecord::Base
  has_many :announcements

  validates :user_name,
            uniqueness: {:message => "Nazwa użytkownika jest zajęta"},
            presence: {:message => "Proszę wpisać nazwę użytkownika"}


  validates :password,
            presence: true,
            confirmation: {:message => "Proszę wpisać hasło i poprawnie go potwierdzić"}


  validates :first_name,
            length: {minimum: 1, maximum: 100, :message => "Proszę wpisać imię zawierające od 1 do 100 znaków"}

  validates :last_name,
            length: {minimum: 1, maximum: 100, :message => "Proszę wpisać nazwisko zawierające od 1 do 100 znaków"}

  validates :email,
            uniqueness: {:message => "Email jest zajęty"},
            presence: {:message => "Proszę wpisać email"}

  validates :phone,
            presence: {:message => "Proszę wpisać numer telefonu"}

  validates :regulations_accepted,
            presence: {:message => "Proszę zaakceptować regulamin"}

  has_secure_password
  scope :sortNew, lambda{order("users.created_at DESC")}

end
