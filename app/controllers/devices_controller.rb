class DevicesController < ApplicationController
  before_action :get_device

  # params: battery_level, battery_scale, gps_latitude, gps_longitude
  def report_datum
    @device.device_data.create!(params.slice(:battery_level, :battery_scale, :gps_latitude, :gps_longitude))
    head :ok
  end

  def follows_latest
    response = @device.as_response_hash
    response[:people_data] = @device.follows_latest_data
    render json: response
  end

  def get_code
    render json: @device.as_response_hash
  end

  # params: follower_code
  def add_follower
    new_follower_device = Device.where(code: params[:follower_code]).first

    if new_follower_device.present? && !@device.follower_devices.where(id: new_follower_device.id).exists?
      @device.followers.create! follower_id: new_follower_device.id
    end

    head :ok
  end

  # params: device_id, name
  def get_device
    @device = Device.find_or_initialize_by(device_id: params[:device_id])
    @device.name = params[:name] if params[:name].present?
    @device.save!
  end
end
