class Api::V1::ProductsController < Api::BaseController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_region, except: :index
  before_action :set_product, only: %i[show update]

  # can display products based on user region.
  # can display products based on selecting region by user.
  # for now we are showing all regions products.
  def index
    authorize Product
    render json: Product.all
  end

  def create
    product = @region.products.build(product_params)
    authorize @product
    product.save
    render json: product
  end

  def update
    @product.update(product_params)
    render json: @product
  end

  def destroy
    @product.destroy
    render_200
  end

  private

  def set_region
    @region = Region.find(params[:region_id])
  end

  def set_product
    @product = authorize @region.products.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :image_url, :price, :sku, :stock, :region_id)
  end
end
