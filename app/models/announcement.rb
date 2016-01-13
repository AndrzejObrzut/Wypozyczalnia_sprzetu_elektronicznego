class Announcement < ActiveRecord::Base
  belongs_to :announcement_category
  belongs_to :user


  validates :title,
            length: {minimum: 2, maximum: 100, :message => "Tytuł musi zawierać od 2 do 100 znaków."},
            presence: true

  validates :description,
            length: {maximum: 1000, :message => "Opis nie może być dłuższy niż 1000 znaków."},
            presence: true

  validates :price_per_hour,
            :numericality => {:greater_than => 0},
            presence: true

  validates :price_per_day,
            presence: false,
            :numericality => true

  scope :sortNew, lambda{order("announcements.created_at DESC")}


  def self.search(search)
    if search
      where('title LIKE ?', '%' + search + '%')
    else
      all
    end
  end
end
