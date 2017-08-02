class Information < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader
  
  has_many :Locations
  has_many :provinces
end
