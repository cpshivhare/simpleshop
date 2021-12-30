class Api::V1::RegionsController < Api::BaseController
  before_action :set_region, only: %i[show update destroy]

  def index
    authorize Region
    render json: Region.all
  end

  def create
    region = Region.new(regions_params)
    authorize region

    region.save!
    render json: region
  end

  def show
    render json: @region
  end

  def update
    @region.update(regions_params)
    render json: @region
  end

  def destroy
    @region.destroy
    render_200
  end

  private

  def set_region
    @region = authorize Region.find(params[:id])
  end

  def regions_params
    params.require(:region).permit(:title, :country, :currency, :tax)
  end
end
