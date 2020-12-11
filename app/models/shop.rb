class Shop < ApplicationRecord
  before_save { self.email.downcase }
  mount_uploader :shop_img, ShopImgUploader
  belongs_to :prefecture
  belongs_to :city
  has_one :shop_desc
  has_many :products
  EMAIL_VALID_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name,     presence: true, length: { maximum: 50 }, on: :create
  validates :name,     presence: true, on: :update, allow_blank: true
  validates :email,    presence: true, length: { maximum: 255 }, format: { with: EMAIL_VALID_REGEX }, uniqueness: { case_sensitive: false },on: :create
  validates :email,    presence: true, on: :update, allow_blank: true
  validates :password, presence: true, length: { minimum: 6 },on: :create
  validates :password, presence: true, on: :update, allow_blank: true
  has_secure_password
  
end

