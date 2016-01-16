class Photo < ActiveRecord::Base
  belongs_to :announcement

  scope :sortOldPhotos, lambda{order("photos.created_at ASC")}
end
