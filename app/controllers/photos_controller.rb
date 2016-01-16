class PhotosController < ApplicationController

  before_action :verify_login, only: [:new, :edit, :update, :delete, :drop, :create]
  before_action :admin_login, only: [:index]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
    @announcements = Announcement.all
  end

  def create
    @photo = Photo.new(photo_parameters)
    if @photo.save
      redirect_to(:action=>'index')
    else
      flash[:notice] = "Błąd w podawaniu danych"
      @announcements = Announcement.all
      render('new')
    end
  end

  def edit
    @photo = Photo.find(params[:id])
    @announcements = Announcement.all
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(photo_parameters)
      redirect_to(:action=>'index')
    else
      render('edit')
    end
  end

  def show
  end

  def delete
    @photo = Photo.find(params[:id])
  end

  def drop
    photo = Photo.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end

  def photo_parameters
    params.require(:photo).permit(:announcement_id, :image)
  end

end
