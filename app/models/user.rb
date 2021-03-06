class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :information
  has_many :locations
  has_many :provinces

  validates_presence_of :username

   ROLES = ["admin", "consumer"] #consumer为普通用户

  def is_admin?
    self.role == "admin"
  end

end
