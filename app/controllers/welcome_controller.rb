class WelcomeController < ApplicationController
  def index
      @photos = Photo.sortOldPhotos
      @categories = AnnouncementCategory.all
      @announcements = Announcement.sortNew
      if(params.has_key?(:id) && params.has_key?(:random))
        @id = params['id']
        @random = params[:random]
      end
  end
end
