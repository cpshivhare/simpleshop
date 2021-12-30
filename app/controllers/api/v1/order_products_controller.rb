class Api::V1::OrderProductsController < Api::BaseController
  before_action :current_inprogress_order

  def create
    order_product =
      if existing_product?
        add_quantity
      else
        @current_inprogress_order.order_products.create!(order_product_params)
      end

    authorize order_product

    render json: @current_inprogress_order.order_products
  end

  def index
    authorize OrderProduct
    render json: @current_inprogress_order
  end

  private

  def add_quantity
    @existing_product&.add_quantity!(params.dig(:order_product, :quantity))
    @existing_product
  end

  def existing_product?
    @existing_product = @current_inprogress_order.order_products.find_by_product_id(params.dig(:order_product,
                                                                                               :product_id))
  end

  # trying to get current inprogress order.
  # if it's not present will create new one with default status inprogress.
  def current_inprogress_order
    @current_inprogress_order = current_user.current_inprogress_order
    return if @current_inprogress_order

    @current_inprogress_order = current_user.orders.create!(shipping_address: current_user.default_shipping_address)
  end

  def order_product_params
    params.require(:order_product).permit(:product_id, :quantity)
  end
end
