require 'carrierwave'

CarrierWave.configure do |config| 
  config.fog_credentials = { 
     :provider               => 'AWS', 
     :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'], 
     :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],
     :region                 => 'us-east-1'
   } 
  config.fog_directory  = 'plingo-test' 
  config.fog_host       = 'https://plingo-test.s3.amazonaws.com'
  config.fog_public     = true
  config.fog_attributes = {"Content-Disposition" => "attachment;"}
  #config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end