class Follower < ActiveRecord::Base
  attr_protected :id

  belongs_to :follower, class_name: 'Device'
  belongs_to :follow, class_name: 'Device'

end
