require 'carrierwave/orm/activerecord'
require_relative '../uploaders/profile_pic_uploader'


class User < ActiveRecord::Base
  include BCrypt
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  
  has_secure_password   
  belongs_to :property

  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"
  has_many :received_messages, class_name: "Message", foreign_key: "recipient_id"

  mount_uploader :profile_pic, ProfilePicUploader

end
