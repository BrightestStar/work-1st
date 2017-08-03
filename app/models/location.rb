class Location < ActiveRecord::Base
  belongs_to :information
  belongs_to :user
  validates_presence_of :name, :url01
end
