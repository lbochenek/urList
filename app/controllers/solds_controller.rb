class SoldsController < ApplicationController
  def sold_listing
    @listing = Listing.find(params[:id])
    @user = @listing.user
    @listings = @user.listings.all
    @solds = @user.solds.all
    @soldlisting = current_user.solds.build(title:@listing.title, content:@listing.content, price:@listing.price, user:@listing.user, type:@listing.type, picture:@listing.picture)
    @soldlisting.created_at = @listing.created_at
    if @soldlisting.save
<<<<<<< HEAD
      @listing.destroy
=======
>>>>>>> picture-styling
      respond_to do |format|
        # format.html { redirect_to root_url }
        format.js
      end
<<<<<<< HEAD
=======
      @listing.destroy
>>>>>>> picture-styling
     # redirect_to root_url
    else
      respond_to do |format|
        # format.html { render 'static_pages/home' }
        format.js { render template: "solds/sold_listing_errors.js.erb" }
      end
      # render 'static_pages/home'
    end
  end    

  def show
    @sold = Sold.find(params[:id])
    respond_to do |format|
      # format.html
      format.js
    end
  end    
  
  
  private

    def listing_params
      params.require(:sold).permit(:title, :content, :price, :type_id, :picture)
    end

    def correct_user
      @soldlisting = current_user.listings.find_by(id: params[:id])
      redirect_to root_url if @soldlisting.nil?
    end
  
end
