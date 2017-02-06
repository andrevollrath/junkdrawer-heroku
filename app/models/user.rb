class User < ActiveRecord::Base
  has_secure_password
  has_many :junks
  has_many :tags, through: :junks
end