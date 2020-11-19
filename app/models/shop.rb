class Shop < ApplicationRecord
  before_save { self.email.downcase }
  mount_uploader :shop_img, ShopImgUploader
  belongs_to :prefecture
  belongs_to :city
  has_one :shop_desc
  EMAIL_VALID_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: { maximum: 50 }
  validates :email,    presence: true, length: { maximum: 255 }, format: { with: EMAIL_VALID_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password
  
end
