class ListingsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
 
  def show
    @listing = Listing.find(params[:id])
  end  
   
   def create
    @listing = current_user.listings.build(listing_params)
    if @listing.save
      flash[:success] = "Listing created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @listing.destroy
    flash[:success] = "Listing deleted"
    redirect_to request.referrer || root_url
  end

  def edit
    @listing = Listing.find(params[:id])
  end
  
  def update
    @listing = Listing.find(params[:id])
    if @listing.update_attributes(listing_params)
      flash[:success] = "Profile updated"
      redirect_to @listing
    else
      render 'edit'
    end
  end

    private

      def listing_params
        params.require(:listing).permit(:title, :content, :price, :type_id)
      end

      def correct_user
        @listing = current_user.listings.find_by(id: params[:id])
        redirect_to root_url if @listing.nil?
      end

end
