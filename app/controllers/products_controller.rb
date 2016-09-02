class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action :product_params, only: [:create, :update]
  before_action :authorize!, only: [:update, :edit, :destroy]

  def index
    @limit ||= 25
    @charlim ||= 50
    @query = params[:query]
    @products = Product.search(params[:query])
    @products = @products.order(created_at: :desc, id: :desc).page(params[:page]).per(@limit)
  end

  def new
    @category = Category.all.collect {|c| [c.name, c.id]}
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    @product.user = current_user
    if @product.save
      redirect_to products_path, notice: 'Product added successfully.'
    else
      render :new, alert: @product.errors.full_messages.join(', ')
    end
  end

  def show
    if user_signed_in?
      @reviews = @product.reviews
      @review = Review.new
    else
      redirect_to new_session_path
    end
  end

  def edit
    @category = Category.all.collect {|c| [c.name, c.id]}
  end

  def update
    if @product.update product_params
      redirect_to product_path(@product), notice: "Product Updated Successfully"
    else
      render :edit, alert: @product.errors.full_messages.join(', ')
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: 'Product Deleted Successfully'
  end

  private

  def find_product
    @product = Product.find params[:id]
  end

  def product_params
    params.require(:product).permit([:title, :description, :price, :category_id])
  end

  def error_messages
    @product.errors.full_messages.join(', ')
  end

  def authorize!
    redirect_to product_path(@product), alert: 'Access Denied' unless can? :manage, @product
  end
end
