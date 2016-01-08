class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  private

  def verify_login
    unless session[:email_id]
      flash[:notice] = "Jesteś niezalogowany"
      redirect_to(:controller => 'access', :action => 'login')
      return false
    else
      return true
    end
  end

  def admin_login
    unless session[:email_id]
      flash[:notice] = "Jesteś niezalogowany"
      redirect_to(:controller => 'access', :action => 'login')
      return false
    else
      unless session[:is_admin]
        redirect_to(:controller => 'welcome', :action => 'index')
        return false
      else
      return true
    end
    end
  end

end
