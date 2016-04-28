class DeviceDatum < ActiveRecord::Base
  attr_protected :id

  belongs_to :device

  validates_presence_of :device_id

  def as_response_hash
    {
        battery_level: battery_level,
        battery_scale: battery_scale,
        gps_latitude: gps_latitude,
        gps_longitude: gps_longitude,
        updated_at: updated_at.to_i
    }
  end
end
