class ApplicationController < ActionController::Base
  before_filter :get_types
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.  
  protect_from_forgery with: :null_session
   include SessionsHelper
   
  def get_types
    @types = Type.all
  end  

  private
   
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url        
      end
    end


end


