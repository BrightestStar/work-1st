class Information < ActiveRecord::Base

  mount_uploader :attachment, AttachmentUploader
  mount_uploaders :images, InformationImageUploader
  serialize :images, JSON

  has_many :Locations
  has_many :provinces

  validates_presence_of :location_id, :province_id

end
