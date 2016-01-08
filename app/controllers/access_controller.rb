class AccessController < ApplicationController

  before_action :admin_login, only: [:users, :index]

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
      session[:is_admin] = verify.is_admin
      redirect_to(:controller => 'welcome', :action=>'index')
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
      session[:email_id] = @create_new_user.id
      session[:email] = @create_new_user.email
      redirect_to(:controller => 'welcome', :action=>'index')
    else
      flash[:notice] = "Niepoprawnie wypełnione pola"
      render('registration')
    end
  end

  def edit
    @new_user = User.find(params[:id])
    @new_user.update_attributes(:is_admin => "true")
    redirect_to(:action=>'users')
  end

  def update
    @new_user = User.find(params[:id])
    if @new_user.update_attributes(new_user_parametrs)
      redirect_to(:action=>'index', :id => @new_user.id)
    else
      flash[:notice] = "Niepoprawnie wypełnione pola"
      render('edit')
    end
  end

  def new_user_parametrs
    params.require(:create_new_user).permit(:user_name, :password, :password_confirmation, :first_name, :second_name, :email, :phone)
  end

end
