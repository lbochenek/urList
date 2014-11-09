module ListingsHelper
  def price(listing)
    if listing.price.nil?
      "???"
    else
      '%.2f' % listing.price
    end
  end
end
