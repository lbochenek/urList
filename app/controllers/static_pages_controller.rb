class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @listing = current_user.listings.build
      @feed_items = Listing.all
    end
  end
  
end
