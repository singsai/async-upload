class PhotoFileUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  # if Rails.env.development?
  #     storage :file
  # else
      storage :fog
  # end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # version :thumb do
  #   # process :resize_to_fill => [120, 120]
  # end
  # 
  # version :medium do
  #   # process :resize_to_fit => [nil, 540]
  #   
  # end

  def extension_white_list
    %w(mp3 wma wav)
  end
  


end
