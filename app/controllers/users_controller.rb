class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]
      
  def index
    @users = User.paginate(page: params[:page])
  end  
    
  def show
    @user = User.find(params[:id])
    @listings = @user.listings.paginate(page: params[:page])
  end
  
  def new
    @user = User.new
  end
  
  def create
      @user = User.new(user_params)
      if @user.save
        log_in @user
        flash[:success] = "Welcome!"
        redirect_to @user
      else
        render 'new'
      end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    # flash[:success] = "User deleted"
    respond_to do |format|
      format.html { redirect_to users_url }
      format.js
    end  
    # redirect_to users_url
  end

  private

      def user_params
        params.require(:user).permit(:fName, :lName, :email, :sID, :classYr,
                                     :password, :password_confirmation)
      end
      
     
      

      def correct_user
        @user = User.find(params[:id])
        unless current_user?(@user)
          flash[:danger] = "You do not have permission to access this page"
          redirect_to(root_url)
        end
      end
end
