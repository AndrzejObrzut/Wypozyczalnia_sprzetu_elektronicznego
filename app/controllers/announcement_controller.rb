class AnnouncementController < ApplicationController

  before_action :verify_login, only: [:add, :edit, :update, :delete, :drop]
  before_action :admin_login, only: [:index]

  def index
    @announcements = Announcement.sortNew
  end

  # Pokaż wszystkie z danej kategoii
  def view_by_category
    @announcements = Announcement.sortNew
    @category = AnnouncementCategory.find(params[:id])
  end

  # Pokaż dane ogłoszenie
  def show
    @announcement = Announcement.find(params[:id])
  end

  def show_user_announcement
    @announcements = Announcement.sortNew
    @user = User.find(params[:id])

  end

  # Obsługa dodawania nowego ogłoszenia
  def add
    @announcement = Announcement.new({:price_per_day => "0", :price_per_hour =>"0"})
    @categories = AnnouncementCategory.all

    #WYCIĄGAM Z SESJI ID UŻYTKOWNIKA I PRZEKAZUJE DO FORMULARZA
    @user_id = User.find(params[:id]).id
  end

  def create
    @announcement = Announcement.new(announcement_param)
    @announcement.update_attributes(:user_id => session[:user_id])
    if @announcement.save
      redirect_to(:controller => 'welcome', :action => 'index')
    else
      @categories = AnnouncementCategory.all
      render('add')
    end
  end

  # Obsługa edycji ogłoszenia
  def edit
    @announcement = Announcement.find(params[:id])
    @categories = AnnouncementCategory.all
  end

  def update
    @announcement = Announcement.find(params[:id])
    if @announcement .update_attributes(announcement_param)
      redirect_to(:action=>'index', :id => @announcement.id)
    else
      @categories = AnnouncementCategory.all
      render('edit')
    end
  end

  def delete
    @announcement = Announcement.find(params[:id])
  end

  def drop
    announcement = Announcement.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end

  def announcement_param
    # DODAŁEM :user_id, brak zapisu w bazie danych user_id, reszta przechodzi :/
    params.require(:announcement).permit(:announcement_category_id, :title, :description, :price_per_hour, :price_per_day)
  end
end
