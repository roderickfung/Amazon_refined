class ReviewsController < ApplicationController
  before_action :find_product, except: [:update]
  before_action :find_review, only: [:edit, :show, :destroy]

  def new
    @product = Product.find params[:id]
  end

  def create
    @product = Product.find params[:product_id]
    @review = Review.new review_params
    @review.product_id = @product.id
    respond_to do |format|
      if @review.save
        format.html{
          redirect_to product_path(@product.id), notice: 'Review Saved'
        }
        format.js{
          puts '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
          render :create
          puts '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
        }
      else
        format.html{
          redirect_to product_path(@product.id), alert: 'Review Not Saved'
        }
        format.js{

        }
      end
    end
  end

  def edit

  end

  def update

  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html{
        redirect_to product_path(@product), notice: "Review Deleted Successfully"
      }
      format.js{
        render
      }
    end
  end

  private

  def find_product
    @product = Product.find params[:product_id]
  end

  def find_review
    @review = Review.find params[:id]
  end

  def review_params
    params.require(:review).permit(:body, :star_count)
  end
end
