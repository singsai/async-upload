class Avatar < ActiveRecord::Base
  attr_accessible :avatar_file, :photo_id
  belongs_to :photo
  #accepts_nested_attributes_for :photo
  
  mount_uploader :avatar_file, AvatarFileUploader
  
  validates :avatar_file, :presence => true
end
