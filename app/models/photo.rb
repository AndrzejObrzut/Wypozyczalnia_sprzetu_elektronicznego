class Photo < ActiveRecord::Base
  belongs_to :announcement

  has_attached_file :image,
                    :styles => { :medium => "600x600>", :thumb => "200x200>" }

  validates_attachment_content_type :image,
                                    :content_type => /^image\/(png|jpeg)/,
                                    :message => "Złe rozszerzenie. Akceptuje .png lub .jpeg."

  validates_attachment_size :image,
                            :in => 0..1.megabyte,
                            :message => "Plik za duży. Maksymalnie 1 MB."

  scope :sortOldPhotos, lambda{order("photos.created_at ASC")}
end
