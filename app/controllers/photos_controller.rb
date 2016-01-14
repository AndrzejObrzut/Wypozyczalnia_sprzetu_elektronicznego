class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
    # send_data(@photo.data,
    #             :filename => @photo.name,
    #             :type => @photo.mime_type,
    #             :disposition => "inline")
    # send_data(@photo.data,
    #               :type => @photo.mime_type,
    #               :filename => @photo.filename,
    #               :disposition => "inline")

    send_data @photo.data, type: @photo.mime_type, filename: @photo.filename, disposition:"inline"

 end

  def new
    @photo = Photo.new
  end

  def create

    # build a photo and pass it into a block to set other attributes
    @photo = Photo.new(photo_params)
    @photo.update_attributes(:filename => @photo.data.original_filename)
    @photo.update_attributes(:mime_type => @photo.data.content_type)

    # normal save
    if @photo.save
      redirect_to(:controller => 'photos', :action => 'index')
    else
      render :action => "new"
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to(photos_url)
  end

  def photo_params
    params.require(:photo).permit(:name, :data)
  end
end
