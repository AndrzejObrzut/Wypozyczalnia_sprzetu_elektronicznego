class AnnouncementCategory < ActiveRecord::Base
  has_many :announcements

  has_attached_file :image,
                    :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates_attachment_content_type :image,
                                    :content_type => /^image\/(png|jpeg)/,
                                    :message => "Złe rozszerzenie. Wymagane .png lub .jpeg"

  validates_attachment_size :image,
                            :in => 0..1.megabytes,
                            :message => "Maksymalny rozmiar to 1 mB"
  scope :sortASC, lambda{order("announcement_categories.position ASC")}
  scope :sortNew, lambda{order("announcement_categories.created_at DESC")}

end
