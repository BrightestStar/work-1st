class Province < ActiveRecord::Base
  belongs_to :information
  validates_presence_of :name
end
