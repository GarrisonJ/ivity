class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.create(params[:favorite])
    @happening = @favorite.happening
    render :toggle
  end

  def destroy
    favorite = Favorite.find(params[:id]).destroy
    @happening = favorite.happening
    render :toggle
  end
end
