class AnnouncementCategory < ActiveRecord::Base
  has_many :announcements
end
