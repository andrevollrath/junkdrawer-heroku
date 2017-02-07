class User < ActiveRecord::Base
  has_secure_password
  has_many :junks
  has_many :tags, through: :junks

  def self.invalid_params(p)
    p[:username].empty? || 
    p[:email].empty? || 
    p[:password].empty?
  end

end