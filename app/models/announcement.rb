class Announcement < ActiveRecord::Base
  belongs_to :announcement_category

  scope :sortNew, lambda{order("announcements.created_at DESC")}

end
