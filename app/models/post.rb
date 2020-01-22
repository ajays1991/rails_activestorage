class Post < ApplicationRecord
  has_many_attached :images
  has_one_attached :avatar

  before_create :attach_avatar

  def attach_avatar
  	avatar.attach(io: File.open('/home/ajay/Pictures/cancelled_status.png'), filename: 'avatar.png')
  end
end
