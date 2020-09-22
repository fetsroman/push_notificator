class Api::DevicesController < ApiController
  before_action :authorize_request

  def create
    @device = @current_user.devices.create(device_params)

    if @device.save
      render status: :created
    else
      render json: @device.errors, status: :unprocessable_entity
    end
  end

  private

  def device_params
    params.permit(:token)
  end
end
