class WelcomeController < ApplicationController
  def index
      @categories = AnnouncementCategory.all
      @announcements = Announcement.sortNew
      if(params.has_key?(:id) && params.has_key?(:random))
        @id = params['id']
        @random = params[:random]
      end
  end

  #test test
  def sample
    @controller_message = "Hello From Welcome Controller"
  end

  def registration
      @new_user = User
  end

  def registerd
      @users = User.sortNew
  end

  def create
    @create_new_user = User.new(new_user_parametrs)
    if @create_new_user.save
      redirect_to(:action=>'index')
    else
      render('registration')
    end
  end

  def new_user_parametrs
    params.require(:create_new_user).permit(:user_name, :password, :password_confirmation, :first_name, :second_name, :email, :phone)
  end

end
