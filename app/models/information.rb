class Information < ActiveRecord::Base
  has_many :Locations
  has_many :provinces
end
