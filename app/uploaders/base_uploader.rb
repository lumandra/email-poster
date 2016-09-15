# encoding: utf-8

class BaseUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  storage :file

  def extension_white_list
    %w(pdf)
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
