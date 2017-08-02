class Location < ActiveRecord::Base
  belongs_to :information
  validates_presence_of :name, :url01 
end
