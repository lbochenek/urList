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
      respond_to do |format|
        format.html { redirect_to root_url }
        format.js
      end
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @listing.destroy
    flash[:success] = "Listing deleted"
    
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url}
      format.js
    end  
    # redirect_to request.referrer || root_url
  end

  def edit
    @listing = Listing.find(params[:id])
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end
  
  def update
    @listing = Listing.find(params[:id])
    if @listing.update_attributes(listing_params)
      flash[:success] = "Profile updated"
      # respond_to do |format|
  #       format.html { redirect_to @listing }
  #       format.js
  #     end
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
