class Information < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader

  has_many :Locations
  has_many :provinces

  validates_presence_of :location_id, :province_id
end
