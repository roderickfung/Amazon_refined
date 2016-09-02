def destroy
  @product.destroy
  respond_to do |x|
    x.html{
      redirect_to products_path, notice: 'Product Deleted Successfully'
    }
    x.js{
      render :destroy
    }
  end

end
