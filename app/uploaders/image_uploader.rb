require 'carrierwave/orm/activerecord'

class ImageUploader < CarrierWave::Uploader::Base
  def store_dir
    File.join(ENV['SIN_ROOT'],'/public/uploads')
  end

  def cache_dir
    File.join(ENV['SIN_ROOT'],'/tmp')
  end
  
  storage :file
end