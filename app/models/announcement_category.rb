class AnnouncementCategory < ActiveRecord::Base
  has_many :announcements

  scope :visible, lambda{where(:visible => true)}
  scope :invisible, lambda{where(:visible => false)}
  scope :sortASC, lambda{order("announcement_categories.position ASC")}
  scope :sortNew, lambda{order("announcement_categories.created_at DESC")}

end
