class AnnouncementController < ApplicationController
  def index
    @announcements
  end

  def view
  end

  def add
    @new_announcement = Announcement
  end

  def create
    @announcements = Announcement.new(announcements_param)
    @announcement_category = AnnouncementCategory.order('pozycja ASC')
    @countr = Announcement.count + 1
    if @announcements.save
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end


  def edit
  end

  def delete
  end

  def announcements_param
    params.require(:announcement).permit(:title, :description, :price_per_hour, :price_per_day)
  end
end
