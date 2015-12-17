class AnnouncementController < ApplicationController
  def index
    @announcements
  end

  def view
    @announcements = Announcement.sortNew
  end

  def add
    @new_announcement = Announcement
    @category = AnnouncementCategory.all
  end

  def create
    @announcement = Announcement.new(announcement_param)
    if @announcement.save
      flash[:notice] = "Ogłosznie zostało pomyślnie utworzone"
      redirect_to(:controller => 'welcome', :action => 'index')
    else
      @category = AnnouncementCategory.all
      render('new')
    end
  end


  def edit
  end

  def delete
  end

  def announcement_param
    params.require(:announcement).permit(:announcement_category_id, :title, :description, :price_per_hour, :price_per_day)
  end
end
