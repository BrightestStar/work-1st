class Province < ActiveRecord::Base
  belongs_to :information
  belongs_to :user
  
  validates_presence_of :name

end
