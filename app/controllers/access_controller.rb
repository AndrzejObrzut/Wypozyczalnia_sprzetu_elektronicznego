class AccessController < ApplicationController

  before_action :admin_login, only: [:users, :index]
  before_action :verify_login, only: [:edit, :update, :change_password, :password]

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
      session[:user_id] = verify.id
      session[:email] = verify.email
      session[:is_admin] = verify.is_admin
      redirect_to(:controller => 'welcome', :action=>'index')
    else
      flash[:notice] = "Niepoprawna nazwa użytkownika lub hasło"
      redirect_to(:action => 'login')
    end
  end

  def logout
    session[:user_id] = nil
    session[:email] = nil
    session[:is_admin] = nil
    redirect_to(:back)
  end

  def give_admin
    @new_user = User.find(params[:id])
    @new_user.update_attributes(:is_admin => "true")
    redirect_to(:action=>'users')
  end

  def take_admin
    @new_user = User.find(params[:id])
    @new_user.update_attributes(:is_admin => "false")
    redirect_to(:action=>'users')
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
      session[:user_id] = nil
      session[:email] = nil
      session[:is_admin] = nil
      session[:user_id] = @create_new_user.id
      session[:email] = @create_new_user.email
      redirect_to(:controller => 'welcome', :action=>'index')
    else
      flash[:notice] = "Niepoprawnie wypełnione pola"
      render('registration')
    end
  end

  def edit
    @update_user = User.find(params[:id])
  end

  def update
    @update_user = User.find(params[:id])
    if @update_user.update_attributes(update_parametrs)
      redirect_to(:controller => 'welcome', :action=>'index')
    else
      flash[:notice] = "Niepoprawnie wypełnione pola"
      render('edit')
    end
  end

  def change_password
    @update_password = User.find(params[:id])
  end

  def password
    if params[:old_password].present?
      look_for = User.where(:email => session[:email]).first
      if look_for
        verify = look_for.authenticate(params[:old_password])
      end
    end
    if verify
      if look_for.update_attributes(:password => params[:password]) && look_for.update_attributes(:password_confirmation => params[:password_confirmation])
        redirect_to(:controller => 'welcome', :action=>'index')
      else
        flash[:notice] = "Niepoprawnie wypełnione pola"
        redirect_to(:action=>'change_password', :id => session[:user_id])
      end
    else
      flash[:notice] = "Niepoprawne hasło"
      redirect_to(:action=>'change_password', :id => session[:user_id])
    end
  end

  def new_user_parametrs
    params.require(:create_new_user).permit(:user_name, :password, :password_confirmation, :first_name, :last_name, :email, :phone, :birth_date, :regulations_accepted)
  end

  def update_parametrs
    params.require(:update_user).permit(:first_name, :last_name, :phone, :birth_date)
  end

  def update_password_parametrs
    params.require(:update_user).permit(:password, :password_confirmation)
  end

end
