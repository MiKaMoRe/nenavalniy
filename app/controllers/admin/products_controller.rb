class Admin::ProductsController < Admin::BaseController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(products_params)

    if @product.save
      redirect_to @product
    else
      flash[:alert] = @product.errors

      redirect_to new_admin_product_path
    end
  end

  private

  def products_params
    params.require(:product).permit(:article, :name, :price, :amount, :image)
  end
end
