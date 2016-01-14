class User < ActiveRecord::Base
  has_many :announcements

  validates :user_name,
            uniqueness: {:message => "Nazwa użytkownika jest zajęta"},
            presence: {:message => "Wpisz nazwę użytkownika"}


  validates :password,
            presence: true,
            confirmation: {:message => "Wpisz hasło i poprawnie go potwierdź"}


  validates :first_name,
            length: {minimum: 1, maximum: 100, :message => "Imię musi zawierać od 1 do 100 znaków"}

  validates :second_name,
            length: {minimum: 1, maximum: 100, :message => "Nazwisko musi zawierać od 1 do 100 znaków"}

  validates :email,
            uniqueness: {:message => "Email jest zajęty"},
            presence: {:message => "Wpisz email"}

  validates :phone,
            presence: {:message => "Wpisz numer telefonu"}

  has_secure_password
  scope :sortNew, lambda{order("users.created_at DESC")}

end
