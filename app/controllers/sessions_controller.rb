class SessionsController < ApplicationController
  
  def new
    respond_to do |format|
      format.html
      format.js
    end  
  end  
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if(user)
      @user = user
      @listings = user.listings.all
      @solds = user.solds.all
    end
    
    if user && user.authenticate(params[:session][:password])
      log_in user
      remember user
      respond_to do |format|
        format.html { redirect_back_or user }
        format.js
      end
      # redirect_back_or user
    else
      # flash.now[:danger] = 'Invalid email/password combination'
      # render 'new'
      respond_to do |format|
        format.html { render 'new' }
        format.js { render js: '$("#login_error").empty();
          $("#login_error").append("Invalid email/password combination");' }
      end
    end
  end
  
  def destroy
    log_out if logged_in?
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end  
    # redirect_to root_url
  end

    
end
