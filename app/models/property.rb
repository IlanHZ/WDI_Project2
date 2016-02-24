require 'carrierwave/orm/activerecord'
require_relative '../uploaders/profile_pic_uploader'


class Property < ActiveRecord::Base
  validates :address1, presence: true
  validates :postcode, presence: true
  validates :lat, presence: true
  validates :lng, presence: true
  
  belongs_to :user

  mount_uploader :profile_pic, ProfilePicUploader
end
