module ListingsHelper
  #This method was written by our friend Chase Conklin
  def price(listing)
    if listing.price.nil?
      "???"
    else
      '%.2f' % listing.price
    end
  end
end
