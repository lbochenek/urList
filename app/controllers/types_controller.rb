class TypesController < ApplicationController
  def show
    @type = Type.find(params[:id])
    @listings = @type.listings.all
    # @listings = @type.listings.paginate(page: params[:page])
    
    respond_to do |format|
      format.html
      format.js
    end  
  end
    
end
