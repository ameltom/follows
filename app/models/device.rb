class Device < ActiveRecord::Base
  attr_protected :id

  has_many :device_data, dependent: :destroy
  has_many :followers, foreign_key: :follow_id, dependent: :destroy
  has_many :follows, class_name: 'Follower', foreign_key: :follower_id, dependent: :destroy
  has_many :follower_devices, class_name: 'Device', source: :follower, through: :followers
  has_many :follow_devices, class_name: 'Device', source: :follow, through: :follows

  CODE_OPTIONS = [('A'..'Z'), (0..9)].map(&:to_a).flatten

  validates_presence_of :name
  validates_presence_of :device_id
  validates_uniqueness_of :device_id

  before_create :set_code

  def set_code
    begin
      self.code = (0...5).map { CODE_OPTIONS.sample }.join
    end while Device.where(code: code).exists?
  end

  def follows_latest_data
    follow_devices.includes(:device_data).map do |fd|
      last_data = fd.device_data.last
      fd.as_response_hash.merge(last_data.as_response_hash)
    end
  end

  def as_response_hash
    {
        name: name,
        code: code
    }
  end
end
