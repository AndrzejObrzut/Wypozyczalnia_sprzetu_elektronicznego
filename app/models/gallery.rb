class Gallery < ActiveRecord::Base
  belongs_to :announcement


  scope :sortOldGallery, lambda{order("galleries.created_at ASC")}
end
