class PhotosController < ApplicationController

  @@test = ""
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
    #
    # puts @photo.mime_type, "===="
    # puts @photo.data.class, "===="
    send_data @photo.data,
              type: @photo.mime_type,
              filename: @photo.filename,
              disposition: "attachment"

  end


  def download
    @photo = Photo.find params[:id]
    send_data @photo.data, filename: @photo.filename, type: @photo.mime_type, disposition: 'attachment'
  end

  def new
    @photo = Photo.new
  end

  def create
    # build a photo and pass it into a block to set other attributes
    # puts photo_params
    cos = photo_params
    puts cos, "========"
    @photo = Photo.new(photo_params)
    @photo.update_attributes(:filename => @photo.data.original_filename)
    @photo.update_attributes(:mime_type => @photo.data.content_type)
    @photo.update_attributes(:data => @photo.data.read)
    @photo.update_attributes(:size => @photo.data.size)

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
