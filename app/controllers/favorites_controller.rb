class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product, only: [:create, :destroy]

  def create
    fav = Favorite.new user: current_user, product: @product
    if cannot? :favorite, @product
      redirect_to product_path(@product), alert: "Can't like your own question"
    else
      if fav.save
        redirect_to product_path(@product), notice: "Favorited"
      else
        redirect_to product_path(@product), alert: "You Fucked Up"
      end
    end
  end

  def destroy
    fav = Favorite.find params[:id]
    if can? :destroy, fav
      fav.destroy
      redirect_to product_path(@product), notice: "Favorite Removed"
    else
      redirect_to product_path(@product), alert: "access denied!"
    end
  end

  private

  def find_product
    @product = Product.find params[:product_id]
  end

end
