class AccessController < ApplicationController

  # before_action :vierify_login, only: [:index, :logout, :users, :create]
  def index
  end

  def login
  end

  def login_form
    if params[:email].present? && params[:password].present?
      look_for = User.where(:email => params[:email]).first
      if look_for
        verify = look_for.authenticate(params[:password])
      end
    end
    if verify

      session[:email_id] = verify.id
      session[:email] = verify.email
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Niepoprawna nazwa użytkownika lub hasło"
      redirect_to(:action => 'login')
    end
  end

  def logout
    session[:email_id] = nil
    session[:email] = nil
    redirect_to(:back)
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
      flash[:notice] = "Niepoprawnie wypełnione pola"
    end
  end

  def new_user_parametrs
    params.require(:create_new_user).permit(:user_name, :password, :password_confirmation, :first_name, :second_name, :email, :phone)
  end
end
