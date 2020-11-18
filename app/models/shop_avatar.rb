class ShopAvatar < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  belongs_to :shop
  validates :content, presence: true, length: { maximum: 6000}, on: :update, allow_blank: true
end
