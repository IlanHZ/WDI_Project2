require 'carrierwave/orm/activerecord'
require_relative '../uploaders/profile_pic_uploader'


class Property < ActiveRecord::Base
  belongs_to :user


  mount_uploader :profile_pic, ProfilePicUploader
end
