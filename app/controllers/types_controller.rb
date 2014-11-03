class TypesController < ApplicationController
  def show
    @type = Type.find(params[:id])
    @listings = @type.listings.paginate(page: params[:page])
  end
    
end
