class AccessController < ApplicationController
  def index
  end

  def login
  end

  def registration
    @new_user = User
  end

  def users
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
