class Gallery < ActiveRecord::Base
  attr_accessible :name
  has_many :photos, :dependent => :destroy 
  validates_presence_of :name
  validates_uniqueness_of :name
  #accepts_nested_attributes_for :photo

  def at_least_one_photo?
    self.photos.present?
  end

end
