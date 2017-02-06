class Tag < ActiveRecord::Base
  has_many :tags
  has_many :users, through: :junks
end
