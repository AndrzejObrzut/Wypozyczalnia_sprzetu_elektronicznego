class Announcement < ActiveRecord::Base
  belongs_to :announcement_category
  belongs_to :user
  has_many :galleries


  validates :title,
            length: {minimum: 2, maximum: 100, :message => "Tytuł musi zawierać od 2 do 100 znaków."}

  validates :description,
            length: {minimum: 2, maximum: 1000, :message => "Opis musi zawierać od 2 do 1000 znaków."}

  validates :price_per_hour,
            :numericality => {:greater_than_or_equal_to  => 0, :message => "Cena za godzinę musi być liczbą większą bądź równą 0"}


  validates :price_per_day,
            :numericality => {:greater_than_or_equal_to => 0, :message => "Cena za dzień musi być liczbą większą bądź równą 0"}


  scope :sortNew, lambda{order("announcements.created_at DESC")}


  def self.search(search)
    if search
      where('title LIKE ? or description LIKE ?', '%' + search + '%', '%' + search + '%')
    else
      all
    end
  end
end
