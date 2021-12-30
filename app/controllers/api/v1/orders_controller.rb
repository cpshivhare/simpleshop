class Api::V1::OrdersController < Api::BaseController
  before_action :set_order, except: :index

  def create; end

  def show
    authorize @order
    render json: @order
  end

  def update
    authorize @order
    @order.update!(permit_order_params)

    render json: @order
  end

  def index; end

  private

  def set_order
    @order =
      if params[:id] == 'current_inprogress'
        current_user.current_inprogress_order
      else
        current_user.orders.find(params[:id])
      end
  end

  def permit_order_params
    params.require(:order).permit(
      :receiver_name,
      :status,
      shipping_address_attributes: %i[
        id address_1 address_2 country city state zipcode telephone default user_id
      ]
    )
  end
end
