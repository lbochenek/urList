class ListingsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  
  def show
    @listing = Listing.find(params[:id])
    respond_to do |format|
      # format.html
      format.js
    end  
  end  
   
   def create
    @listing = current_user.listings.build(listing_params)
    if @listing.save
      respond_to do |format|
        # format.html { redirect_to root_url }
        format.js
      end
      # redirect_to root_url
    else
      @feed_items = []
<<<<<<< HEAD
      has_picture = false
      has_only_picture = true
      @listing.errors.each do |attribute, error|
        if(attribute!=:picture)
          has_only_picture = false
        else
          has_picture = true
        end
      end
      if(has_picture)
        if(has_only_picture)
          respond_to do |format|
            format.js { render js: '$("#create-listing_error").empty();
                                $("#create-listing_error").append("Invalid image type; allowed types: jpg, jpeg, gif, png");' }
          end
        else
          @listing.errors.delete(:picture)
          respond_to do |format|
            format.js { render template: "listings/create_picture_errors.js.erb", locals: {listing: @listing} }
          end
        end
      else
        respond_to do |format|
          # format.html { render 'edit' }
          format.js { render template: "listings/create_errors.js.erb", locals: {listing: @listing} }
        end
=======
      respond_to do |format|
        # format.html { render 'static_pages/home' }
        format.js { render template: "listings/create_errors.js.erb" }
>>>>>>> picture-styling
      end
      # respond_to do |format|
      #   # format.html { render 'static_pages/home' }
      #   format.js { render template: "listings/create_errors.js.erb" }
      # end
      # render 'static_pages/home'
    end
  end

  def destroy
    @user = @listing.user
    @listings = @user.listings.all
    @solds = @user.solds.all
    @listing.destroy

    respond_to do |format|
      # format.html { redirect_to request.referrer || root_url}
      format.js
    end  
    # redirect_to request.referrer || root_url
  end

  def edit
    @listing = Listing.find(params[:id])
    respond_to do |format|
      # format.html
      format.js
    end
  end
  
  def update
    @listing = Listing.find(params[:id])
    if @listing.update_attributes(listing_params)
      @feed_items = Listing.all
      # @feed_items = Listing.paginate(page: params[:page])
      respond_to do |format|
        # format.html { redirect_to @listing }
        format.js
      end
      # redirect_to @listing
    else
      puts @listing.errors.full_messages
      has_picture = false
      has_only_picture = true
      @listing.errors.each do |attribute, error|
        if(attribute!=:picture)
          has_only_picture = false
        else
          has_picture = true
        end
      end 
<<<<<<< HEAD
      if(has_picture)
=======
      if(has_picture) 
>>>>>>> picture-styling
      # if(@listing.errors.include?(:picture))
        if(has_only_picture)
          respond_to do |format|
            # format.html { render 'edit' }
            # format.js { render template: "listings/update_errors.js.erb", locals: {listing: @listing} }
            format.js { render js: '$("#edit-listing_errors").empty();
                                $("#edit-listing_errors").append("Invalid image type; allowed types: jpg, jpeg, gif, png");' }
          end
        else
          @listing.errors.delete(:picture)
          respond_to do |format|
            # format.html { render 'edit' }
            format.js { render template: "listings/update_picture_errors.js.erb", locals: {listing: @listing} }
          end
        end
      else
        respond_to do |format|
          # format.html { render 'edit' }
          format.js { render template: "listings/update_errors.js.erb", locals: {listing: @listing} }
        end
      end
      # render 'edit'
      # respond_to do |format|
      #   # format.html { render 'edit' }
      #   format.js { render template: "listings/update_errors.js.erb", locals: {listing: @listing} }
      # end
    end
  end
  
  def remove_pic
    @listing = Listing.find(params[:id])
    user.remove_picture!
    @user.save
  end  

    private

      def listing_params
        params.require(:listing).permit(:title, :content, :price, :type_id, :picture, :remove_picture)
      end

      def correct_user
        @listing = current_user.listings.find_by(id: params[:id])
        redirect_to root_url if @listing.nil?
      end

end
