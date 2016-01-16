class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
    @announcements = Announcement.all
  end

  def create
    puts photo_param
    @photo = Photo.new(photo_param)
    if @photo.save
      redirect_to(:action=>'index')
    else
      flash[:notice] = "Błąd w podawaniu danych"
      render('new')
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(categories_parameters)
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

  def photo_param
    params.require(:photo).permit(:announcement_id)
  end
end
